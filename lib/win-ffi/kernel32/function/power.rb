module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/power/request_type'

    require_relative '../struct/power/system_power_status'
    require_relative '../struct/power/reason_context'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getdevicepowerstate
      # BOOL WINAPI GetDevicePowerState(_In_  HANDLE hDevice, _Out_ BOOL   *pfOn)
      def self.GetDevicePowerState(hDevice, pfOn); end
      attach_function 'GetDevicePowerState', [:handle, :bool], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getsystempowerstatus
      # BOOL WINAPI GetSystemPowerStatus(_Out_ LPSYSTEM_POWER_STATUS lpSystemPowerStatus)
      def self.GetSystemPowerStatus(lpSystemPowerStatus); end
      attach_function 'GetSystemPowerStatus', [SYSTEM_POWER_STATUS.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-issystemresumeautomatic
      # BOOL WINAPI IsSystemResumeAutomatic(void)
      def self.IsSystemResumeAutomatic; end
      attach_function 'IsSystemResumeAutomatic', [], :bool

      if WINDOWS_VERSION >= 7
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-powerclearrequest
        # BOOL PowerClearRequest(_In_ HANDLE PowerRequest, _In_ POWER_REQUEST_TYPE RequestType)
        def self.PowerClearRequest(powerRequest, requestType); end
        attach_function 'PowerClearRequest', [:handle, PowerRequestType], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-powercreaterequest
        # HANDLE PowerCreateRequest(_In_ PREASON_CONTEXT Context)
        def self.PowerCreateRequest(context); end
        attach_function 'PowerCreateRequest', [REASON_CONTEXT], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-powersetrequest
        # BOOL PowerSetRequest(_In_ HANDLE PowerRequest, _In_ POWER_REQUEST_TYPE RequestType)
        def self.PowerSetRequest(powerRequest, requestType); end
        attach_function 'PowerSetRequest', [:handle, PowerRequestType], :bool
      end
    end
  end
end