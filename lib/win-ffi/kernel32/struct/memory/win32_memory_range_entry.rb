module WinFFI
  if WINDOWS_VERSION >= 8
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_range_entry
      class WIN32_MEMORY_RANGE_ENTRY < FFIAdditions::Struct
        attr_accessor :VirtualAddress, :NumberOfBytes

        layout VirtualAddress: :pointer,
               NumberOfBytes:  :size_t
      end
    end
  end
end