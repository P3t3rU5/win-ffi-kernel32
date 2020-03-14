module WinFFI
  if (WINDOWS_VERSION == 7 && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= 8
    module Kernel32

      class USTI_STRUCT < FFIAdditions::Struct
        attr_accessor :IsUmsSchedulerThread, :IsUmsWorkerThread

        layout IsUmsSchedulerThread: :ulong,
               IsUmsWorkerThread:    :ulong
      end

      # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-ums_system_thread_information
      class UMS_SYSTEM_THREAD_INFORMATION < FFIAdditions::Struct
        attr_accessor :UmsVersion, :s

        layout UmsVersion: :ulong,
               s:          USTI_STRUCT
      end
    end
  end
end