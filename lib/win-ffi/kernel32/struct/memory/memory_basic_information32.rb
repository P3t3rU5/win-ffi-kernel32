require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366775(v=vs.85).aspx
      class MEMORY_BASIC_INFORMATION32 < FFIAdditions::Struct
        layout BaseAddress:       :dword,
               AllocationBase:    :dword,
               AllocationProtect: :dword,
               RegionSize:        :dword,
               State:             :dword,
               Protect:           :dword,
               Type:              :dword
      end
    end
  end
end