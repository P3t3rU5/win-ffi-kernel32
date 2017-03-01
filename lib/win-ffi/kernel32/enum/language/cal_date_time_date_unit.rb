require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317730(v=vs.85).aspx
      CALDATETIME_DATEUNIT = enum :cal_date_time_date_unit, [
          :Era,
          :Year,
          :Month,
          :Week,
          :Day,
          :Hour,
          :Minute,
          :Second,
          :Tick
      ]

      define_suffix(:Unit, CALDATETIME_DATEUNIT, true)
    end
  end
end