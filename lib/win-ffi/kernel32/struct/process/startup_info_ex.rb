require 'win-ffi/kernel32/struct/process/startup_info'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      class STARTUPINFOEX < FFIAdditions::Struct
        layout StartupInfo:  STARTUPINFO,
               lpAttributeList: :pointer

        def initialize
          super
          StartupInfo.cb = self.size
        end
      end
    end
  end
end