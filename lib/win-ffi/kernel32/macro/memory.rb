require 'win-ffi/kernel32'

module WinFFI
  module Kernel32


    #define RtlMoveMemory(Destination,Source,Length) memmove((Destination),(Source),(Length))
    #define RtlFillMemory(Destination,Length,Fill) memset((Destination),(Fill),(Length))
    #define RtlZeroMemory(Destination,Length) memset((Destination),0,(Length))

    #define MoveMemory RtlMoveMemory
    #define CopyMemory RtlCopyMemory
    #define FillMemory RtlFillMemory
    #define ZeroMemory RtlZeroMemory
    #define SecureZeroMemory RtlSecureZeroMemory
    #define CaptureStackBackTrace RtlCaptureStackBackTrace

    def self.FillMemory()

    end

    #define GlobalDiscard( h )      GlobalReAlloc( (h), 0, GMEM_MOVEABLE )
    def self.GlobalDiscard(h)
      GlobalReAlloc(h, 0, :MOVEABLE)
    end

    #define LocalDiscard( h )   LocalReAlloc( (h), 0, LMEM_MOVEABLE )
    def self.LocalDiscard(h)
      LocalReAlloc(h, 0, :MOVEABLE )
    end

    if WINDOWS_VERSION >= 10
      # FORCEINLINE
      # _Ret_maybenull_ _Post_writable_byte_size_(dwSize)
      # LPVOID
      # WINAPI
      # VirtualAlloc(
      #   _In_opt_ LPVOID lpAddress,
      #   _In_     SIZE_T dwSize,
      #   _In_     DWORD flAllocationType,
      #   _In_     DWORD flProtect
      # )
      # {
      #     return VirtualAllocFromApp (lpAddress, dwSize, flAllocationType, flProtect);
      # }

      # def self.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect)
      #   VirtualAllocFromApp (lpAddress, dwSize, flAllocationType, flProtect);
      # end

      # FORCEINLINE
      # _Success_(return != FALSE)
      # BOOL
      # WINAPI
      # VirtualProtect(
      #   _In_  LPVOID lpAddress,
      #   _In_  SIZE_T dwSize,
      #   _In_  DWORD flNewProtect,
      #   _Out_ PDWORD lpflOldProtect
      # )
      # {
      #     return VirtualProtectFromApp (lpAddress, dwSize, flNewProtect, lpflOldProtect);
      # }
      # def self.VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect)
      #   VirtualProtectFromApp(lpAddress, dwSize, flNewProtect, lpflOldProtect)
      # end

      # FORCEINLINE
      # _Ret_maybenull_
      # HANDLE
      # WINAPI
      # OpenFileMappingW(
      #   _In_ DWORD dwDesiredAccess,
      #   _In_ BOOL bInheritHandle,
      #   _In_ LPCWSTR lpName
      # )
      # {
      #     return OpenFileMappingFromApp (dwDesiredAccess, bInheritHandle, lpName);
      # }
      # def self.OpenFileMappingW(dwDesiredAccess, bInheritHandle, lpName)
      #   OpenFileMappingFromApp(dwDesiredAccess, bInheritHandle, lpName)
      # end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366877(v=vs.85).aspx
#       FORCEINLINE
#       PVOID
#       RtlSecureZeroMemory(
#           _Out_writes_bytes_all_(cnt) PVOID ptr,
#                                             _In_ SIZE_T cnt
#       )
#       {
#           volatile char *vptr = (volatile char *)ptr;
#
# #if defined(_M_AMD64)
#
#       __stosb((PBYTE )((DWORD64)vptr), 0, cnt);
#
# #else
#
#       while (cnt) {
#
# #if !defined(_M_CEE) && (defined(_M_ARM) || defined(_M_ARM64))
#
# __iso_volatile_store8(vptr, 0);
#
# #else
#
#       *vptr = 0;
#
# #endif
#
#       vptr++;
#       cnt--;
#       }
#
# #endif // _M_AMD64
#
#       return ptr;
#       }

      # FORCEINLINE
      # _Ret_maybenull_
      # HANDLE
      # WINAPI
      # CreateFileMappingW(
      #     _In_     HANDLE hFile,
      #                     _In_opt_ LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
      #                                                    _In_     DWORD flProtect,
      #                                                                   _In_     DWORD dwMaximumSizeHigh,
      #                                                                                  _In_     DWORD dwMaximumSizeLow,
      #                                                                                                 _In_opt_ LPCWSTR lpName
      # )
      # {
      #     return CreateFileMappingFromApp (hFile,
      #                                      lpFileMappingAttributes,
      #                                      flProtect,
      #                                      (((ULONG64) dwMaximumSizeHigh) << 32) | dwMaximumSizeLow,
      #                                      lpName);
      # }
      #
      # FORCEINLINE
      # _Ret_maybenull_  __out_data_source(FILE)
      # LPVOID
      # WINAPI
      # MapViewOfFile(
      #     _In_ HANDLE hFileMappingObject,
      #                 _In_ DWORD dwDesiredAccess,
      #                            _In_ DWORD dwFileOffsetHigh,
      #                                       _In_ DWORD dwFileOffsetLow,
      #                                                  _In_ SIZE_T dwNumberOfBytesToMap
      # )
      # {
      #     return MapViewOfFileFromApp (hFileMappingObject,
      #                                  dwDesiredAccess,
      #                                  (((ULONG64) dwFileOffsetHigh) << 32) | dwFileOffsetLow,
      #                                  dwNumberOfBytesToMap);
      # }

    end
  end
end