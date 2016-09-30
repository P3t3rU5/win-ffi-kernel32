require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/console/coord'
require 'win-ffi/kernel32/struct/console/small_rect'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682093(v=vs.85).aspx
    class CONSOLE_SCREEN_BUFFER_INFO < FFIAdditions::Struct
      layout dwSize:              COORD,
             dwCursorPosition:    COORD,
             wAttributes:         :word,
             srWindow:       SMALL_RECT,
             dwMaximumWindowSize: COORD
    end
  end
end