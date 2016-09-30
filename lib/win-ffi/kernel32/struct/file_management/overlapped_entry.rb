require 'win-ffi/kernel32/struct/synchronization/overlapped'

module WinFFI
  module Kernel32
    class OVERLAPPED_ENTRY < FFIAdditions::Struct
      layout lpCompletionKey:            :ulong,
             lpOverlapped:           OVERLAPPED,
             Internal:                   :ulong,
             dwNumberOfBytesTransferred: :dword
    end
  end
end