# TODO STANDARD_RIGHTS_REQUIRED 0x000F0000

module WinFFI
  if WINDOWS_VERSION >= :xp

    require 'win-ffi/core/struct/security_attributes'

    require_relative '../enum/memory/flag'
    require_relative '../enum/memory/protection_constants'
    require_relative '../enum/memory/acces'
    require_relative '../enum/memory/resource_notification_type'
    require_relative '../enum/memory/process_dep'
    require_relative '../enum/memory/file_cache'
    require_relative '../enum/memory/file_map'
    require_relative '../enum/memory/offer_priority'

    require_relative '../struct/memory/status'
    require_relative '../struct/memory/status_ex'
    require_relative '../struct/memory/basic_information'
    require_relative '../struct/memory/win32_memory_range_entry'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366528
      # BOOL AllocateUserPhysicalPages(
      #   _In_     HANDLE hProcess,
      #   _Inout_  PULONG_PTR NumberOfPages,
      #   _Out_    PULONG_PTR UserPfnArray )
      def self.AllocateUserPhysicalPages(hProcess, numberOfPages, userPfnArray) end
      attach_function 'AllocateUserPhysicalPages', [:handle, :pointer, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createfilemappinga
      # HANDLE CreateFileMapping(
      #   _In_      HANDLE hFile,
      #   _In_opt_  LPSECURITY_ATTRIBUTES lpAttributes,
      #   _In_      DWORD flProtect,
      #   _In_      DWORD dwMaximumSizeHigh,
      #   _In_      DWORD dwMaximumSizeLow,
      #   _In_opt_  LPCTSTR lpName )
      def self.CreateFileMapping(hFile, lpAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow, lpName) end
      encoded_function 'CreateFileMapping',
                       [:handle, SECURITY_ATTRIBUTES.ptr(:in), MemoryAccess, :dword, :dword, :string],
                       :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366541
      # HANDLE CreateMemoryResourceNotification( _In_  MEMORY_RESOURCE_NOTIFICATION_TYPE NotificationType )
      def self.CreateMemoryResourceNotification(notificationType) end
      attach_function 'CreateMemoryResourceNotification', [MemoryResourceNotificationType], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366561
      # void FillMemory( [out]  PVOID Destination, [in]   SIZE_T Length, [in]   BYTE Fill )
      def self.RtlFillMemory(destination, length, fill) end
      attach_function 'RtlFillMemory', [:pointer, :size_t, :byte], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366563
      # BOOL FlushViewOfFile( _In_  LPCVOID lpBaseAddress, _In_  SIZE_T dwNumberOfBytesToFlush )
      def self.FlushViewOfFile(lpBaseAddress, dwNumberOfBytesToFlush) end
      attach_function 'FlushViewOfFile', [:pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366566
      # BOOL FreeUserPhysicalPages(_In_ HANDLE hProcess, _Inout_ PULONG_PTR NumberOfPages, _In_ PULONG_PTR UserPfnArray)
      def self.FreeUserPhysicalPages(hProcess, numberOfPages, userPfnArray) end
      attach_function 'FreeUserPhysicalPages', [:handle, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366568
      # SIZE_T GetLargePageMinimum(void)
      def self.GetLargePageMinimum; end
      attach_function 'GetLargePageMinimum', [], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366573
      # UINT GetWriteWatch(
      #   _In_     DWORD dwFlags,
      #   _In_     PVOID lpBaseAddress,
      #   _In_     SIZE_T dwRegionSize,
      #   _Out_    PVOID *lpAddresses,
      #   _Inout_  PULONG_PTR lpdwCount,
      #   _Out_    PULONG lpdwGranularity )
      def self.GetWriteWatch(dwFlags, lpBaseAddress, dwRegionSize, lpAddresses, lpdwCount, lpdwGranularity) end
      attach_function 'GetWriteWatch', [MemoryAccess, :pointer, :size_t, :pointer, :pointer, :pointer], :uint

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-isbadcodeptr
      # BOOL IsBadCodePtr( _In_  FARPROC lpfn )
      def self.IsBadCodePtr(lpfn) end
      attach_function 'IsBadCodePtr', [:pointer], :bool

      # BOOL IsBadHugeReadPtr( _In_opt_ CONST VOID *lp, _In_     UINT_PTR ucb)
      def self.IsBadHugeReadPtr(lp, ucb) end
      attach_function 'IsBadHugeReadPtr', [:pointer, :uint_ptr], :bool

      # BOOL IsBadHugeWritePtr( _In_opt_ LPVOID lp, _In_     UINT_PTR ucb)
      def self.IsBadHugeWritePtr(lp, ucb) end
      attach_function 'IsBadHugeWritePtr', [:pointer, :uint_ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-isbadreadptr
      # BOOL IsBadReadPtr( _In_  const VOID *lp, _In_  UINT_PTR ucb )
      def self.IsBadReadPtr(lp, ucb) end
      attach_function 'IsBadReadPtr', [:pointer, :uint_ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-isbadstringptra
      # BOOL IsBadStringPtr( _In_  LPCTSTR lpsz, _In_  UINT_PTR ucchMax )
      def self.IsBadStringPtr(lpsz, ucchMax) end
      encoded_function 'IsBadStringPtr', [:string, :uint_ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-isbadwriteptr
      # BOOL IsBadWritePtr( _In_  LPVOID lp, _In_  UINT_PTR ucb )
      def self.IsBadWritePtr(lp, ucb) end
      attach_function 'IsBadWritePtr', [:pointer, :uint_ptr], :bool

      # TODO Itanium
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366753
      # BOOL MapUserPhysicalPages(
      #   _In_  PVOID lpAddress,
      #   _In_  ULONG_PTR NumberOfPages,
      #   _In_  PULONG_PTR UserPfnArray )
      def self.MapUserPhysicalPages(lpAddress, numberOfPages, userPfnArray) end
      attach_function 'MapUserPhysicalPages', [:pointer, :ulong_ptr, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366761
      # LPVOID MapViewOfFile(
      #   _In_  HANDLE hFileMappingObject,
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  DWORD dwFileOffsetHigh,
      #   _In_  DWORD dwFileOffsetLow,
      #   _In_  SIZE_T dwNumberOfBytesToMap )
      def self.MapViewOfFile(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow,
          dwNumberOfBytesToMap) end
      attach_function 'MapViewOfFile', [:handle, FileMap, :dword, :dword, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366763
      # LPVOID MapViewOfFileEx(
      #   _In_      HANDLE hFileMappingObject,
      #   _In_      DWORD dwDesiredAccess,
      #   _In_      DWORD dwFileOffsetHigh,
      #   _In_      DWORD dwFileOffsetLow,
      #   _In_      SIZE_T dwNumberOfBytesToMap,
      #   _In_opt_  LPVOID lpBaseAddress )
      def self.MapViewOfFileEx(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow,
          dwNumberOfBytesToMap, lpBaseAddress) end
      attach_function 'MapViewOfFileEx', [:handle, FileMap, :dword, :dword, :size_t, :pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-mapuserphysicalpagesscatter
      # BOOL MapUserPhysicalPagesScatter(
      #   _In_  PVOID *VirtualAddresses,
      #   _In_  ULONG_PTR NumberOfPages,
      #   _In_  PULONG_PTR PageArray )
      def self.MapUserPhysicalPagesScatter(virtualAddresses, numberOfPages, pageArray) end
      attach_function 'MapUserPhysicalPagesScatter', [:pointer, :ulong_ptr, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366788
      # void MoveMemory( _In_  PVOID Destination, _In_  const VOID *Source, _In_  SIZE_T Length )
      def self.RtlMoveMemory(destination, source, length) end
      attach_function 'RtlMoveMemory', [:pointer, :pointer, :size_t], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openfilemappinga
      # HANDLE OpenFileMapping( _In_  DWORD dwDesiredAccess, _In_  BOOL bInheritHandle, _In_  LPCTSTR lpName )
      def self.OpenFileMapping(dwDesiredAccess, bInheritHandle, lpName) end
      encoded_function 'OpenFileMapping', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366799
      # BOOL QueryMemoryResourceNotification(_In_ HANDLE ResourceNotificationHandle, _Out_ PBOOL ResourceState)
      def self.QueryMemoryResourceNotification( resourceNotificationHandle, resourceState) end
      attach_function 'QueryMemoryResourceNotification', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366874
      # UINT ResetWriteWatch( _In_  LPVOID lpBaseAddress, _In_  SIZE_T dwRegionSize )
      def self.ResetWriteWatch(lpBaseAddress, dwRegionSize) end
      attach_function 'ResetWriteWatch', [:pointer, :size_t], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366877
      # PVOID SecureZeroMemory( _In_  PVOID ptr, _In_  SIZE_T cnt )
      # def self.RtlSecureZeroMemory(ptr, cnt) end
      # attach_function 'RtlSecureZeroMemory', [:pointer, :size_t], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366882
      # BOOL UnmapViewOfFile( _In_  LPCVOID lpBaseAddress )
      def self.UnmapViewOfFile(lpBaseAddress) end
      attach_function 'UnmapViewOfFile', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows-hardware/drivers/ddi/content/wdm/nf-wdm-rtlzeromemory
      # void ZeroMemory( [in]  PVOID Destination, [in]  SIZE_T Length )
      def self.RtlZeroMemory(destination, length) end
      attach_function 'RtlZeroMemory', [:pointer, :size_t], :void

      if WinFFI.x64?
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa965224
        # BOOL GetSystemFileCacheSize(
        #   _Out_  PSIZE_T lpMinimumFileCacheSize,
        #   _Out_  PSIZE_T lpMaximumFileCacheSize,
        #   _Out_  PDWORD lpFlags )
        def self.GetSystemFileCacheSize( lpMinimumFileCacheSize, lpMaximumFileCacheSize, lpFlags) end
        attach_function 'GetSystemFileCacheSize', [:pointer, :pointer, FileCache], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa965240
        # BOOL SetSystemFileCacheSize(
        #   _In_  SIZE_T MinimumFileCacheSize,
        #   _In_  SIZE_T MaximumFileCacheSize,
        #   _In_  DWORD Flags )
        def self.SetSystemFileCacheSize(minimumFileCacheSize, maximumFileCacheSize, flags) end
        attach_function 'SetSystemFileCacheSize', [:size_t, :size_t, FileCache], :bool
      end

      if (WINDOWS_VERSION.sp == 3 && WINDOWS_VERSION == :xp) || (WINDOWS_VERSION.sp == 1 && WINDOWS_VERSION == :vista) || WINDOWS_VERSION >= 7
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprocessdeppolicy
        # BOOL GetProcessDEPPolicy( _In_   HANDLE hProcess, _Out_  LPDWORD lpFlags, _Out_  PBOOL lpPermanent )
        def self.GetProcessDEPPolicy(hProcess, lpFlags, lpPermanent) end
        attach_function 'GetProcessDEPPolicy', [:handle, ProcessDEP, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getsystemdeppolicy
        # DEP_SYSTEM_POLICY_TYPE GetSystemDEPPolicy(void)
        def self.GetSystemDEPPolicy; end
        attach_function 'GetSystemDEPPolicy', [], :uint

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setprocessdeppolicy
        # BOOL SetProcessDEPPolicy( _In_  DWORD dwFlags )
        def self.SetProcessDEPPolicy(dwFlags) end
        attach_function 'SetProcessDEPPolicy', [ProcessDEP], :bool

        if (WINDOWS_VERSION.sp == 1 && WINDOWS_VERSION == :vista) || WINDOWS_VERSION >= 7
          # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nc-winnt-psecure_memory_cache_callback
          # BOOLEAN CALLBACK SecureMemoryCacheCallback( _In_  PVOID Addr, _In_  SIZE_T Range )
          SecureMemoryCacheCallback = callback 'SecureMemoryCacheCallback', [:pointer, :size_t], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-addsecurememorycachecallback
          # BOOL AddSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
          def self.AddSecureMemoryCacheCallback(pfnCallBack) end
          attach_function 'AddSecureMemoryCacheCallback', [SecureMemoryCacheCallback], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/cc300158
          # BOOL GetPhysicallyInstalledSystemMemory( _Out_  PULONGLONG TotalMemoryInKilobytes )
          def self.GetPhysicallyInstalledSystemMemory(totalMemoryInKilobytes) end
          attach_function 'GetPhysicallyInstalledSystemMemory', [:pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-removesecurememorycachecallback
          # BOOL RemoveSecureMemoryCacheCallback( _In_  PSECURE_MEMORY_CACHE_CALLBACK pfnCallBack )
          def self.RemoveSecureMemoryCacheCallback(pfnCallBack) end
          attach_function 'RemoveSecureMemoryCacheCallback', [SecureMemoryCacheCallback], :bool

          if WINDOWS_VERSION >= 8
            # define MEHC_PATROL_SCRUBBER_PRESENT  0x1
            MEHC_PATROL_SCRUBBER_PRESENT = 0x1

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691011
            # VOID BadMemoryCallbackRoutine(VOID)
            BadMemoryCallbackRoutine = callback 'BadMemoryCallbackRoutine', [], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-createfilemappingfromapp
            # HANDLE CreateFileMappingFromApp(
            #   _In_      HANDLE hFile,
            #   _In_opt_  PSECURITY_ATTRIBUTES SecurityAttributes,
            #   _In_      ULONG PageProtection,
            #   _In_      ULONG64 MaximumSize,
            #   _In_opt_  PCWSTR Name )
            def self.CreateFileMappingFromApp(hFile, securityAttributes, pageProtection, maximumSize, name) end
            attach_function 'CreateFileMappingFromApp',
                            [:handle, SECURITY_ATTRIBUTES.ptr(:in), MemoryAccess, :ulong_long, :string], :handle

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691012
            # BOOL GetMemoryErrorHandlingCapabilities( _Out_  PULONG Capabilities )
            def self.GetMemoryErrorHandlingCapabilities(capabilities) end
            attach_function 'GetMemoryErrorHandlingCapabilities', [:pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-mapviewoffilefromapp
            # PVOID MapViewOfFileFromApp(
            #   _In_  HANDLE hFileMappingObject,
            #   _In_  ULONG DesiredAccess,
            #   _In_  ULONG64 FileOffset,
            #   _In_  SIZE_T NumberOfBytesToMap )
            def self.MapViewOfFileFromApp(hFileMappingObject, desiredAccess, fileOffset, numberOfBytesToMap) end
            attach_function 'MapViewOfFileFromApp', [:handle, FileMap, :ulong, :size_t], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh780543
            # BOOL PrefetchVirtualMemory(
            #   _In_  HANDLE hProcess,
            #   _In_  ULONG_PTR NumberOfEntries,
            #   _In_  PWIN32_MEMORY_RANGE_ENTRY VirtualAddresses,
            #   _In_  ULONG Flags )
            def self.PrefetchVirtualMemory(hProcess, numberOfEntries, virtualAddresses, flags) end
            attach_function 'PrefetchVirtualMemory', [:handle, :ulong_ptr, WIN32_MEMORY_RANGE_ENTRY.ptr, :ulong], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691013
            # PVOID RegisterBadMemoryNotification( _In_  PBAD_MEMORY_CALLBACK_ROUTINE Callback )
            def self.RegisterBadMemoryNotification(callback) end
            attach_function 'RegisterBadMemoryNotification', [BadMemoryCallbackRoutine], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/mt670639
            # BOOL UnmapViewOfFileEx( _In_ LPCVOID lpBaseAddress, _In_ DWORD   UnmapFlags)
            def self.UnmapViewOfFileEx(lpBaseAddress, unmapFlags) end
            attach_function 'UnmapViewOfFileEx', [:pointer, MemoryAccess], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh691014
            # BOOL UnregisterBadMemoryNotification( _In_  PVOID RegistrationHandle )
            def self.UnregisterBadMemoryNotification(registrationHandle) end
            attach_function 'UnregisterBadMemoryNotification', [:pointer], :bool

            if WINDOWS_VERSION >= 8.1
              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781432
              # DWORD DiscardVirtualMemory( _In_ PVOID  VirtualAddress, _In_ SIZE_T Size)
              def self.DiscardVirtualMemory(virtualAddress, size) end
              attach_function 'DiscardVirtualMemory', [:pointer, :size_t], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781436
              # DWORD OfferVirtualMemory(
              #   _In_ PVOID          VirtualAddress,
              #   _In_ SIZE_T         Size,
              #   _In_ OFFER_PRIORITY Priority)
              def self.OfferVirtualMemory(virtualAddress, size, priority) end
              attach_function 'OfferVirtualMemory', [:pointer, :size_t, OfferPriority], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn781437
              # DWORD ReclaimVirtualMemory( _In_ PVOID  VirtualAddress, _In_ SIZE_T Size)
              def self.ReclaimVirtualMemory(virtualAddress, size) end
              attach_function 'ReclaimVirtualMemory', [:pointer, :size_t], :dword

              if WINDOWS_VERSION >= 10
                # https://docs.microsoft.com/en-us/windows/desktop/api/enclaveapi/nf-enclaveapi-createenclave
                # PVOID CreateEnclave(
                #   _In_      HANDLE  hProcess,
                #   _In_opt_  LPVOID  lpAddress,
                #   _In_      SIZE_T  dwSize,
                #   _In_      SIZE_T  dwInitialCommittment,
                #   _In_      DWORD   flEnclaveType,
                #   _In_      LPCVOID lpEnclaveInformation,
                #   _In_      DWORD   dwInfoLength,
                #   _Out_opt_ LPDWORD lpEnclaveError)
                def self.CreateEnclave(hProcess, lpAddress, dwSize, dwInitialCommittment, flEnclaveType,
                    lpEnclaveInformation, dwInfoLength, lpEnclaveError) end
                attach_function 'CreateEnclave', [:handle, :pointer, :size_t, :size_t, :dword, :pointer, :dword, :pointer],
                                :pointer

                # https://docs.microsoft.com/en-us/windows/desktop/api/enclaveapi/nf-enclaveapi-initializeenclave
                # BOOL InitializeEnclave(
                #   _In_ HANDLE  hProcess,
                #   _In_ LPVOID  lpAddress,
                #   _In_ LPVOID  lpEnclaveInformation,
                #   _In_ DWORD   dwInfoLength,
                #   _In_ LPDWORD lpEnclaveError)
                def self.InitializeEnclave(hProcess, lpAddress, lpEnclaveInformation, dwInfoLength, lpEnclaveError) end
                attach_function 'InitializeEnclave', [:handle, :pointer, :pointer, :dword, :pointer], :bool

                # https://docs.microsoft.com/en-us/windows/desktop/api/enclaveapi/nf-enclaveapi-isenclavetypesupported
                # BOOL IsEnclaveTypeSupported(_In_ DWORD flEnclaveType)
                def self.IsEnclaveTypeSupported(flEnclaveType) end
                attach_function 'IsEnclaveTypeSupported', [:dword], :bool

                # https://docs.microsoft.com/en-us/windows/desktop/api/enclaveapi/nf-enclaveapi-loadenclavedata
                # BOOL LoadEnclaveData(
                #   _In_      HANDLE  hProcess,
                #   _In_      LPVOID  lpAddress,
                #   _In_      LPCVOID lpBuffer,
                #   _In_      SIZE_T  nSize,
                #   _In_      DWORD   flProtect,
                #   _In_      LPCVOID lpPageInformation,
                #   _In_      DWORD   dwInfoLength,
                #   _Out_     PSIZE_T lpNumberOfBytesWritten,
                #   _Out_opt_ LPDWORD lpEnclaveError)
                def self.LoadEnclaveData(hProcess, lpAddress, lpBuffer, nSize, flProtect, lpPageInformation,
                    dwInfoLength, lpNumberOfBytesWritten, lpEnclaveError) end
                attach_function 'LoadEnclaveData',
                                [:handle, :pointer, :pointer, :size_t, :dword, :pointer, :pointer, :dword, :pointer,
                                 :pointer], :bool

                # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-openfilemappingfromapp
                # HANDLE OpenFileMappingFromApp( _In_ ULONG  DesiredAccess, _In_ BOOL   InheritHandle, _In_ PCWSTR Name)
                def self.OpenFileMappingFromApp(desiredAccess, inheritHandle, name) end
                attach_function 'OpenFileMappingFromApp', [FileMap, :bool, :string], :handle

                #define FILE_MAP_TARGETS_INVALID       0x40000000
                FILE_MAP_TARGETS_INVALID = 0x40000000

                # https://msdn.microsoft.com/en-us/library/windows/desktop/dn934202
                # SetProcessValidCallTargets(
                #   _In_    HANDLE                hProcess,
                #   _In_    PVOID                 VirtualAddress,
                #   _In_    SIZE_T                RegionSize,
                #   _In_    ULONG                 NumberOfOffsets,
                #   _Inout_ PCFG_CALL_TARGET_INFO OffsetInformation)
                def self.SetProcessValidCallTargets(hProcess, virtualAddress, regionSize, numberOfOffsets,
                    offsetInformation) end
                attach_function 'SetProcessValidCallTargets', [:handle, :pointer, :size_t, :ulong, :pointer], :bool

                # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocfromapp
                # PVOID VirtualAllocFromApp(
                #   _In_opt_ PVOID  BaseAddress,
                #   _In_     SIZE_T Size,
                #   _In_     ULONG  AllocationType,
                #   _In_     ULONG  Protection)
                def self.VirtualAllocFromApp(baseAddress, size, allocationType, protection) end
                attach_function 'VirtualAllocFromApp',
                                [:pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

                # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-virtualprotectfromapp
                # BOOL VirtualProtectFromApp(
                #   _In_  PVOID  Address,
                #   _In_  SIZE_T Size,
                #   _In_  ULONG  NewProtection,
                #   _Out_ PULONG OldProtection)
                def self.VirtualProtectFromApp(address, size, newProtection, oldProtection) end
                attach_function 'VirtualProtectFromApp', [:pointer, :size_t, :ulong, :pointer], :bool
              end
            end
          end
        end
      end
    end
  end
end
