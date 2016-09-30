require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Calendar ID Values.
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317732(v=vs.85).aspx
    buffer =  [
        :GREGORIAN,               1,
        :GREGORIAN_US,            2,
        :JAPAN,                   3,
        :TAIWAN,                  4,
        :KOREA,                   5,
        :HIJRI,                   6,
        :THAI,                    7,
        :HEBREW,                  8,
        :GREGORIAN_ME_FRENCH,     9,
        :GREGORIAN_ARABIC,       10,
        :GREGORIAN_XLIT_ENGLISH, 11,
        :GREGORIAN_XLIT_FRENCH,  12,
        :PERSIAN,                22,

    ]

    buffer += [:UMALQURA, 23] if WindowsVersion >= :vista

    # Calendar Enumeration Value.
    ENUM_ALL_CALENDARS = 0xffffffff

    CalendarId = enum :calendar_id, buffer

    define_prefix(:CAL, CalendarId)
  end
end