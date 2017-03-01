require 'win-ffi/kernel32'

# TODO STANDARD_RIGHTS_REQUIRED 0x000F0000

module WinFFI
  if WINDOWS_VERSION >= :xp

    require 'win-ffi/kernel32/enum/memory/global_memory_flag'
    require 'win-ffi/kernel32/enum/memory/local_flag'
    require 'win-ffi/kernel32/enum/memory/memory_flag'
    require 'win-ffi/kernel32/enum/memory/memory_protection_constants'
    require 'win-ffi/kernel32/enum/memory/memory_acces'
    require 'win-ffi/kernel32/enum/memory/memory_resource_notification_type'
    require 'win-ffi/kernel32/enum/memory/process_dep'
    require 'win-ffi/kernel32/enum/memory/file_cache'
    require 'win-ffi/kernel32/enum/memory/file_map'
    require 'win-ffi/kernel32/enum/memory/offer_priority'

    require 'win-ffi/kernel32/struct/memory/memory_status'
    require 'win-ffi/kernel32/struct/memory/memory_status_ex'
    require 'win-ffi/kernel32/struct/memory/memory_basic_information'
    require 'win-ffi/kernel32/struct/memory/win32_memory_range_entry'

    require 'win-ffi/core/struct/security_attributes'


    module Kernel32

      typedef :pointer, :hlocal


      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366528(v=vs.85).aspx
      # BOOL WINAPI AllocateUserPhysicalPages(
      #   _In_     HANDLE hProcess,
      #   _Inout_  PULONG_PTR NumberOfPages,
      #   _Out_    PULONG_PTR UserPfnArray )
      attach_function 'AllocateUserPhysicalPages', [:handle, :ulong, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366537(v=vs.85).aspx
      # HANDLE WINAPI CreateFileMapping(
      #   _In_      HANDLE hFile,
      #   _In_opt_  LPSECURITY_ATTRIBUTES lpAttributes,
      #   _In_      DWORD flProtect,
      #   _In_      DWORD dwMaximumSizeHigh,
      #   _In_      DWORD dwMaximumSizeLow,
      #   _In_opt_  LPCTSTR lpName )
      encoded_function 'CreateFileMapping', [:handle, SECURITY_ATTRIBUTES.ptr(:in), MemoryAccess, :dword, :dword, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366541(v=vs.85).aspx
      # HANDLE WINAPI CreateMemoryResourceNotification( _In_  MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType )
      attach_function 'CreateMemoryResourceNotification', [MemoryResourceNotificationType], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366561(v=vs.85).aspx
      # void FillMemory(
      #   [out]  PVOID Destination,
      #   [in]   SIZE_T Length,
      #   [in]   BYTE Fill )
      attach_function 'RtlFillMemory', [:pointer, :size_t, :byte], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366563(v=vs.85).aspx
      # BOOL WINAPI FlushViewOfFile(
      #   _In_  LPCVOID lpBaseAddress,
      #   _In_  SIZE_T dwNumberOfBytesToFlush )
      attach_function 'FlushViewOfFile', [:pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366566(v=vs.85).aspx
      # BOOL WINAPI FreeUserPhysicalPages(
      #   _In_     HANDLE hProcess,
      #   _Inout_  PULONG_PTR NumberOfPages,
      #   _In_     PULONG_PTR UserPfnArray )
      attach_function 'FreeUserPhysicalPages', [:handle, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366568(v=vs.85).aspx
      # SIZE_T WINAPI GetLargePageMinimum(void)
      attach_function 'GetLargePageMinimum', [], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366573(v=vs.85).aspx
      # UINT WINAPI GetWriteWatch(
      #   _In_     DWORD dwFlags,
      #   _In_     PVOID lpBaseAddress,
      #   _In_     SIZE_T dwRegionSize,
      #   _Out_    PVOID *lpAddresses,
      #   _Inout_  PULONG_PTR lpdwCount,
      #   _Out_    PULONG lpdwGranularity )
      attach_function 'GetWriteWatch', [MemoryAccess, :pointer, :size_t, :pointer, :pointer, :pointer], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366712(v=vs.85).aspx
      # BOOL WINAPI IsBadCodePtr( _In_  FARPROC lpfn )
      attach_function 'IsBadCodePtr', [:pointer], :bool

      # BOOL IsBadHugeReadPtr(
      #   _In_opt_ CONST VOID *lp,
      #   _In_     UINT_PTR ucb)
      attach_function 'IsBadHugeReadPtr', [:pointer, :uint], :bool

      # BOOL IsBadHugeWritePtr(
      #   _In_opt_ LPVOID lp,
      #   _In_     UINT_PTR ucb)
      attach_function 'IsBadHugeWritePtr', [:pointer, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366713(v=vs.85).aspx
      # BOOL WINAPI IsBadReadPtr(
      #   _In_  const VOID *lp,
      #   _In_  UINT_PTR ucb )
      attach_function 'IsBadReadPtr', [:pointer, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366714(v=vs.85).aspx
      # BOOL WINAPI IsBadStringPtr(
      #   _In_  LPCTSTR lpsz,
      #   _In_  UINT_PTR ucchMax )
      encoded_function 'IsBadStringPtr', [:string, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366716(v=vs.85).aspx
      # BOOL WINAPI IsBadWritePtr(
      #   _In_  LPVOID lp,
      #   _In_  UINT_PTR ucb )
      attach_function 'IsBadWritePtr', [:pointer, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366753(v=vs.85).aspx
      # BOOL WINAPI MapUserPhysicalPages(
      #   _In_  PVOID lpAddress,
      #   _In_  ULONG_PTR NumberOfPages,
      #   _In_  PULONG_PTR UserPfnArray )
      attach_function 'MapUserPhysicalPages', [:pointer, :ulong, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366761(v=vs.85).aspx
      # LPVOID WINAPI MapViewOfFile(
      #   _In_  HANDLE hFileMappingObject,
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  DWORD dwFileOffsetHigh,
      #   _In_  DWORD dwFileOffsetLow,
      #   _In_  SIZE_T dwNumberOfBytesToMap )
      attach_function 'MapViewOfFile', [:handle, FileMap, :dword, :dword, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366763(v=vs.85).aspx
      # LPVOID WINAPI MapViewOfFileEx(
      #   _In_      HANDLE hFileMappingObject,
      #   _In_      DWORD dwDesiredAccess,
      #   _In_      DWORD dwFileOffsetHigh,
      #   _In_      DWORD dwFileOffsetLow,
      #   _In_      SIZE_T dwNumberOfBytesToMap,
      #   _In_opt_  LPVOID lpBaseAddress )
      attach_function 'MapViewOfFileEx', [:handle, FileMap, :dword, :dword, :size_t, :pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366755(v=vs.85).aspx
      # BOOL WINAPI MapUserPhysicalPagesScatter(
      #   _In_  PVOID *VirtualAddresses,
      #   _In_  ULONG_PTR NumberOfPages,
      #   _In_  PULONG_PTR PageArray )
      attach_function 'MapUserPhysicalPagesScatter', [:pointer, :ulong, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366788(v=vs.85).aspx
      # void MoveMemory(
      #   _In_  PVOID Destination,
      #   _In_  const VOID *Source,
      #   _In_  SIZE_T Length )
      attach_function 'RtlMoveMemory', [:pointer, :pointer, :size_t], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366791(v=vs.85).aspx
      # HANDLE WINAPI OpenFileMapping(
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  BOOL bInheritHandle,
      #   _In_  LPCTSTR lpName )
      encoded_function 'OpenFileMapping', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366799(v=vs.85).aspx
      # BOOL WINAPI QueryMemoryResourceNotification(
      #   _In_   HANDLE ResourceNotificationHandle,
      #   _Out_  PBOOL ResourceState )
      attach_function 'QueryMemoryResourceNotification', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366874(v=vs.85).aspx
      # UINT WINAPI ResetWriteWatch(
      #   _In_  LPVOID lpBaseAddress,
      #   _In_  SIZE_T dwRegionSize )
      attach_function 'ResetWriteWatch', [:pointer, :size_t], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366877(v=vs.85).aspx
      # PVOID SecureZeroMemory(
      #   _In_  PVOID ptr,
      #   _In_  SIZE_T cnt )
      # attach_function 'RtlSecureZeroMemory', [:pointer, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366882(v=vs.85).aspx
      # BOOL WINAPI UnmapViewOfFile( _In_  LPCVOID lpBaseAddress )
      attach_function 'UnmapViewOfFile', [:pointer], :bool

      #void ZeroMemory(
      #  [in]  PVOID Destination,
      #  [in]  SIZE_T Length )
      attach_function 'RtlZeroMemory', [:pointer, :size_t], :void

      # Global
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366574(v=vs.85).aspx
      # HGLOBAL WINAPI GlobalAlloc(
      #   _In_  UINT uFlags,
      #   _In_  SIZE_T dwBytes )
      attach_function 'GlobalAlloc', [GlobalMemoryFlag, :size_t], :hglobal

      # SIZE_T GlobalCompact(_In_ DWORD dwMinFree)
      attach_function 'GlobalCompact', [:dword], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366577(v=vs.85).aspx
      # UINT WINAPI GlobalFlags( _In_  HGLOBAL hMem )
      attach_function 'GlobalFlags', [:hglobal], :uint

      # VOID GlobalFix(_In_ HGLOBAL hMem)
      attach_function 'GlobalFix', [:hglobal], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366579(v=vs.85).aspx
      # HGLOBAL WINAPI GlobalFree( _In_  HGLOBAL hMem )
      attach_function 'GlobalFree', [:hglobal], :hglobal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366582(v=vs.85).aspx
      # HGLOBAL WINAPI GlobalHandle( _In_  LPCVOID pMem )
      attach_function 'GlobalHandle', [:pointer], :hglobal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366584(v=vs.85).aspx
      # LPVOID WINAPI GlobalLock( _In_  HGLOBAL hMem )
      attach_function 'GlobalLock', [:hglobal], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366586(v=vs.85).aspx
      # void WINAPI GlobalMemoryStatus( _Out_  LPMEMORYSTATUS lpBuffer )
      attach_function 'GlobalMemoryStatus', [MEMORYSTATUS.ptr(:out)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366589(v=vs.85).aspx
      # BOOL WINAPI GlobalMemoryStatusEx( _Inout_  LPMEMORYSTATUSEX lpBuffer )
      attach_function 'GlobalMemoryStatusEx', [MEMORYSTATUSEX.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366590(v=vs.85).aspx
      # HGLOBAL WINAPI GlobalReAlloc(
      #   _In_  HGLOBAL hMem,
      #   _In_  SIZE_T dwBytes,
      #   _In_  UINT uFlags )
      attach_function 'GlobalReAlloc', [:hglobal, :size_t, GlobalMemoryFlag], :hglobal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366593(v=vs.85).aspx
      # SIZE_T WINAPI GlobalSize( _In_  HGLOBAL hMem )
      attach_function 'GlobalSize', [:hglobal], :size_t

      # VOID GlobalUnfix(_In_ HGLOBAL hMem)
      attach_function 'GlobalUnfix', [:hglobal], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366595(v=vs.85).aspx
      # BOOL WINAPI GlobalUnlock( _In_  HGLOBAL hMem )
      attach_function 'GlobalUnlock', [:hglobal], :bool

      # BOOL GlobalUnWire(_In_ HGLOBAL hMem)
      attach_function 'GlobalUnWire', [:hglobal], :bool

      # LPVOID GlobalWire(_In_ HGLOBAL hMem)
      attach_function 'GlobalWire', [:hglobal], :pointer

      # Local
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366723(v=vs.85).aspx
      # HLOCAL WINAPI LocalAlloc(
      #   _In_  UINT uFlags,
      #   _In_  SIZE_T uBytes )
      attach_function 'LocalAlloc', [LocalFlag, :size_t], :ulong

      # SIZE_T LocalCompact(_In_ UINT uMinFree)
      attach_function 'LocalCompact', [:uint], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366728(v=vs.85).aspx
      # UINT WINAPI LocalFlags( _In_  HLOCAL hMem )
      attach_function 'LocalFlags', [:hlocal], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366730(v=vs.85).aspx
      # HLOCAL WINAPI LocalFree( _In_  HLOCAL hMem )
      attach_function 'LocalFree', [:hlocal], :hlocal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366733(v=vs.85).aspx
      # HLOCAL WINAPI LocalHandle( _In_  LPCVOID pMem )
      attach_function 'LocalHandle', [:pointer], :hlocal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366737(v=vs.85).aspx
      # LPVOID WINAPI LocalLock( _In_  HLOCAL hMem )
      attach_function 'LocalLock', [:hlocal], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366742(v=vs.85).aspx
      # HLOCAL WINAPI LocalReAlloc(
      #   _In_  HLOCAL hMem,
      #   _In_  SIZE_T uBytes,
      #   _In_  UINT uFlags )
      attach_function 'LocalReAlloc', [:hlocal, :size_t, LocalFlag], :hlocal

      # SIZE_T LocalShrink(
      #   _In_ HLOCAL hMem,
      #   _In_ UINT cbNewSize)
      attach_function 'LocalShrink', [:hlocal, :uint], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366745(v=vs.85).aspx
      # UINT WINAPI LocalSize( _In_  HLOCAL hMem )
      attach_function 'LocalSize', [:hlocal], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366747(v=vs.85).aspx
      # BOOL WINAPI LocalUnlock( _In_  HLOCAL hMem )
      attach_function 'LocalUnlock', [:hlocal], :bool


      #Virtual
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366887(v=vs.85).aspx
      # LPVOID WINAPI VirtualAlloc(
      #   _In_opt_  LPVOID lpAddress,
      #   _In_      SIZE_T dwSize,
      #   _In_      DWORD flAllocationType,
      #   _In_      DWORD flProtect )
      attach_function 'VirtualAlloc', [:pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366890(v=vs.85).aspx
      # LPVOID WINAPI VirtualAllocEx(
      #   _In_      HANDLE hProcess,
      #   _In_opt_  LPVOID lpAddress,
      #   _In_      SIZE_T dwSize,
      #   _In_      DWORD flAllocationType,
      #   _In_      DWORD flProtect )
      attach_function 'VirtualAllocEx', [:handle, :pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366892(v=vs.85).aspx
      # BOOL WINAPI VirtualFree(
      #   _In_  LPVOID lpAddress,
      #   _In_  SIZE_T dwSize,
      #   _In_  DWORD dwFreeType )
      attach_function 'VirtualFree', [:pointer, :size_t, MemoryFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366894(v=vs.85).aspx
      # BOOL WINAPI VirtualFreeEx(
      #   _In_  HANDLE hProcess,
      #   _In_  LPVOID lpAddress,
      #   _In_  SIZE_T dwSize,
      #   _In_  DWORD dwFreeType )
      attach_function 'VirtualFreeEx', [:handle, :pointer, :size_t, MemoryFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366895(v=vs.85).aspx
      # BOOL WINAPI VirtualLock(
      #   _In_  LPVOID lpAddress,
      #   _In_  SIZE_T dwSize )
      attach_function 'VirtualLock', [:pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366898(v=vs.85).aspx
      # BOOL WINAPI VirtualProtect(
      #   _In_   LPVOID lpAddress,
      #   _In_   SIZE_T dwSize,
      #   _In_   DWORD flNewProtect,
      #   _Out_  PDWORD lpflOldProtect )
      attach_function 'VirtualProtect', [:pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366899(v=vs.85).aspx
      # BOOL WINAPI VirtualProtectEx(
      #   _In_   HANDLE hProcess,
      #   _In_   LPVOID lpAddress,
      #   _In_   SIZE_T dwSize,
      #   _In_   DWORD flNewProtect,
      #   _Out_  PDWORD lpflOldProtect )
      attach_function 'VirtualProtectEx', [:handle, :pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366902(v=vs.85).aspx
      # SIZE_T WINAPI VirtualQuery(
      #   _In_opt_  LPCVOID lpAddress,
      #   _Out_     PMEMORY_BASIC_INFORMATION lpBuffer,
      #   _In_      SIZE_T dwLength )
      attach_function 'VirtualQuery', [:pointer, MEMORY_BASIC_INFORMATION.ptr, :size_t], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366907(v=vs.85).aspx
      # SIZE_T WINAPI VirtualQueryEx(
      #   _In_      HANDLE hProcess,
      #   _In_opt_  LPCVOID lpAddress,
      #   _Out_     PMEMORY_BASIC_INFORMATION lpBuffer,
      #   _In_      SIZE_T dwLength )
      attach_function 'VirtualQueryEx', [:handle, :pointer, MEMORY_BASIC_INFORMATION.ptr, :size_t], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366910(v=vs.85).aspx
      # BOOL WINAPI VirtualUnlock(
      #   _In_  LPVOID lpAddress,
      #   _In_  SIZE_T dwSize )
      attach_function 'VirtualUnlock', [:pointer, :size_t], :bool

      if Architecture == 'x64-mingw32'

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa965224(v=vs.85).aspx
        # BOOL WINAPI GetSystemFileCacheSize(
        #   _Out_  PSIZE_T lpMinimumFileCacheSize,
        #   _Out_  PSIZE_T lpMaximumFileCacheSize,
        #   _Out_  PDWORD lpFlags )
        attach_function 'GetSystemFileCacheSize', [:pointer, :pointer, FileCache], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa965240(v=vs.85).aspx
        # BOOL WINAPI SetSystemFileCacheSize(
        #   _In_  SIZE_T MinimumFileCacheSize,
        #   _In_  SIZE_T MaximumFileCacheSize,
        #   _In_  DWORD Flags )
        attach_function 'SetSystemFileCacheSize', [:size_t, :size_t, FileCache], :bool

      end

      if (WINDOWS_VERSION.sp == 3 && WINDOWS_VERSION == :xp) || (WINDOWS_VERSION.sp == 1 && WINDOWS_VERSION == :vista) || WINDOWS_VERSION >= 7

        # https://msdn.microsoft.com/en-us/library/windows/desktop/bb736297(v=vs.85).aspx
        # BOOL WINAPI GetProcessDEPPolicy(
        #   _In_   HANDLE hProcess,
        #   _Out_  LPDWORD lpFlags,
        #   _Out_  PBOOL lpPermanent )
        attach_function 'GetProcessDEPPolicy', [:handle, ProcessDEP, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/bb736298(v=vs.85).aspx
        # DEP_SYSTEM_POLICY_TYPE WINAPI GetSystemDEPPolicy(void)
        attach_function 'GetSystemDEPPolicy', [], :uint

        # https://msdn.microsoft.com/en-us/library/windows/desktop/bb736299(v=vs.85).aspx
        # BOOL WINAPI SetProcessDEPPolicy( _In_  DWORD dwFlags )
        attach_function 'SetProcessDEPPolicy', [ProcessDEP], :bool

        if (WINDOWS_VERSION.sp == 1 && WINDOWS_VERSION == :vista) || WINDOWS_VERSION >= 7

          # https://msdn.microsoft.com/en-us/library/windows/desktop/bb870882(v=vs.85).aspx
          # BOOLEAN CALLBACK SecureMemoryCacheCallback(
          #   _In_  PVOID Addr,
          #   _In_  SIZE_T Range )
          SecureMemoryCacheCallback = callback 'SecureMemoryCacheCallback', [:pointer, :size_t], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/bb870879(v=vs.85).aspx
          # BOOL WINAPI AddSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
          attach_function 'AddSecureMemoryCacheCallback', [SecureMemoryCacheCallback], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/cc300158(v=vs.85).aspx
          # BOOL WINAPI GetPhysicallyInstalledSystemMemory( _Out_  PULONGLONG TotalMemoryInKilobytes )
          attach_function 'GetPhysicallyInstalledSystemMemory', [:pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/bb870881(v=vs.85).aspx
          # BOOL WINAPI RemoveSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
          attach_function 'RemoveSecureMemoryCacheCallback', [SecureMemoryCacheCallback], :bool

          if WINDOWS_VERSION >= 8

            # define MEHC_PATROL_SCRUBBER_PRESENT  0x1
            MEHC_PATROL_SCRUBBER_PRESENT = 0x1

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691011(v=vs.85).aspx
            # VOID WINAPI BadMemoryCallbackRoutine(VOID)
            BadMemoryCallbackRoutine = callback 'BadMemoryCallbackRoutine', [], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh994453(v=vs.85).aspx
            # HANDLE WINAPI CreateFileMappingFromApp(
            #   _In_      HANDLE hFile,
            #   _In_opt_  PSECURITY_ATTRIBUTES SecurityAttributes,
            #   _In_      ULONG PageProtection,
            #   _In_      ULONG64 MaximumSize,
            #   _In_opt_  PCWSTR Name )
            attach_function 'CreateFileMappingFromApp',
                            [:handle, SECURITY_ATTRIBUTES.ptr(:in), MemoryAccess, :ulong_long, :string], :handle

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691012(v=vs.85).aspx
            # BOOL WINAPI GetMemoryErrorHandlingCapabilities( _Out_  PULONG Capabilities )
            attach_function 'GetMemoryErrorHandlingCapabilities', [:pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh994454(v=vs.85).aspx
            # PVOID WINAPI MapViewOfFileFromApp(
            #   _In_  HANDLE hFileMappingObject,
            #   _In_  ULONG DesiredAccess,
            #   _In_  ULONG64 FileOffset,
            #   _In_  SIZE_T NumberOfBytesToMap )
            attach_function 'MapViewOfFileFromApp', [:handle, FileMap, :ulong, :size_t], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh780543(v=vs.85).aspx
            # BOOL WINAPI PrefetchVirtualMemory(
            #   _In_  HANDLE hProcess,
            #   _In_  ULONG_PTR NumberOfEntries,
            #   _In_  PWIN32_MEMORY_RANGE_ENTRY VirtualAddresses,
            #   _In_  ULONG Flags )
            attach_function 'PrefetchVirtualMemory', [:handle, :ulong, WIN32_MEMORY_RANGE_ENTRY.ptr, :ulong], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691013(v=vs.85).aspx
            # PVOID WINAPI RegisterBadMemoryNotification( _In_  PBAD_MEMORY_CALLBACK_ROUTINE Callback )
            attach_function 'RegisterBadMemoryNotification', [BadMemoryCallbackRoutine], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/mt670639(v=vs.85).aspx
            # BOOL WINAPI UnmapViewOfFileEx(
            #   _In_ LPCVOID lpBaseAddress,
            #   _In_ DWORD   UnmapFlags)
            attach_function 'UnmapViewOfFileEx', [:pointer, MemoryAccess], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691014(v=vs.85).aspx
            # BOOL WINAPI UnregisterBadMemoryNotification( _In_  PVOID RegistrationHandle )
            attach_function 'UnregisterBadMemoryNotification', [:pointer], :bool

            if WINDOWS_VERSION >= 8.1

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781432(v=vs.85).aspx
              # DWORD WINAPI DiscardVirtualMemory(
              #   _In_ PVOID  VirtualAddress,
              #   _In_ SIZE_T Size)
              attach_function 'DiscardVirtualMemory', [:pointer, :size_t], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781436(v=vs.85).aspx
              # DWORD WINAPI OfferVirtualMemory(
              #   _In_ PVOID          VirtualAddress,
              #   _In_ SIZE_T         Size,
              #   _In_ OFFER_PRIORITY Priority)
              attach_function 'OfferVirtualMemory', [:pointer, :size_t, OfferPriority], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781437(v=vs.85).aspx
              # DWORD WINAPI ReclaimVirtualMemory(
              #   _In_ PVOID  VirtualAddress,
              #   _In_ SIZE_T Size)
              attach_function 'ReclaimVirtualMemory', [:pointer, :size_t], :dword

              if WINDOWS_VERSION >= 10

                # PVOID WINAPI CreateEnclave(
                #   _In_      HANDLE  hProcess,
                #   _In_opt_  LPVOID  lpAddress,
                #   _In_      SIZE_T  dwSize,
                #   _In_      SIZE_T  dwInitialCommittment,
                #   _In_      DWORD   flEnclaveType,
                #   _In_      LPCVOID lpEnclaveInformation,
                #   _In_      DWORD   dwInfoLength,
                #   _Out_opt_ LPDWORD lpEnclaveError)
                attach_function 'CreateEnclave', [:handle, :pointer, :size_t, :size_t, :dword, :pointer, :dword, :pointer],
                                :pointer

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt592869(v=vs.85).aspx
                # BOOL WINAPI InitializeEnclave(
                #   _In_ HANDLE  hProcess,
                #   _In_ LPVOID  lpAddress,
                #   _In_ LPVOID  lpEnclaveInformation,
                #   _In_ DWORD   dwInfoLength,
                #   _In_ LPDWORD lpEnclaveError)
                attach_function 'InitializeEnclave', [:handle, :pointer, :pointer, :dword, :pointer], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt592870(v=vs.85).aspx
                # BOOL WINAPI IsEnclaveTypeSupported(
                #   _In_ DWORD flEnclaveType)
                attach_function 'IsEnclaveTypeSupported', [:dword], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt592871(v=vs.85).aspx
                # BOOL WINAPI LoadEnclaveData(
                #   _In_      HANDLE  hProcess,
                #   _In_      LPVOID  lpAddress,
                #   _In_      LPCVOID lpBuffer,
                #   _In_      SIZE_T  nSize,
                #   _In_      DWORD   flProtect,
                #   _In_      LPCVOID lpPageInformation,
                #   _In_      DWORD   dwInfoLength,
                #   _Out_     PSIZE_T lpNumberOfBytesWritten,
                #   _Out_opt_ LPDWORD lpEnclaveError)
                attach_function 'LoadEnclaveData',
                                [:handle, :pointer, :pointer, :size_t, :dword, :pointer, :pointer, :dword, :pointer,
                                 :pointer], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt169844(v=vs.85).aspx
                # HANDLE WINAPI OpenFileMappingFromApp(
                #   _In_ ULONG  DesiredAccess,
                #   _In_ BOOL   InheritHandle,
                #   _In_ PCWSTR Name)
                attach_function 'OpenFileMappingFromApp', [FileMap, :bool, :string], :handle

                #define FILE_MAP_TARGETS_INVALID       0x40000000
                FILE_MAP_TARGETS_INVALID = 0x40000000

                # https://msdn.microsoft.com/en-us/library/windows/desktop/dn934202(v=vs.85).aspx
                # WINAPI SetProcessValidCallTargets(
                #   _In_    HANDLE                hProcess,
                #   _In_    PVOID                 VirtualAddress,
                #   _In_    SIZE_T                RegionSize,
                #   _In_    ULONG                 NumberOfOffsets,
                #   _Inout_ PCFG_CALL_TARGET_INFO OffsetInformation)
                attach_function 'SetProcessValidCallTargets', [:handle, :pointer, :size_t, :ulong, :pointer], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt169845(v=vs.85).aspx
                # PVOID WINAPI VirtualAllocFromApp(
                #   _In_opt_ PVOID  BaseAddress,
                #   _In_     SIZE_T Size,
                #   _In_     ULONG  AllocationType,
                #   _In_     ULONG  Protection)
                attach_function 'VirtualAllocFromApp',
                                [:pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt169846(v=vs.85).aspx
                # BOOL WINAPI VirtualProtectFromApp(
                #   _In_  PVOID  Address,
                #   _In_  SIZE_T Size,
                #   _In_  ULONG  NewProtection,
                #   _Out_ PULONG OldProtection)
                attach_function 'VirtualProtectFromApp', [:pointer, :size_t, :ulong, :pointer], :bool

              end
            end
          end
        end
      end
    end
  end
end