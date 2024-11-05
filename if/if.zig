const std = @import("std");

pub fn main() void {
    const a = if (10 > 1) 1 else 2;
    std.debug.print("a: {}\n", .{a});

    if (10 > 1) {
        std.debug.print("10 > 1\n", .{});
    } else {
        std.debug.print("10 <= 1\n", .{});
    }
}
