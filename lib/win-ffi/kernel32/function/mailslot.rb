require 'win-ffi/kernel32'

require 'win-ffi/core/struct/security_attributes'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365147(v=vs.85).aspx
    # HANDLE WINAPI CreateMailslot(
    #   _In_     LPCTSTR               lpName,
    #   _In_     DWORD                 nMaxMessageSize,
    #   _In_     DWORD                 lReadTimeout,
    #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
    encoded_function 'CreateMailslot', [:string, :dword, :dword, SECURITY_ATTRIBUTES.ptr(:in)], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365435(v=vs.85).aspx
    # BOOL WINAPI GetMailslotInfo(
    #   _In_      HANDLE  hMailslot,
    #   _Out_opt_ LPDWORD lpMaxMessageSize,
    #   _Out_opt_ LPDWORD lpNextSize,
    #   _Out_opt_ LPDWORD lpMessageCount,
    #   _Out_opt_ LPDWORD lpReadTimeout)
    attach_function 'GetMailslotInfo', [:handle, :pointer, :pointer, :pointer, :pointer], :bool
  end
end