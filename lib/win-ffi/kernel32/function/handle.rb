module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724211
    # @param [Integer] hObject
    # @return [true, false]
    def self.CloseHandle(hObject) end
    attach_function 'CloseHandle', [:handle], :bool

    # https://msdn.microsoft.com/en-gb/library/windows/desktop/ms724251
    # @param [Integer] hSourceProcessHandle
    # @param [Integer] hSourceHandle
    # @param [Integer] hTargetProcessHandle
    # @param [FFI::Pointer] lpTargetHandle
    # @param [Integer] dwDesiredAccess
    # @param [true, false] bInheritHandle
    # @param [Integer] dwOptions
    # @return [true, false]
    def self.DuplicateHandle(hSourceProcessHandle, hSourceHandle, hTargetProcessHandle, lpTargetHandle, dwDesiredAccess, bInheritHandle, dwOptions) end
    attach_function 'DuplicateHandle', [:handle, :handle, :handle, :pointer, :dword, :bool, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724329
    # @param [Integer] hObject
    # @param [FFI::Pointer] lpdwFlags
    # @return [true, false]
    def self.GetHandleInformation(hObject, lpdwFlags) end
    attach_function 'GetHandleInformation', [:handle, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724935
    # @param [Integer] hObject
    # @param [Integer] dwMask
    # @param [Integer] dwFlags
    # @return [true, false]
    def self.SetHandleInformation(hObject, dwMask, dwFlags) end
    attach_function 'SetHandleInformation', [:handle, :dword, :dword], :bool
  end
end