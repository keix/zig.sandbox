pub fn main() noreturn {
    const msg = "Hello, World!\n";
    const msg_len = msg.len;
    const fd: usize = 1;

    var result: usize = 0;

    asm volatile ("syscall"
        : [ret] "={rax}" (result),
        : [number] "{rax}" (1),
          [arg1] "{rdi}" (fd),
          [arg2] "{rsi}" (@intFromPtr(msg)),
          [arg3] "{rdx}" (msg_len),
        : "rcx", "r11"
    );

    asm volatile ("syscall"
        : [ret] "={rax}" (result),
        : [number] "{rax}" (60),
          [arg1] "{rdi}" (0),
        : "rcx", "r11"
    );

    unreachable;
}
