const std = @import("std");

fn compileTimeFibonacci(n: u32) u32 {
    var a: u32 = 0;
    var b: u32 = 1;
    for (n) |_| {
        const temp = a;
        a = b;
        b = temp + b;
    }
    return a;
}

pub fn main() void {
    const fib = compileTimeFibonacci(45); // コンパイル時に計算
    std.debug.print("Fibonacci(45) at compile time: {}\n", .{fib});
}
