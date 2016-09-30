require 'win-ffi/kernel32/enum/console/console_selection_info_flag'

require 'win-ffi/kernel32/struct/console/coord'
require 'win-ffi/kernel32/struct/console/small_rect'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682098(v=vs.85).aspx
      class CONSOLE_SELECTION_INFO < FFIAdditions::Struct
        layout dwFlags: ConsoleSelectionInfoFlag,
               dwSelectionAnchor:          COORD,
               srSelection:           SMALL_RECT
      end
    end
  end
end