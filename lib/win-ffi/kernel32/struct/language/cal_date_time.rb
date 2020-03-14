module WinFFI
  if WINDOWS_VERSION >= :vista
    require_relative '../../enum/language/calendar_id'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/intl/caldatetime
      class CALDATETIME < FFIAdditions::Struct
        attr_accessor :CalId,
                      :Era,
                      :Year,
                      :Month,
                      :Day,
                      :DayOfWeek,
                      :Hour,
                      :Minute,
                      :Second,
                      :Tick

        layout CalId:     CalendarId, # typedef DWORD CALID;
               Era:       :uint,
               Year:      :uint,
               Month:     :uint,
               Day:       :uint,
               DayOfWeek: :uint,
               Hour:      :uint,
               Minute:    :uint,
               Second:    :uint,
               Tick:      :ulong
      end
    end
  end
end
