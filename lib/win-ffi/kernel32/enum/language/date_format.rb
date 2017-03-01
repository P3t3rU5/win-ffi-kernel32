require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    buffer = [
        :SHORTDATE,        0x00000001,
        :LONGDATE,         0x00000002,
        :USE_ALT_CALENDAR, 0x00000004,

        :YEARMONTH,        0x00000008,
        :LTRREADING,       0x00000010,
        :RTLREADING,       0x00000020,
    ]

    if WINDOWS_VERSION >= 7
      buffer += [:AUTOLAYOUT, 0x00000040]
      buffer += [:MONTHDAY,   0x00000080] if WINDOWS_VERSION >= 10

    end

    DateFormat = enum :date_format, buffer
  end
end