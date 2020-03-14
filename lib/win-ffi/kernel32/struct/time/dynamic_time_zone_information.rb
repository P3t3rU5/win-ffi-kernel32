require_relative 'system_time'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/timezoneapi/ns-timezoneapi-dynamic_time_zone_information
    class DYNAMIC_TIME_ZONE_INFORMATION < FFIAdditions::Struct
      attr_accessor :Bias,
                    :StandardName,
                    :StandardDate,
                    :StandardBias,
                    :DaylightName,
                    :DaylightDate,
                    :DaylightBias,
                    :TimeZoneKeyName,
                    :DynamicDaylightTimeDisabled

      layout Bias:                        :long,
             StandardName:                WideInlineString.new(32),
             StandardDate:                SYSTEMTIME,
             StandardBias:                :long,
             DaylightName:                WideInlineString.new(32),
             DaylightDate:                SYSTEMTIME,
             DaylightBias:                :long,
             TimeZoneKeyName:             WideInlineString.new(128),
             DynamicDaylightTimeDisabled: :bool
    end
  end
end