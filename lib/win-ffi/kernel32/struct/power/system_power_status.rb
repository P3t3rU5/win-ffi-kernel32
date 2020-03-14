module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-system_power_status
    class SYSTEM_POWER_STATUS < FFIAdditions::Struct
      attr_accessor :ACLineStatus,
                    :BatteryFlag,
                    :BatteryLifePercent,
                    :SystemStatusFlag,
                    :BatteryLifeTime,
                    :BatteryFullLifeTime

      layout ACLineStatus:        :byte,
             BatteryFlag:         :byte,
             BatteryLifePercent:  :byte,
             SystemStatusFlag:    :byte,
             BatteryLifeTime:     :dword,
             BatteryFullLifeTime: :dword
    end
  end
end