require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class CONDITION_VARIABLE < FFIAdditions::Struct
      layout Ptr: :pointer
    end
  end
end