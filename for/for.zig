const std = @import("std");

pub fn main() void {
    const numbers = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    for (numbers) |number| {
        std.debug.print("{}", .{number});
    }
}
