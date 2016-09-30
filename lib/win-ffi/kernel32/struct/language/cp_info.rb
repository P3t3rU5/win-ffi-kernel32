require 'win-ffi/kernel32'

require 'win-ffi/kernel32/constant/language'

module WinFFI
  module Kernel32
    class CPINFO < FFIAdditions::Struct
      layout MaxCharSize:                    :uint,
             DefaultChar: [:byte, MAX_DEFAULTCHAR],
             LeadByte:      [:byte, MAX_LEADBYTES]
    end
  end
end