require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682068(v=vs.85).aspx
    class CONSOLE_CURSOR_INFO < FFIAdditions::Struct
      layout dwSize:  :dword,
             bVisible: :bool
    end
  end
end