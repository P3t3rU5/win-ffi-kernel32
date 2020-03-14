module WinFFI
  if WINDOWS_VERSION >= 8
    require_relative '../../enum/memory/priority'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information
      class MEMORY_PRIORITY_INFORMATION < FFIAdditions::Struct
        attr_accessor :MemoryPriority

        layout MemoryPriority: MemoryPriority
      end
    end
  end
end