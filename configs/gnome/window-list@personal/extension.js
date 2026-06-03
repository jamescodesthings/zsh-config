import GLib from 'gi://GLib';
import Gio from 'gi://Gio';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';

const IFACE_XML = `
<node>
  <interface name="com.personal.WindowList">
    <method name="GetWindows">
      <arg type="s" direction="out" name="json"/>
    </method>
    <method name="FocusByClass">
      <arg type="s" direction="in" name="wm_class"/>
      <arg type="b" direction="out" name="focused"/>
    </method>
    <method name="FocusByName">
      <arg type="s" direction="in" name="title_substr"/>
      <arg type="b" direction="out" name="focused"/>
    </method>
    <method name="FocusByNameRegex">
      <arg type="s" direction="in" name="pattern"/>
      <arg type="b" direction="out" name="focused"/>
    </method>
  </interface>
</node>`;

export default class WindowListExtension {
    enable() {
        this._dbusImpl = Gio.DBusExportedObject.wrapJSObject(IFACE_XML, this);
        this._dbusImpl.export(Gio.DBus.session, '/com/personal/WindowList');
        this._nameId = Gio.DBus.session.own_name(
            'com.personal.WindowList',
            Gio.BusNameOwnerFlags.NONE,
            null, null,
        );
    }

    disable() {
        Gio.DBus.session.unown_name(this._nameId);
        this._dbusImpl.unexport();
        this._dbusImpl = null;
    }

    GetWindows(_params, invocation) {
        const windows = global.get_window_actors()
            .map(a => a.meta_window)
            .map(w => ({
                class: w.get_wm_class() ?? '',
                title: w.get_title() ?? '',
                minimized: w.minimized,
            }));
        invocation.return_value(new GLib.Variant('(s)', [JSON.stringify(windows)]));
    }

    FocusByClass(params, invocation) {
        const [wmClass] = params.deepUnpack();
        const win = global.get_window_actors()
            .map(a => a.meta_window)
            .find(w => (w.get_wm_class() ?? '').toLowerCase() === wmClass.toLowerCase() && !w.minimized);
        if (win)
            Main.activateWindow(win);
        invocation.return_value(new GLib.Variant('(b)', [win !== undefined]));
    }

    FocusByName(params, invocation) {
        const [substr] = params.deepUnpack();
        const lower = substr.toLowerCase();
        const win = global.get_window_actors()
            .map(a => a.meta_window)
            .find(w => (w.get_title() ?? '').toLowerCase().includes(lower) && !w.minimized);
        if (win)
            Main.activateWindow(win);
        invocation.return_value(new GLib.Variant('(b)', [win !== undefined]));
    }

    FocusByNameRegex(params, invocation) {
        const [pattern] = params.deepUnpack();
        let re;
        try {
            re = new RegExp(pattern);
        } catch {
            invocation.return_value(new GLib.Variant('(b)', [false]));
            return;
        }
        const win = global.get_window_actors()
            .map(a => a.meta_window)
            .find(w => re.test(w.get_title() ?? '') && !w.minimized);
        if (win)
            Main.activateWindow(win);
        invocation.return_value(new GLib.Variant('(b)', [win !== undefined]));
    }
}
