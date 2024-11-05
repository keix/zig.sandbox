const std = @import("std");

pub fn main() void {
    const day_of_week = 3;
    switch (day_of_week) {
        0 => std.debug.print("Sunday\n", .{}),
        1 => std.debug.print("Monday\n", .{}),
        2 => std.debug.print("Tuesday\n", .{}),
        3 => std.debug.print("Wednesday\n", .{}),
        4 => std.debug.print("Thursday\n", .{}),
        5 => std.debug.print("Friday\n", .{}),
        6 => std.debug.print("Saturday\n", .{}),
        else => std.debug.print("Invalid day of week\n", .{}),
    }
}
