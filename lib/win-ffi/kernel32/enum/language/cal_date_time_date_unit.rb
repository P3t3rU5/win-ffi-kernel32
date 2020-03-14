module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/Intl/caldatetime-dateunit
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