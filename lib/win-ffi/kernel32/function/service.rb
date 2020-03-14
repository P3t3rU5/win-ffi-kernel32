module WinFFI
  if WINDOWS_VERSION >= 8.1
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dn369255
      # BOOL InstallELAMCertificateInfo(_In_ HANDLE ELAMFile)
      def self.InstallELAMCertificateInfo(eLAMFile) end
      attach_function 'InstallELAMCertificateInfo', [:handle], :bool
    end
  end
end