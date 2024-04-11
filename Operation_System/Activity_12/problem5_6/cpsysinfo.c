// osinfo.c
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/sched.h>
#include <linux/sysinfo.h>
#include <linux/mm.h>
#include <asm/uaccess.h>
/* Needed by all modules */
/* Needed for KERN_INFO */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("KRERK PIROMSOPA, PH.D. <Krerk.P@chula.ac.th>");
MODULE_DESCRIPTION("\"cpsysinfo\" Character Device");
#define DEVICENAME "cpsysinfo"
static int dev_major;
static int dev_minor;
static int dev_open = 0;
static char *f_ptr;
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
    printk(KERN_INFO "\t'mknod /dev/%s c %d some_minor'.\n", DEVICENAME, dev_major);
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

static int device_open(struct inode *inode, struct file *file)
{
    if (dev_open)
        return -EBUSY;
    dev_minor = iminor(inode);
    dev_open++;
    struct task_struct *task;
    printk(KERN_INFO "dev minor %d\n", MINOR(inode->i_rdev));
    char f_data[1500] = "";
    if (dev_minor == 0)
    {
        for_each_process(task)
        {
            snprintf(f_data, 1400, "%s%d,%s \n", f_data, task->pid, task->comm);
            printk(KERN_INFO "debug : %d %s\n", task->pid, task->comm);
        }
    }
    else if (dev_minor == 1)
    {
        struct sysinfo sys_info;

        /* Retrieve system memory information */
        // si_meminfo(&sys_info);
        // si_swapinfo(&sys_info);

        si_meminfo(&sys_info);

        snprintf(f_data, 1400, "Total RAM: %lu KB\n", sys_info.totalram*sys_info.mem_unit/1024);
        printk(KERN_INFO "debug 1.1 : %s\n", f_data);
        snprintf(f_data, 1400, "%sFree RAM: %lu KB\n", f_data, sys_info.freeram*sys_info.mem_unit/1024);
        printk(KERN_INFO "debug 1.2 : %s\n", f_data);
        snprintf(f_data, 1400, "%sAvailable RAM: %lu KB\n", f_data, (sys_info.totalram*sys_info.mem_unit - sys_info.freeram*sys_info.mem_unit)/1024);
    }
    printk(KERN_INFO "debug 2 : %s\n", f_data);
    f_ptr = (char *)f_data;
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