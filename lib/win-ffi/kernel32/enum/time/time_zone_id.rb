require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    TimeZoneId = enum :time_zone_id, [
        :UNKNOWN,  0,
        :STANDARD, 1,
        :DAYLIGHT, 2,
        :INVALID,  0xFFFFFFFF
    ]
  end
end