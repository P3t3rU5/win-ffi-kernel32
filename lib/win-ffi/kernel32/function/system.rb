module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/DevNotes/addlocalalternatecomputername
    # DWORD AddLocalAlternateComputerName(_In_ LPCTSTR lpDnsFQHostname, _In_ ULONG   ulFlags)
    def self.AddLocalAlternateComputerName(lpDnsFQHostname, ulFlags); end
    encoded_function 'AddLocalAlternateComputerName', [:string, :ulong], :dword
  end
end