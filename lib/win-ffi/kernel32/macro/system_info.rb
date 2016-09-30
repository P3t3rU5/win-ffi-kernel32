require 'win-ffi/kernel32/enum/system_info/version_flag'
require 'win-ffi/kernel32/enum/system_info/win32_winnt'

require 'win-ffi/kernel32/function/system_info'

module WinFFI
  module Kernel32
    include WinFFI
    # if Architecture == 'x64-mingw32'
      class << self
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424964(v=vs.85).aspx
        def IsWindowsVersionOrGreater(wMajorVersion, wMinorVersion, wServicePackMajor)
          osvi = OSVERSIONINFOEX.new.get!

          # WinFFI.logger.debug VersionFlags[:MAJORVERSION]
          # WinFFI.logger.debug VersionFlags[:GREATER_EQUAL]
          # WinFFI.logger.debug "=================="
          # WinFFI.logger.debug VerSetConditionMask(0, VersionFlags[:MAJORVERSION], VersionFlags[:GREATER_EQUAL])
          # WinFFI.logger.debug "=================="
          # WinFFI.logger VerSetConditionMask(0, :MAJORVERSION, :GREATER_EQUAL)

          dwlConditionMask = VerSetConditionMask(
              VerSetConditionMask(
                  VerSetConditionMask(0, :MAJORVERSION, :GREATER_EQUAL),
                  :MINORVERSION, :GREATER_EQUAL),
              :SERVICEPACKMAJOR, :GREATER_EQUAL)

          osvi.dwMajorVersion = WIN32_WINNT[wMajorVersion]
          osvi.dwMinorVersion = WIN32_WINNT[wMinorVersion]
          osvi.wServicePackMajor = wServicePackMajor

          !VerifyVersionInfo(osvi, VersionFlag[:MAJORVERSION] |
              VersionFlag[:MINORVERSION] |
              VersionFlag[:SERVICEPACKMAJOR], dwlConditionMask)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424968(v=vs.85).aspx
        def IsWindowsXPOrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424969(v=vs.85).aspx
        def IsWindowsXPSP1OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 1)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424970(v=vs.85).aspx
        def IsWindowsXPSP2OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 2)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424971(v=vs.85).aspx
        def IsWindowsXPSP3OrGreater
          IsWindowsVersionOrGreater(:WINXP, :WINXP, 3)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424965(v=vs.85).aspx
        def IsWindowsVistaOrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424966(v=vs.85).aspx
        def IsWindowsVistaSP1OrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 1)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424967(v=vs.85).aspx
        def IsWindowsVistaSP2OrGreater
          IsWindowsVersionOrGreater(:VISTA, :VISTA, 2)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424959(v=vs.85).aspx
        def IsWindows7OrGreater
          IsWindowsVersionOrGreater(:WIN7, :WIN7, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424960%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
        def IsWindows7SP1OrGreater
          IsWindowsVersionOrGreater(:WIN7, :WIN7, 1)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424961(v=vs.85).aspx
        def IsWindows8OrGreater
          IsWindowsVersionOrGreater(:WIN8, :WIN8, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424962(v=vs.85).aspx
        def IsWindows8Point1OrGreater
          IsWindowsVersionOrGreater(:WINBLUE, :WINBLUE, 0)
        end

        def IsWindowsThresholdOrGreater
          IsWindowsVersionOrGreater(:WINTHRESHOLD, :WINTHRESHOLD, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn905474(v=vs.85).aspx
        def IsWindows10OrGreater
          IsWindowsVersionOrGreater(:WINTHRESHOLD, :WINTHRESHOLD, 0)
        end

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn424963(v=vs.85).aspx
        def IsWindowsServer
          !VerifyVersionInfo(
              OSVERSIONINFOEX.new,
              VersionFlags[:PRODUCT_TYPE],
              VerSetConditionMask(0, VersionFlag[:PRODUCT_TYPE], VersionFlag[:EQUAL]))
        end
      end
    end
  # end
end