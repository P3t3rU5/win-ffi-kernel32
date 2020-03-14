module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/heapapi/ns-heapapi-heap_summary
    class HEAP_SUMMARY < FFIAdditions::Struct
      attr_accessor :cb, :cbAllocated, :cbCommitted, :cbReserved, :cbMaxReserve

      layout cb:           :dword,
             cbAllocated:  :size_t,
             cbCommitted:  :size_t,
             cbReserved:   :size_t,
             cbMaxReserve: :size_t

      def initialize
        super
        self.cb = self.size
      end

      private :cb, :cb=
    end
  end
end