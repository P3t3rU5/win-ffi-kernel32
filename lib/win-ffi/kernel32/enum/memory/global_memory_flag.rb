require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    GlobalMemoryFlag = enum :global_memory_flag, [
        :FIXED,          0x0000,
        :MOVEABLE,       0x0002,
        :NOCOMPACT,      0x0010,
        :NODISCARD,      0x0020,
        :ZEROINIT,       0x0040,
        :MODIFY,         0x0080,
        :DISCARDABLE,    0x0100,
        :NOT_BANKED,     0x1000,
        :LOWER,          0x1000,
        :SHARE,          0x2000,
        :DDESHARE,       0x2000,
        :NOTIFY,         0x4000,
        :VALID_FLAGS,    0x7F72,
        :INVALID_HANDLE, 0x8000,

        :GHND, (0x0002 | 0x0040),
        :GPTR, (0x0000 | 0x0040),
    ]
  end
end