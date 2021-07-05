
#include <ms_rtos.h>
#include "lvgl/lvgl.h"
#include "ms_lvgl_async_event.h"
#include "gui_guider.h"
#include "events_init.h"
#include "custom.h"

extern void lv_port_disp_init(void);
extern void lv_port_indev_init(void);
extern void lv_port_fs_init(void);

#if LV_USE_LOG > 0
static void lv_log_print(lv_log_level_t level, const char * file, uint32_t line, const char *func, const char *buf)
{
    static const char * lvl_prefix[] = {"Trace", "Info", "Warn", "Error", "User"};
    ms_printf("%s: %s \t(%s #%d %s())\n", lvl_prefix[level], buf, file, (int)line, func);
}
#endif

lv_ui guider_ui;

int main(int argc, char *argv[])
{
#if LV_USE_LOG > 0
    lv_log_register_print_cb(lv_log_print);
#endif

    ms_lvgl_async_event_init();

    lv_init();

    lv_port_disp_init();
    lv_port_indev_init();
    lv_port_fs_init();

    /*Create a GUI-Guider app */
    setup_ui(&guider_ui);
    events_init(&guider_ui);
    custom_init(&guider_ui);

    while (MS_TRUE) {
        ms_lvgl_async_event_handler(lv_task_handler());
    }

    return (0);
}
