module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/memory/heap/heap_flag'
    require_relative '../../enum/memory/heap/heap_information_class'

    require_relative '../../struct/memory/heap/summary'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-getprocessheap
      # @return [Integer]
      def self.GetProcessHeap; end
      attach_function 'GetProcessHeap', [:void], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-getprocessheaps
      # @param [Integer] numberOfHeaps
      # @param [FFI::Pointer] processHeaps
      # @return [Integer]
      def self.GetProcessHeaps(numberOfHeaps, processHeaps) end
      attach_function 'GetProcessHeaps', [:dword, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapalloc
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [Integer] dwBytes
      # @return [FFI::Pointer]
      def self.HeapAlloc(hHeap, dwFlags, dwBytes) end
      attach_function 'HeapAlloc', [:handle, HeapFlag, :size_t], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapcompact
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @return [Integer]
      def self.HeapCompact(hHeap, dwFlags) end
      attach_function 'HeapCompact', [:handle, HeapFlag], :size_t

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapcreate
      # @param [Integer] flOptions
      # @param [Integer] dwInitialSize
      # @param [Integer] dwMaximumSize
      # @return [Integer]
      def self.HeapCreate(flOptions, dwInitialSize, dwMaximumSize) end
      attach_function 'HeapCreate', [HeapFlag, :size_t, :size_t], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapdestroy
      # @param [Integer] hHeap
      # @return [true, false]
      def self.HeapDestroy(hHeap) end
      attach_function 'HeapDestroy', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapfree
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpMem
      # @return [true, false]
      def self.HeapFree(hHeap, dwFlags, lpMem) end
      attach_function 'HeapFree', [:handle, HeapFlag, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heaplock
      # @param [Integer] hHeap
      # @return [true, false]
      def self.HeapLock(hHeap) end
      attach_function 'HeapLock', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapqueryinformation
      # @param [Integer] heapHandle
      # @param [Integer] heapInformationClass
      # @param [FFI::Pointer] heapInformation
      # @param [Integer] heapInformationLength
      # @param [FFI::Pointer] returnLength
      # @return [true, false]
      def self.HeapQueryInformation(
          heapHandle, heapInformationClass, heapInformation, heapInformationLength, returnLength) end
      attach_function 'HeapQueryInformation', [:handle, HeapInformationClass, :pointer, :size_t, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heaprealloc
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpMem
      # @param [Integer] dwBytes
      # @return [FFI::Pointer]
      def self.HeapReAlloc(hHeap, dwFlags, lpMem, dwBytes) end
      attach_function 'HeapReAlloc', [:handle, HeapFlag, :pointer, :size_t], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation
      # @param [Integer] heapHandle
      # @param [Integer] heapInformationClass
      # @param [FFI::Pointer] heapInformation
      # @param [Integer] heapInformationLength
      # @return [true, false]
      def self.HeapSetInformation(heapHandle, heapInformationClass, heapInformation, heapInformationLength) end
      attach_function 'HeapSetInformation', [:handle, :int, :pointer, :size_t], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapsize
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpMem
      # @return [Integer]
      def self.HeapSize(hHeap, dwFlags, lpMem) end
      attach_function 'HeapSize', [:handle, HeapFlag, :pointer], :size_t

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapsummary
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpSummary
      # @return [true, false]
      def self.HeapSummary(hHeap, dwFlags, lpSummary) end
      attach_function 'HeapSummary', [:handle, HeapFlag, HEAP_SUMMARY.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapunlock
      # @param [Integer] hHeap
      # @return [true, false]
      def self.HeapUnlock(hHeap) end
      attach_function 'HeapUnlock', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapvalidate
      # BOOL HeapValidate( _In_      HANDLE hHeap, _In_      DWORD dwFlags, _In_opt_  LPCVOID lpMem )
      # @param [Integer] hHeap
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpMem
      def self.HeapValidate(hHeap, dwFlags, lpMem) end
      attach_function 'HeapValidate', [:handle, HeapFlag, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/heapapi/nf-heapapi-heapwalk
      # @param [Integer] hHeap
      # @param [FFI::Pointer] lpEntry
      # @return [true, false]
      def self.HeapWalk(hHeap, lpEntry) end
      attach_function 'HeapWalk', [:handle, :pointer], :bool
    end
  end
end