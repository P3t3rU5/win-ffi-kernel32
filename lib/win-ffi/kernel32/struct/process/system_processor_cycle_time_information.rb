module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getprocessorsystemcycletime
    class SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION < FFIAdditions::Struct
      attr_accessor :CycleTime

      layout CycleTime: :dword64
    end
  end
end