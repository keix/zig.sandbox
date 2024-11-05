const std = @import("std");

pub fn main() !void {
    // Initialize a GeneralPurposeAllocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    // Get the allocator handle
    const allocator = gpa.allocator();

    const buffer = try allocator.alloc(u8, 2048);
    defer allocator.free(buffer);

    // Use the memory
    buffer[0] = 99;
    std.debug.print("First element: {}\n", .{buffer[0]});
}
