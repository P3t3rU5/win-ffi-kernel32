require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683149(v=vs.85).aspx
    class FOCUS_EVENT_RECORD < FFIAdditions::Struct
      layout bSetFocus: :bool
    end
  end
end