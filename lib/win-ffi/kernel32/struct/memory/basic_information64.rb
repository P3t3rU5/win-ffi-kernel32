module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-memory_basic_information
      class MEMORY_BASIC_INFORMATION64 < FFIAdditions::Struct
        attr_accessor :BaseAddress,
                      :AllocationBase,
                      :AllocationProtect,
                      :__alignment1,
                      :RegionSize,
                      :State,
                      :Protect,
                      :Type,
                      :__alignment2

        layout BaseAddress:       :ulong_long,
               AllocationBase:    :ulong_long,
               AllocationProtect: :dword,
               __alignment1:      :dword,
               RegionSize:        :ulong_long,
               State:             :dword,
               Protect:           :dword,
               Type:              :dword,
               __alignment2:      :dword
      end
    end
  end
end
