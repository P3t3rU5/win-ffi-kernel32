require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= 8
    module Kernel32
      class WIN32_MEMORY_RANGE_ENTRY < FFIAdditions::Struct
        layout VirtualAddress: :pointer,
               NumberOfBytes:   :size_t
      end
    end
  end
end