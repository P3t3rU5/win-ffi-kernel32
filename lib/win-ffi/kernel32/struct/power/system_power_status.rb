require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class SYSTEM_POWER_STATUS < FFIAdditions::Struct
      layout ACLineStatus:        :BYTE,
             BatteryFlag:         :BYTE,
             BatteryLifePercent:  :BYTE,
             SystemStatusFlag:    :BYTE,
             BatteryLifeTime:     :DWORD,
             BatteryFullLifeTime: :DWORD,
    end
  end
end