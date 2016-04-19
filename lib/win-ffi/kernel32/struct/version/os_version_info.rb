require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class OSVERSIONINFO < FFIStruct
      layout :dwOSVersionInfoSize, :ulong,
             :dwMajorVersion,      :ulong,
             :dwMinorVersion,      :ulong,
             :dwBuildNumber,       :ulong,
             :dwPlatformId,        :ulong,
             :szCSDVersion,        [:char, 128]
    end
  end
end