const std = @import("std");

pub fn main() void {
    var i: i32 = 0;
    while (i < 10) {
        std.debug.print("{}", .{i});
        i += 1;
    }
}
