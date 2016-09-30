require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684213(v=vs.85).aspx
    class MENU_EVENT_RECORD < FFIAdditions::Struct
      layout dwCommandId: :uint
    end
  end
end