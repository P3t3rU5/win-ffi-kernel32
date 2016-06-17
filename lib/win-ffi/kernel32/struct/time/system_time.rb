require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/time/month'
require 'win-ffi/kernel32/enum/time/day_of_week'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724950(v=vs.85).aspx
    class SYSTEMTIME < FFIStruct
      layout :wYear,         :word,
             :wMonth,        Month,
             :wDayOfWeek,    DayOfWeek,
             :wDay,          :word,
             :wHour,         :word,
             :wMinute,       :word,
             :wSecond,       :word,
             :wMilliseconds, :word
    end
  end
end