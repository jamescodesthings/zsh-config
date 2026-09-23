# kitty kitten, bound to cmd+shift+w (macOS) and ctrl+shift+w (Linux).
# Closes the other panes in the current tab; when the tab has only one pane,
# closes the other tabs in the window instead. It runs inside kitty with no
# UI of its own, so main() is never called.
from kittens.tui.handler import result_handler


def main(args):
    pass


@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss):
    tab = boss.active_tab
    if tab is None:
        return
    if tab.num_window_groups > 1:
        tab.close_other_windows_in_tab()
    else:
        boss.close_other_tabs_in_os_window()
