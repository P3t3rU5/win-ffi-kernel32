require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Time Flags for GetTimeFormat
    TimeFlag = enum :time_flag, [
        :NOMINUTESORSECONDS, 0x00000001,
        :NOSECONDS,          0x00000002,
        :NOTIMEMARKER,       0x00000004,
        :FORCE24HOURFORMAT,  0x00000008,
    ]

    define_prefix(:TIME, TimeFlag)
  end
end