
#include <ms_rtos.h>
#include "lvgl/lvgl.h"

extern void lv_port_disp_init(void);
extern void lv_port_indev_init(void);
extern void lv_port_fs_init(void);

extern void lv_demo_music(void);

#if LV_USE_LOG > 0
static void lv_log_print(lv_log_level_t level, const char * file, uint32_t line, const char *func, const char *buf)
{
    static const char * lvl_prefix[] = {"Trace", "Info", "Warn", "Error", "User"};
    ms_printf("%s: %s \t(%s #%d %s())\n", lvl_prefix[level], buf, file, line, func);
}
#endif

int main(int argc, char *argv[])
{
#if LV_USE_LOG > 0
    lv_log_register_print_cb(lv_log_print);
#endif

    lv_init();

    lv_port_disp_init();
    lv_port_indev_init();
    lv_port_fs_init();

    lv_demo_music();

    while (MS_TRUE) {
        lv_task_handler();
        ms_thread_sleep_ms(1);
    }

    return (0);
}
