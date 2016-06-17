require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/time/system_time'

module WinFFI
  module Kernel32
    class TIME_ZONE_INFORMATION < FFIStruct
      layout :Bias,         :long,
             :StandardName, WideInlineString.new(32),
             :StandardDate, SYSTEMTIME,
             :StandardBias, :long,
             :DaylightName, WideInlineString.new(32),
             :DaylightDate, SYSTEMTIME,
             :DaylightBias, :long
    end
  end
end