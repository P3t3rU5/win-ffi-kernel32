require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681403(v=vs.85).aspx
      class UNLOAD_DLL_DEBUG_INFO < FFIAdditions::Struct
        layout lpBaseOfDll: :pointer
      end
    end
  end
end
