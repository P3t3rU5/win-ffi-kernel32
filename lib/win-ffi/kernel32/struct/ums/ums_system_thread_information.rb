require 'win-ffi/kernel32'

module WinFFI
  if (WindowsVersion == 7 && WindowsVersion.sp >= 1) || WindowsVersion >= 8
    module Kernel32

      class USTI_STRUCT < FFIStruct
        layout :IsUmsSchedulerThread, :ulong,
               :IsUmsWorkerThread,    :ulong
      end

      class UMS_SYSTEM_THREAD_INFORMATION < FFIStruct
        layout :UmsVersion, :ulong,
               :s,          USTI_STRUCT
      end
    end
  end
end