require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= 8
    module Kernel32
      class WIN32_MEMORY_RANGE_ENTRY < FFIStruct
        layout :VirtualAddress, :pointer,
               :NumberOfBytes,  :size_t
      end
    end
  end
end