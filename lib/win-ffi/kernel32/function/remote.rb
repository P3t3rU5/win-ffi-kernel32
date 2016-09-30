require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/aa382990(v=vs.85).aspx
    # BOOL ProcessIdToSessionId(_In_  DWORD dwProcessId, _Out_ DWORD *pSessionId)
    attach_function 'ProcessIdToSessionId', [:dword, :pointer], :bool
  end
end