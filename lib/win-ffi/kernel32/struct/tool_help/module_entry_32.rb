require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684225(v=vs.85).aspx
    class MODULEENTRY32 < FFIAdditions::Struct
      layout dwSize:                            :dword,
             th32ModuleID:                      :dword,
             th32ProcessID:                     :dword,
             GlblcntUsage:                      :dword,
             ProccntUsage:                      :dword,
             modBaseAddr:                     :pointer,
             modBaseSize:                       :dword,
             hModule:                         :hmodule,
             szModule: [:tchar, MAX_MODULE_NAME32 + 1],
             szExePath:             [:tchar, MAX_PATH]

    end
  end
end