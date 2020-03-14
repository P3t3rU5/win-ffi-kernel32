module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373202
      # DWORD ApplicationRecoveryCallback(PVOID pvParameter)
      ApplicationRecoveryCallback = callback 'ApplicationRecoveryCallback', [:pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373328
      # VOID ApplicationRecoveryFinished(_In_ BOOL bSuccess)
      def self.ApplicationRecoveryFinished(bSuccess) end
      attach_function 'ApplicationRecoveryFinished', [:bool], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373329
      # HRESULT ApplicationRecoveryInProgress(_Out_ PBOOL pbCanceled)
      def self.ApplicationRecoveryInProgress(pbCanceled) end
      attach_function 'ApplicationRecoveryInProgress', [:pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373344
      # HRESULT GetApplicationRestartSettings(
      #   _In_      HANDLE hProcess,
      #   _Out_opt_ PWSTR  pwzCommandline,
      #   _Inout_   PDWORD pcchSize,
      #   _Out_opt_ PDWORD pdwFlags)
      def self.GetApplicationRestartSettings(hProcess, pwzCommandline, pcchSize, pdwFlags) end
      attach_function 'GetApplicationRestartSettings', [:handle, :string, :pointer, :pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373343
      # HRESULT GetApplicationRecoveryCallback(
      #   _In_  HANDLE                        hProcess,
      #   _Out_ APPLICATION_RECOVERY_CALLBACK *pRecoveryCallback,
      #   _Out_ PVOID                         *ppvParameter,
      #   _Out_ PDWORD                        pdwPingInterval,
      #   _Out_ PDWORD                        pdwFlags)
      def self.GetApplicationRecoveryCallback(hProcess, pRecoveryCallback, ppvParameter, pdwPingInterval, pdwFlags) end
      attach_function 'GetApplicationRecoveryCallback',
                      [:handle, ApplicationRecoveryCallback, :pointer, :pointer, :pointer], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373345
      # HRESULT RegisterApplicationRecoveryCallback(
      #   _In_     APPLICATION_RECOVERY_CALLBACK pRecoveryCallback,
      #   _In_opt_ PVOID                         pvParameter,
      #   _In_     DWORD                         dwPingInterval,
      #   _In_     DWORD                         dwFlags)
      def self.RegisterApplicationRecoveryCallback(pRecoveryCallback, pvParameter, dwPingInterval, dwFlags) end
      attach_function 'RegisterApplicationRecoveryCallback',
                      [ApplicationRecoveryCallback, :pointer, :dword, :dword], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373347
      # HRESULT RegisterApplicationRestart(_In_opt_ PCWSTR pwzCommandline, _In_     DWORD  dwFlags)
      def self.RegisterApplicationRestart(pwzCommandline, dwFlags) end
      attach_function 'RegisterApplicationRestart', [:string, :dword], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373348
      # HRESULT UnregisterApplicationRecoveryCallback(void)
      def self.UnregisterApplicationRecoveryCallback; end
      attach_function 'UnregisterApplicationRecoveryCallback', [], :hresult

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373349
      # HRESULT UnregisterApplicationRestart(void)
      def self.UnregisterApplicationRestart; end
      attach_function 'UnregisterApplicationRestart', [], :hresult
    end
  end
end
