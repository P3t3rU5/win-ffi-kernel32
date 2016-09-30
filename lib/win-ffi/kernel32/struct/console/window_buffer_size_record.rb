require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/console/coord'

module WinFFI
  module Kernel32
    class WINDOW_BUFFER_SIZE_RECORD < FFIAdditions::Struct
      layout dwSize: COORD
    end
  end
end