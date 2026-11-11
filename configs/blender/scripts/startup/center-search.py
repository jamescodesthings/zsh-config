import bpy

class CenterSearchOperator(bpy.types.Operator):
    """Warp mouse to center and open search"""
    bl_idname = "wm.center_search"
    bl_label = "Center Search"

    def execute(self, context):
        window = context.window
        center_x = int(window.width / 2)
        center_y = int(window.height / 2)

        window.cursor_warp(center_x, center_y)
        bpy.ops.wm.search_menu()
        return {'FINISHED'}

def register():
    bpy.utils.register_class(CenterSearchOperator)

def unregister():
    bpy.utils.unregister_class(CenterSearchOperator)

if __name__ == "__main__":
    register()
