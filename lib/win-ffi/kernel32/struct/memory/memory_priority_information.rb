require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= 8

    require 'win-ffi/kernel32/enum/memory/memory_priority'
    module Kernel32
      class MEMORY_PRIORITY_INFORMATION < FFIAdditions::Struct
        layout MemoryPriority: MemoryPriority
      end
    end
  end
end