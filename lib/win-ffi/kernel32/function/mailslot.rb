require 'win-ffi/core/struct/security_attributes'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createmailslota
    # @param [String] lpName
    # @param [Integer] nMaxMessageSize
    # @param [Integer] lReadTimeout
    # @param [FFI::Pointer] lpSecurityAttributes
    # @return [Integer]
    def self.CreateMailslot(lpName, nMaxMessageSize, lReadTimeout, lpSecurityAttributes) end
    encoded_function 'CreateMailslot', [:string, :dword, :dword, SECURITY_ATTRIBUTES.ptr(:in)], :handle

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getmailslotinfo
    # @param [Integer] hMailslot
    # @param [FFI::Pointer] lpMaxMessageSize
    # @param [FFI::Pointer] lpNextSize
    # @param [FFI::Pointer] lpMessageCount
    # @param [FFI::Pointer] lpReadTimeout
    # @return [true, false]
    def self.GetMailslotInfo(hMailslot, lpMaxMessageSize, lpNextSize, lpMessageCount, lpReadTimeout) end
    attach_function 'GetMailslotInfo', [:handle, :pointer, :pointer, :pointer, :pointer], :bool
  end
end