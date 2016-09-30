require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class PACKAGE_INFO_REFERENCE < FFIAdditions::Struct
      layout reserved: :pointer
    end
  end
end