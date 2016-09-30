require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/bb432179(v=vs.85).aspx
    # DWORD AddLocalAlternateComputerName(_In_ LPCTSTR lpDnsFQHostname, _In_ ULONG   ulFlags)
    encoded_function 'AddLocalAlternateComputerName', [:string, :ulong], :dword
  end
end