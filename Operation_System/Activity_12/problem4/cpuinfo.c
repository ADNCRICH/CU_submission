// cpuinfo.c
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <asm/uaccess.h>
/* Needed by all modules */
/* Needed for KERN_INFO */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("KRERK PIROMSOPA, PH.D. <Krerk.P@chula.ac.th>");
MODULE_DESCRIPTION("\"cpuinfo\" Character Device");
#define DEVICENAME "cpuinfo"
static int dev_major;
static int dev_minor;
static int dev_open = 0;
static char *f_ptr;
static const char f_data0[] = "0:CP ENG CU OS 2022S2 - Instructors\n1:\tVeera Muangsin,Ph.D.\n2:\tKrerk Piromsopa, Ph.D.\n3:\tThongchai Rojkangsadan\n";
// prototypes for device functions
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *inode, struct file *file);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
// File operations structor
// Only implement those that will be used.
static struct file_operations dev_fops = {
    .read = device_read,
    .open = device_open,
    .release = device_release};

int init_module(void)
{
    printk(KERN_INFO "CPCHAR: dev osinfo init\n");
    dev_major = register_chrdev(0, DEVICENAME, &dev_fops);
    if (dev_major < 0)
    {
        printk(KERN_ALERT "Fail register_chrdev osinfo with %d\n", dev_major);
        return dev_major;
    }

    printk(KERN_INFO "Device MajorNumber %d.\n", dev_major);
    printk(KERN_INFO "To create a device file:\n");
    printk(KERN_INFO "\t'mknod /dev/%s c %d %d'.\n", DEVICENAME, dev_major, dev_minor);
    printk(KERN_INFO "Try varying minor numbers.\n");
    printk(KERN_INFO "Please remove the device file and module when done.\n");
    /* * non 0 - means init_module failed */
    // For more details, see https://en.wikipedia.org/wiki/CPUID
    return 0;
}
void cleanup_module(void)
{
    printk(KERN_INFO "CPCHAR: dev osinfo cleanup\n");
    unregister_chrdev(dev_major, DEVICENAME);
}

static inline void A_native_cpuid(unsigned int *eax, unsigned int *ebx, unsigned int *ecx, unsigned int *edx)
{
    /* ecx is often an input as well as an output. */
    asm volatile("cpuid"
                 : "=a"(*eax),
                   "=b"(*ebx),
                   "=c"(*ecx),
                   "=d"(*edx)
                 : "0"(*eax), "2"(*ecx)
                 : "memory");
}

static int device_open(struct inode *inode, struct file *file)
{
    if (dev_open)
        return -EBUSY;
    dev_open++;
    printk(KERN_INFO "dev minor %d\n", MINOR(inode->i_rdev));
    // Code snippet
    unsigned eax, ebx, ecx, edx;
    // for obtaining the features
    char f_output[1000]; 
    char f_tmp1[100];
    char f_tmp2[100];
    eax = 0; /* processor info and feature bits */
    A_native_cpuid(&eax, &ebx, &ecx, &edx);
    sprintf(f_output, "Vendor ID %c%c%c%c%c%c%c%c%c%c%c%c\n",
             (ebx) & 0xFF, (ebx >> 8) & 0xFF, (ebx >> 16) & 0xFF, (ebx >> 24) & 0xFF,
             (edx) & 0xFF, (edx >> 8) & 0xFF, (edx >> 16) & 0xFF, (edx >> 24) & 0xFF,
             (ecx) & 0xFF, (ecx >> 8) & 0xFF, (ecx >> 16) & 0xFF, (ecx >> 24) & 0xFF);
    // for obtaining the features
    eax = 1; /* processor info and feature bits */
    A_native_cpuid(&eax, &ebx, &ecx, &edx);
    sprintf(f_tmp1, "stepping %d\nmodel %d\nfamily %d\nprocessor type %d\nextended model %d\nextended family %d\n",eax & 0xF,(eax >> 4) & 0xF,(eax >> 8) & 0xF,(eax >> 12) & 0x3,(eax >> 16) & 0xF,(eax >> 20) & 0xFF);
    // for obtaining the serial number
    eax = 3; /* processor serial number */
    A_native_cpuid(&eax, &ebx, &ecx, &edx);
    sprintf(f_tmp2,"serial number 0x%08x%08x\n", edx, ecx);
    // Concatenate f_data1 and f_data2 onto f_data0
    strcat(f_output, f_tmp1);
    strcat(f_output, f_tmp2);
    printk(KERN_INFO "debug4 %s\n", f_output);
    f_ptr=(char * )f_output;
    // lock module
    try_module_get(THIS_MODULE);
    return 0;
}
static int device_release(struct inode *inode, struct file *file)
{
    dev_open--; /* We're now ready for our next caller */
    // release module
    module_put(THIS_MODULE);
    return 0;
}
static ssize_t device_read(struct file *filp,
                           char *buffer,
                           /* see include/linux/fs.h */
                           /* buffer to fill with data */
                           /* length of the buffer */
                           size_t length,
                           loff_t *offset)
{
    int bytes_read = 0;
    if (*f_ptr == 0)
    {
        return 0;
    }
    while (length && *f_ptr)
    {
        put_user(*(f_ptr++), buffer++);
        length--;
        bytes_read++;
    }
    return bytes_read;
}