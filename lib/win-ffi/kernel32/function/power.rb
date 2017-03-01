require 'win-ffi/kernel32/enum/power/power_request_type'

require 'win-ffi/kernel32/struct/power/system_power_status'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa372690(v=vs.85).aspx
      # BOOL WINAPI GetDevicePowerState(_In_  HANDLE hDevice, _Out_ BOOL   *pfOn)
      attach_function 'GetDevicePowerState', [:handle, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa372693(v=vs.85).aspx
      # BOOL WINAPI GetSystemPowerStatus(_Out_ LPSYSTEM_POWER_STATUS lpSystemPowerStatus)
      attach_function 'GetSystemPowerStatus', [SYSTEM_POWER_STATUS.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa372708(v=vs.85).aspx
      # BOOL WINAPI IsSystemResumeAutomatic(void)
      attach_function 'IsSystemResumeAutomatic', [], :bool

      if WINDOWS_VERSION >= 7
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405532(v=vs.85).aspx
        # BOOL PowerClearRequest(_In_ HANDLE PowerRequest, _In_ POWER_REQUEST_TYPE RequestType)
        attach_function 'PowerClearRequest', [:handle, PowerRequestType], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405533(v=vs.85).aspx
        # HANDLE PowerCreateRequest(_In_ PREASON_CONTEXT Context)
        attach_function 'PowerCreateRequest', [REASON_CONTEXT], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405534(v=vs.85).aspx
        # BOOL PowerSetRequest(_In_ HANDLE PowerRequest, _In_ POWER_REQUEST_TYPE RequestType)
        attach_function 'PowerSetRequest', [:handle, PowerRequestType], :bool
      end
    end
  end
end