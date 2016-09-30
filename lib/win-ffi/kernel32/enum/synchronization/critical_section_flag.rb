require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # These flags define the upper byte of the critical section SpinCount field
    CriticalSectionFlag = enum :critical_section_flag, [
        :NO_DEBUG_INFO,    0x01000000,
        :DYNAMIC_SPIN,     0x02000000,
        :STATIC_INIT,      0x04000000,
        :RESOURCE_TYPE,    0x08000000,
        :FORCE_DEBUG_INFO, 0x10000000,
        :ALL_FLAG_BITS,    0xFF000000,
        :RESERVED, (0xFF000000 & (~(0x01000000 | 0x02000000 | 0x04000000 | 0x08000000 | 0x10000000)))
    ]

    define_prefix(:RTL_CRITICAL_SECTION_FLAG, CriticalSectionFlag)
  end
end