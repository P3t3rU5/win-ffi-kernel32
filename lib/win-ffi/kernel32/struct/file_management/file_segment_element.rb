require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class FILE_SEGMENT_ELEMENT < FFIAdditions::Struct
      layout Buffer:       :pointer,
             Alignment: :ulong_long
    end
  end
end