require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class RUN_ONCE < FFIAdditions::Struct
      layout Ptr: :pointer
    end
  end
end