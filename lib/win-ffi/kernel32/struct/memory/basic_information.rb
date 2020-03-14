module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-memory_basic_information
      class MEMORY_BASIC_INFORMATION < FFIAdditions::Struct
        attr_accessor :BaseAddress,
                      :AllocationBase,
                      :AllocationProtect,
                      :RegionSize,
                      :State,
                      :Protect,
                      :Type

        layout BaseAddress:       :pointer,
               AllocationBase:    :pointer,
               AllocationProtect: :dword,
               RegionSize:        :size_t,
               State:             :dword,
               Protect:           :dword,
               Type:              :dword
      end
    end
  end
end