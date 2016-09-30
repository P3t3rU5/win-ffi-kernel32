require 'win-ffi/kernel32/enum/tool_help/heap_flag_32'

module WinFFI
  module Kernel32
    class HEAPLIST32 < FFIAdditions
      layout dwSize:        :size_t,
             th32ProcessID:  :dword,
             th32HeapID: :ulong_ptr,
             dwFlags:    HeapFlag32
    end
  end
end