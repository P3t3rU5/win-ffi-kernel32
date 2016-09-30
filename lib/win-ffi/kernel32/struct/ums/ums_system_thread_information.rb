require 'win-ffi/kernel32'

module WinFFI
  if (WindowsVersion == 7 && WindowsVersion.sp >= 1) || WindowsVersion >= 8
    module Kernel32

      class USTI_STRUCT < FFIAdditions::Struct
        layout IsUmsSchedulerThread: :ulong,
               IsUmsWorkerThread:    :ulong
      end

      class UMS_SYSTEM_THREAD_INFORMATION < FFIAdditions::Struct
        layout UmsVersion: :ulong,
               s:          USTI_STRUCT
      end
    end
  end
end