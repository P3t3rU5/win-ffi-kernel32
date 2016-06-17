require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION < FFIStruct
      layout :CycleTime, :dword64
    end
  end
end