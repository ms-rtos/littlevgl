
#include <ms_rtos.h>
#include "lvgl/lvgl.h"

extern void lv_port_disp_init(void);
extern void lv_port_indev_init(void);
extern void lv_port_fs_init(void);

extern void demo_create(void);

static void lv_log_print(lv_log_level_t level, const char * file, uint32_t line, const char *dsc)
{
    static const char * lvl_prefix[] = {"Trace", "Info", "Warn", "Error"};

    ms_printf("%s: %s \t(%s #%u)\n", lvl_prefix[level], dsc, file, (unsigned)line);
}

int main(int argc, char *argv[])
{
    lv_log_register_print_cb(lv_log_print);

    lv_init();

    lv_port_disp_init();
    lv_port_indev_init();
    lv_port_fs_init();

    demo_create();

    while (MS_TRUE) {
        lv_task_handler();
        ms_thread_sleep_ms(1);
    }

    return (0);
}
