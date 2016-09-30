module WinFFI
  module Kernel32
    class HEAP_SUMMARY < FFIAdditions::Struct
      layout cb:           :dword,
             cbAllocated:  :size_t,
             cbCommitted:  :size_t,
             cbReserved:   :size_t,
             cbMaxReserve: :size_t
    end
  end
end