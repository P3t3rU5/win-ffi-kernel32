require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/time/month'
require 'win-ffi/kernel32/enum/time/day_of_week'

require 'win-ffi/kernel32/struct/time/file_time'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724950(v=vs.85).aspx
    class SYSTEMTIME < FFIAdditions::Struct
      layout wYear:          :word,
             wMonth:         :word,
             wDayOfWeek:     :word,
             wDay:           :word,
             wHour:          :word,
             wMinute:        :word,
             wSecond:        :word,
             wMilliseconds:  :word

      def current_local_time
        Kernel32.GetLocalTime(self)
        self
      end

      def current_system_time
        Kernel32.GetSystemTime(self)
        self
      end

      def month
        Month[self[:wMonth]]
      end

      def day_of_the_week
        DayOfWeek[self[:wDayOfWeek]]
      end

      def to_s
        '%s, %04d-%02d-%02d %02d:%02d:%02d:%04d' % [day_of_the_week, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds]
      end

      def to_file_time
        file_time = FILETIME.new
        Kernel32.SystemTimeToFileTime(self, file_time)
        file_time
      end
    end
  end
end