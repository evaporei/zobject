const std = @import("std");
const g = @cImport({
    @cInclude("glib-object.h");
});

pub fn main() void {
    const obj1: ?*g.GObject = @alignCast(@ptrCast(g.g_object_new(g.G_TYPE_OBJECT, null)));
    const obj2: ?*g.GObject = @alignCast(@ptrCast(g.g_object_new(g.G_TYPE_OBJECT, null)));

    const instance1: ?*g.GTypeInstance = @ptrCast(obj1);
    const instance2: ?*g.GTypeInstance = @ptrCast(obj2);

    const class1: ?*g.GTypeClass = instance1.?.*.g_class;
    const class2: ?*g.GTypeClass = instance2.?.*.g_class;

    std.debug.print("addr1 {*}\n", .{obj1});
    std.debug.print("addr2 {*}\n", .{obj2});

    std.debug.print("klass1 {*}\n", .{class1});
    std.debug.print("klass2 {*}\n", .{class2});

    g.g_object_unref(obj1);
    g.g_object_unref(obj2);
}
