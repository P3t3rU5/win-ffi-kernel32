require_relative '../../struct/synchronization/overlapped'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-overlapped_entry
    class OVERLAPPED_ENTRY < FFIAdditions::Struct
      attr_accessor :lpCompletionKey,
                    :lpOverlapped,
                    :Internal,
                    :dwNumberOfBytesTransferred

      layout lpCompletionKey:            :ulong,
             lpOverlapped:               OVERLAPPED,
             Internal:                   :ulong,
             dwNumberOfBytesTransferred: :dword
    end
  end
end