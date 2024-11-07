const std = @import("std");
const c = @cImport({
    @cInclude("libusb-1.0/libusb.h");
});

pub fn main() !void {
    // USB のコンテキストを初期化
    var ctx: ?*c.libusb_context = null;
    try checkError(c.libusb_init(&ctx));
    defer if (ctx) |context| c.libusb_exit(context);

    // 接続されているUSBデバイスを列挙
    var devices: [*c]?*c.libusb_device = undefined;
    const device_count = c.libusb_get_device_list(ctx, &devices);
    defer c.libusb_free_device_list(devices, 1);

    // デバイス情報を表示
    var i: usize = 0;
    while (i < std.math.cast(usize, device_count) orelse return) {
        if (devices[i]) |dev| {
            var desc: c.libusb_device_descriptor = undefined;
            try checkError(c.libusb_get_device_descriptor(dev, &desc));
            std.debug.print("USB Device: VID={x:0>4} PID={x:0>4}\n", .{ desc.idVendor, desc.idProduct });
        }
        i += 1;
    }

    // TODO: デバイスを制御する

}

fn checkError(result: c_int) !void {
    if (result < 0) {
        return error.USBError;
    }
}
