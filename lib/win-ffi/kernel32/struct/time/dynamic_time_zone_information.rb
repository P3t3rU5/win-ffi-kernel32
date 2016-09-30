require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/time/system_time'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724253(v=vs.85).aspx
    class DYNAMIC_TIME_ZONE_INFORMATION < FFIAdditions::Struct
      layout Bias:                                :long,
             StandardName:     WideInlineString.new(32),
             StandardDate:                   SYSTEMTIME,
             StandardBias:                        :long,
             DaylightName:     WideInlineString.new(32),
             DaylightDate:                   SYSTEMTIME,
             DaylightBias:                        :long,
             TimeZoneKeyName: WideInlineString.new(128),
             DynamicDaylightTimeDisabled:         :bool
    end
  end
end