require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682119(v=vs.85).aspx
    class COORD < FFIAdditions::Struct
      layout X: :short,
             Y: :short
    end
  end
end