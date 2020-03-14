module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information
    class PROCESS_INFORMATION < FFIAdditions::Struct
      attr_accessor :hProcess, :hThread, :dwProcessId, :dwThreadId

      layout hProcess:    :handle,
             hThread:     :handle,
             dwProcessId: :dword,
             dwThreadId:  :dword
    end
  end
end