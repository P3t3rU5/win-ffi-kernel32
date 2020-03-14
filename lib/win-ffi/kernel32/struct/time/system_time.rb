require_relative '../../enum/time/month'
require_relative '../../enum/time/day_of_week'

require_relative 'file_time'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime
    class SYSTEMTIME < FFIAdditions::Struct
      attr_accessor :wYear,
                    :wMonth,
                    :wDayOfWeek,
                    :wDay,
                    :wHour,
                    :wMinute,
                    :wSecond,
                    :wMilliseconds

      layout wYear:         :word,
             wMonth:        :word,
             wDayOfWeek:    :word,
             wDay:          :word,
             wHour:         :word,
             wMinute:       :word,
             wSecond:       :word,
             wMilliseconds: :word

      def current_local_time
        Kernel32.GetLocalTime(self)
        self
      end

      def current_system_time
        Kernel32.GetSystemTime(self)
        self
      end

      def month
        Month[self.wMonth]
      end

      def day_of_the_week
        DayOfWeek[self[:wDayOfWeek]]
      end

      def to_s
        '%s, %04d-%02d-%02d %02d:%02d:%02d:%04d' % [wDayOfWeek, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds]
      end

      def to_file_time
        file_time = FILETIME.new
        Kernel32.SystemTimeToFileTime(self, file_time)
        file_time
      end
    end
  end
end