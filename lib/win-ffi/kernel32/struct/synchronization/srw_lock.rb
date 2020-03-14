module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/sync/slim-reader-writer--srw--locks
    class SRWLOCK < FFIAdditions::Struct
      attr_accessor :Ptr

      layout Ptr: :pointer
    end
  end
end