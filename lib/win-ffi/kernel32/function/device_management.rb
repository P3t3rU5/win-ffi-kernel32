require 'win-ffi/kernel32/struct/synchronization/overlapped'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # BOOL WINAPI DeviceIoControl(
      #   _In_        HANDLE       hDevice,
      #   _In_        DWORD        dwIoControlCode,
      #   _In_opt_    LPVOID       lpInBuffer,
      #   _In_        DWORD        nInBufferSize,
      #   _Out_opt_   LPVOID       lpOutBuffer,
      #   _In_        DWORD        nOutBufferSize,
      #   _Out_opt_   LPDWORD      lpBytesReturned,
      #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
      attach_function 'DeviceIoControl',
                      [:handle, :dword, :pointer, :dword, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool


    end
  end
end
