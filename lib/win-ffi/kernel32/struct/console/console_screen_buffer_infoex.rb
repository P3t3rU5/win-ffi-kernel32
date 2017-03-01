require 'win-ffi/kernel32/struct/console/coord'
require 'win-ffi/kernel32/struct/console/small_rect'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682091(v=vs.85).aspx
      class CONSOLE_SCREEN_BUFFER_INFOEX < FFIAdditions::Struct
        layout cbSize:              :ulong,
               dwSize:               COORD,
               dwCursorPosition:     COORD,
               wAttributes:          :word,
               srWindow:        SMALL_RECT,
               dwMaximumWindowSize:  COORD,
               wPopupAttributes:     :word,
               bFullscreenSupported: :bool,
               ColorTable:  [:colorref, 16]
      end
    end
  end
end