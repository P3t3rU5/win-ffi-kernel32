require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/memory/heap/heap_flag'
require 'win-ffi/kernel32/enum/memory/heap/heap_information_class'

require 'win-ffi/kernel32/struct/memory/heap/heap_summary'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # Heap
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366569(v=vs.85).aspx
      # HANDLE WINAPI GetProcessHeap(void)
      attach_function 'GetProcessHeap', [:void], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366571(v=vs.85).aspx
      # DWORD WINAPI GetProcessHeaps(
      #   _In_   DWORD NumberOfHeaps,
      #   _Out_  PHANDLE ProcessHeaps )
      attach_function 'GetProcessHeaps', [:dword, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366597(v=vs.85).aspx
      # LPVOID WINAPI HeapAlloc(
      #   _In_  HANDLE hHeap,
      #   _In_  DWORD dwFlags,
      #   _In_  SIZE_T dwBytes )
      attach_function 'HeapAlloc', [:handle, HeapFlag, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366598(v=vs.85).aspx
      # SIZE_T WINAPI HeapCompact(
      #   _In_  HANDLE hHeap,
      #   _In_  DWORD dwFlags )
      attach_function 'HeapCompact', [:handle, HeapFlag], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366599(v=vs.85).aspx
      # HANDLE WINAPI HeapCreate(
      #   _In_  DWORD flOptions,
      #   _In_  SIZE_T dwInitialSize,
      #   _In_  SIZE_T dwMaximumSize )
      attach_function 'HeapCreate', [HeapFlag, :size_t, :size_t], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366700(v=vs.85).aspx
      # BOOL WINAPI HeapDestroy( _In_  HANDLE hHeap )
      attach_function 'HeapDestroy', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366701(v=vs.85).aspx
      # BOOL WINAPI HeapFree(
      #   _In_  HANDLE hHeap,
      #   _In_  DWORD dwFlags,
      #   _In_  LPVOID lpMem )
      attach_function 'HeapFree', [:handle, HeapFlag, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366702(v=vs.85).aspx
      # BOOL WINAPI HeapLock( _In_  HANDLE hHeap )
      attach_function 'HeapLock', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366703(v=vs.85).aspx
      # BOOL WINAPI HeapQueryInformation(
      #   _In_opt_   HANDLE HeapHandle,
      #   _In_       HEAP_INFORMATION_CLASS HeapInformationClass,
      #   _Out_      PVOID HeapInformation,
      #   _In_       SIZE_T HeapInformationLength,
      #   _Out_opt_  PSIZE_T ReturnLength )
      attach_function 'HeapQueryInformation', [:handle, HeapInformationClass, :pointer, :size_t, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366704(v=vs.85).aspx
      # LPVOID WINAPI HeapReAlloc(
      #   _In_  HANDLE hHeap,
      #   _In_  DWORD dwFlags,
      #   _In_  LPVOID lpMem,
      #   _In_  SIZE_T dwBytes )
      attach_function 'HeapReAlloc', [:handle, HeapFlag, :pointer, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366705(v=vs.85).aspx
      # BOOL WINAPI HeapSetInformation(
      #   _In_opt_  HANDLE HeapHandle,
      #   _In_      HEAP_INFORMATION_CLASS HeapInformationClass,
      #   _In_      PVOID HeapInformation,
      #   _In_      SIZE_T HeapInformationLength )
      attach_function 'HeapSetInformation', [:handle, :int, :pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366706(v=vs.85).aspx
      # SIZE_T WINAPI HeapSize(
      #   _In_  HANDLE hHeap,
      #   _In_  DWORD dwFlags,
      #   _In_  LPCVOID lpMem )
      attach_function 'HeapSize', [:handle, HeapFlag, :pointer], :size_t

      # BOOL HeapSummary(
      #   _In_ HANDLE hHeap,
      #   _In_ DWORD dwFlags,
      #   _Out_ LPHEAP_SUMMARY lpSummary)
      attach_function 'HeapSummary', [:handle, HeapFlag, HEAP_SUMMARY], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366707(v=vs.85).aspx
      # BOOL WINAPI HeapUnlock( _In_  HANDLE hHeap )
      attach_function 'HeapUnlock', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366708(v=vs.85).aspx
      # BOOL WINAPI HeapValidate(
      #   _In_      HANDLE hHeap,
      #   _In_      DWORD dwFlags,
      #   _In_opt_  LPCVOID lpMem )
      attach_function 'HeapValidate', [:handle, HeapFlag, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366710(v=vs.85).aspx
      # BOOL WINAPI HeapWalk(
      #   _In_     HANDLE hHeap,
      #   _Inout_  LPPROCESS_HEAP_ENTRY lpEntry )
      attach_function 'HeapWalk', [:handle, :pointer], :bool
    end
  end
end