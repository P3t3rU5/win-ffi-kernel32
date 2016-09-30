require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class SRWLOCK < FFIAdditions::Struct
      layout Ptr: :pointer
    end
  end
end