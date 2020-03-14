require_relative 'startup_info'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-startupinfoexa
      # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-startupinfoexw
      class STARTUPINFOEX < FFIAdditions::Struct
        attr_accessor :StartupInfo, :lpAttributeList

        layout StartupInfo:     STARTUPINFO,
               lpAttributeList: :pointer

        def initialize
          super
          StartupInfo.cb = self.size
        end
      end
    end
  end
end