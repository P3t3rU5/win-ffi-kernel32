module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/tool_help/heap_flag_32'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/tlhelp32/ns-tlhelp32-heaplist32
      class HEAPLIST32 < FFIAdditions::Struct
        attr_accessor :dwSize, :th32ProcessID, :th32HeapID, :dwFlags

        layout dwSize:        :size_t,
               th32ProcessID: :dword,
               th32HeapID:    :ulong_ptr,
               dwFlags:       HeapFlag32

        def initialize
          super
          self.dwSize = self.size
        end

        private :dwSize, :dwSize=
      end
    end
  end
end