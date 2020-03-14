module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/aa382990
    # BOOL ProcessIdToSessionId(_In_  DWORD dwProcessId, _Out_ DWORD *pSessionId)
    def self.ProcessIdToSessionId(dwProcessId, pSessionId); end
    attach_function 'ProcessIdToSessionId', [:dword, :pointer], :bool
  end
end