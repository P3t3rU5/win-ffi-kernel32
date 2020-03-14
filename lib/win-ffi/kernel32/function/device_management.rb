module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../struct/synchronization/overlapped'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363216(v=vs.85).aspx
      # @param [Integer] hDevice
      # @param [Integer] dwIoControlCode
      # @param [FFI::Pointer] lpInBuffer
      # @param [Integer] nInBufferSize
      # @param [FFI::Pointer] lpOutBuffer
      # @param [Integer] nOutBufferSize
      # @param [FFI::Pointer] lpBytesReturned
      # @param [FFI::Pointer] lpOverlapped
      # @return [true, false]
      def self.DeviceIoControl(hDevice, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize,
          lpBytesReturned, lpOverlapped); end
      attach_function 'DeviceIoControl',
                      [:handle, :dword, :pointer, :dword, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool
    end
  end
end
