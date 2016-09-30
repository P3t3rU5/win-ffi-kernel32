require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680351(v=vs.85).aspx
      class LOAD_DLL_DEBUG_INFO < FFIAdditions::Struct
        layout hFile:                :handle,
               lpBaseOfDll:         :pointer,
               dwDebugInfoFileOffset: :dword,
               nDebugInfoSize:        :dword,
               lpImageName:         :pointer,
               fUnicode:               :word
      end
    end
  end
end
