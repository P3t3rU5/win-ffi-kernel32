require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :vista
    require 'win-ffi/kernel32/enum/language/calendar_id'
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317728(v=vs.85).aspx
      class CALDATETIME < FFIAdditions::Struct
        layout CalId: CalendarId, # typedef DWORD CALID;
               Era:        :uint,
               Year:       :uint,
               Month:      :uint,
               Day:        :uint,
               DayOfWeek:  :uint,
               Hour:       :uint,
               Minute:     :uint,
               Second:     :uint,
               Tick:      :ulong
      end
    end
  end
end
