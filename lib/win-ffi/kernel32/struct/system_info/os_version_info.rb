module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-osversioninfoa
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-osversioninfow
    class OSVERSIONINFO < FFIAdditions::Struct
      attr_accessor :dwOSVersionInfoSize,
                    :dwMajorVersion,
                    :dwMinorVersion,
                    :dwBuildNumber,
                    :dwPlatformId,
                    :szCSDVersion

      layout dwOSVersionInfoSize: :ulong,
             dwMajorVersion:      :ulong,
             dwMinorVersion:      :ulong,
             dwBuildNumber:       :ulong,
             dwPlatformId:        :ulong,
             szCSDVersion:        [:char, 128]
    end
  end
end