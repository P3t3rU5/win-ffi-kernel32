require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366775(v=vs.85).aspx
      class MEMORY_BASIC_INFORMATION < FFIAdditions::Struct
        layout BaseAddress:       :pointer,
               AllocationBase:    :pointer,
               AllocationProtect:   :dword,
               RegionSize:         :size_t,
               State:               :dword,
               Protect:             :dword,
               Type:                :dword
      end
    end
  end
end