module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/cossdk/getcompluspackageinstallstatus
      # @return [Integer]
      def self.GetComPlusPackageInstallStatus; end
      attach_function 'GetComPlusPackageInstallStatus', [], :ulong
    end
  end
end