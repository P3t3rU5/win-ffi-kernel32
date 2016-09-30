require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373202(v=vs.85).aspx
      # DWORD WINAPI ApplicationRecoveryCallback(PVOID pvParameter)
      ApplicationRecoveryCallback = callback 'ApplicationRecoveryCallback', [:pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373328(v=vs.85).aspx
      # VOID WINAPI ApplicationRecoveryFinished(_In_ BOOL bSuccess)
      attach_function 'ApplicationRecoveryFinished', [:bool], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373329(v=vs.85).aspx
      # HRESULT WINAPI ApplicationRecoveryInProgress(_Out_ PBOOL pbCanceled)
      attach_function 'ApplicationRecoveryInProgress', [:pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373344(v=vs.85).aspx
      # HRESULT WINAPI GetApplicationRestartSettings(
      #   _In_      HANDLE hProcess,
      #   _Out_opt_ PWSTR  pwzCommandline,
      #   _Inout_   PDWORD pcchSize,
      #   _Out_opt_ PDWORD pdwFlags)
      attach_function 'GetApplicationRestartSettings', [:handle, :string, :pointer, :pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373343(v=vs.85).aspx
      # HRESULT WINAPI GetApplicationRecoveryCallback(
      #   _In_  HANDLE                        hProcess,
      #   _Out_ APPLICATION_RECOVERY_CALLBACK *pRecoveryCallback,
      #   _Out_ PVOID                         *ppvParameter,
      #   _Out_ PDWORD                        pdwPingInterval,
      #   _Out_ PDWORD                        pdwFlags)
      attach_function 'GetApplicationRecoveryCallback',
                      [:handle, ApplicationRecoveryCallback, :pointer, :pointer, :pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373345(v=vs.85).aspx
      # HRESULT WINAPI RegisterApplicationRecoveryCallback(
      #   _In_     APPLICATION_RECOVERY_CALLBACK pRecoveryCallback,
      #   _In_opt_ PVOID                         pvParameter,
      #   _In_     DWORD                         dwPingInterval,
      #   _In_     DWORD                         dwFlags)
      attach_function 'RegisterApplicationRecoveryCallback',
                      [ApplicationRecoveryCallback, :pointer, :dword, :dword], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373347(v=vs.85).aspx
      # HRESULT WINAPI RegisterApplicationRestart(_In_opt_ PCWSTR pwzCommandline, _In_     DWORD  dwFlags)
      attach_function 'RegisterApplicationRestart', [:string, :dword], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373348(v=vs.85).aspx
      # HRESULT WINAPI UnregisterApplicationRecoveryCallback(void)
      attach_function 'UnregisterApplicationRecoveryCallback', [], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373349(v=vs.85).aspx
      # HRESULT WINAPI UnregisterApplicationRestart(void)
      attach_function 'UnregisterApplicationRestart', [], :hresult

    end
  end
end