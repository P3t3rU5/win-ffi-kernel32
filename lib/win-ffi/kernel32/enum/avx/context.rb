require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    Context = enum :context, [
        :AMD64,               0x00100000,
        :CONTROL,             0x00100001,
        :INTEGER,             0x00100002,
        :SEGMENTS,            0x00100004,
        :FLOATING_POINT,      0x00100008,
        :DEBUG_REGISTERS,     0x00100010,

        :FULL,                0x0010000B,

        :ALL,                 0x0010001F,

        :XSTATE,              0x00100040,

        :KERNEL_DEBUGGER,     0x04000000,

        :EXCEPTION_ACTIVE,    0x08000000,
        :SERVICE_ACTIVE,      0x10000000,
        :EXCEPTION_REQUEST,   0x40000000,
        :EXCEPTION_REPORTING, 0x80000000
    ]

    define_prefix(:CONTEXT, Context)
  end
end