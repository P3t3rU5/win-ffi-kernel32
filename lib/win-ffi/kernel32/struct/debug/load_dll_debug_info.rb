module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-load_dll_debug_info
      class LOAD_DLL_DEBUG_INFO < FFIAdditions::Struct
        attr_accessor :hFile,
                      :lpBaseOfDll,
                      :dwDebugInfoFileOffset,
                      :nDebugInfoSize,
                      :lpImageName,
                      :fUnicode

        layout hFile:                 :handle,
               lpBaseOfDll:           :pointer,
               dwDebugInfoFileOffset: :dword,
               nDebugInfoSize:        :dword,
               lpImageName:           :pointer,
               fUnicode:              :word
      end
    end
  end
end
