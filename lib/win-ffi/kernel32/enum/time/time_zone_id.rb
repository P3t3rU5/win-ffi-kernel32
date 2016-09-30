require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    TimeZoneId = enum :time_zone_id, [
        :UNKNOWN,  0,
        :STANDARD, 1,
        :DAYLIGHT, 2,
        :INVALID,  0xFFFFFFFF
    ]

    define_prefix(:TIME_ZONE_ID, TimeZoneId)
  end
end