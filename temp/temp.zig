const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const file_name = "/sys/class/thermal/thermal_zone0/temp";
    const file = try std.fs.cwd().openFile(file_name, .{});
    defer file.close();

    const file_size = try file.getEndPos();
    try stdout.print("file size: {d}\n", .{file_size});

    var reader = std.io.bufferedReader(file.reader());
    var instream = reader.reader();

    const allocator = std.heap.page_allocator;
    const contents = try instream.readAllAlloc(allocator, file_size);
    defer allocator.free(contents);

    try stdout.print("read file value: {c}\n", .{contents});
}
