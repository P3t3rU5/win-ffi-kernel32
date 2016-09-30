require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Run once flags
    InitOnceFlag = enum :init_once_flag, [
        :STATIC_INIT,      0, # {0}
        :CHECK_ONLY,        0x00000001,
        :ASYNC,             0x00000002,
        :INIT_FAILED,       0x00000004,
        :CTX_RESERVED_BITS, 2
    ]

    define_prefix(:INIT_ONCE, InitOnceFlag)
  end
end