require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WindowsVersion >= 8.1
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn369255(v=vs.85).aspx
      # BOOL WINAPI InstallELAMCertificateInfo(_In_ HANDLE ELAMFile)
      attach_function 'InstallELAMCertificateInfo', [:handle], :bool

    end
  end
end