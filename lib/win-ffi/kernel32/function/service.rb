require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= 8.1
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn369255(v=vs.85).aspx
      # BOOL WINAPI InstallELAMCertificateInfo(_In_ HANDLE ELAMFile)
      attach_function 'InstallELAMCertificateInfo', [:handle], :bool

    end
  end
end