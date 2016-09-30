require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class SMALL_RECT < FFIAdditions::Struct
      layout Left:   :short,
             Top:    :short,
             Right:  :short,
             Bottom: :short
    end
  end
end