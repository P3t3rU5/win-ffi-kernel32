require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366775(v=vs.85).aspx
      class MEMORY_BASIC_INFORMATION64 < FFIAdditions::Struct
        layout BaseAddress:       :ulong_long,
               AllocationBase:    :ulong_long,
               AllocationProtect:      :dword,
               __alignment1:           :dword,
               RegionSize:        :ulong_long,
               State:                  :dword,
               Protect:                :dword,
               Type:                   :dword,
               __alignment2:           :dword
      end
    end
  end
end
