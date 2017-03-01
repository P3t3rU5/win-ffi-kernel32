require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686440(v=vs.85).aspx
      # ULONG WINAPI GetComPlusPackageInstallStatus(void)
      attach_function 'GetComPlusPackageInstallStatus', [], :ulong
    end
  end
end