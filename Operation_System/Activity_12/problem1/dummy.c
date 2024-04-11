// dummy.c
#include <linux/module.h> /* Needed by all modules */
#include <linux/kernel.h> /* Needed for KERN_INFO */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("KRERK PIROMSOPA, PH.D. <Krerk.P@chula.ac.th>");
MODULE_DESCRIPTION("\"cpmod\" Dummy Kernel Module");
int init_module(void)
{
printk(KERN_INFO "CPMOD: init\n");
/* * non 0 - means init_module failed
/ module can't be loaded.
*/ return 0;
}
void cleanup_module(void)
{
printk(KERN_INFO "CPMOD: cleanup\n");
}
