module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-unload_dll_debug_info
      class UNLOAD_DLL_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :lpBaseOfDll

        layout lpBaseOfDll: :pointer
      end
    end
  end
end
