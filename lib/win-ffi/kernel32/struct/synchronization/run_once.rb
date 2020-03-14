module WinFFI
  module Kernel32
    class RUN_ONCE < FFIAdditions::Struct
      attr_accessor :Ptr

      layout Ptr: :pointer
    end
  end
end