require_relative 'system_time'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/timezoneapi/ns-timezoneapi-time_zone_information
    class TIME_ZONE_INFORMATION < FFIAdditions::Struct
      attr_accessor :Bias,
                    :StandardName,
                    :StandardDate,
                    :StandardBias,
                    :DaylightName,
                    :DaylightDate,
                    :DaylightBias

      layout Bias:         :long,
             StandardName: WideInlineString.new(32),
             StandardDate: SYSTEMTIME,
             StandardBias: :long,
             DaylightName: WideInlineString.new(32),
             DaylightDate: SYSTEMTIME,
             DaylightBias: :long

      def current
        self unless Kernel32::TimeZoneId[Kernel32.GetTimeZoneInformation(self)] == :INVALID
      end
    end
  end
end