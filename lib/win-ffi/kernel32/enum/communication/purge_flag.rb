require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # PURGE function flags.
      PurgeFlag = enum :purge_flag, [
          :TXABORT, 0x0001,
          :RXABORT, 0x0002,
          :TXCLEAR, 0x0004,
          :RXCLEAR, 0x0008,
      ]

      define_prefix(:PURGE, PurgeFlag)
    end
  end
end