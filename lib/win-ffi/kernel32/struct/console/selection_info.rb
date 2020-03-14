module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/console/selection_info_flag'

    require_relative 'coord'
    require_relative 'small_rect'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-selection-info-str
      class CONSOLE_SELECTION_INFO < FFIAdditions::Struct
        attr_accessor :dwFlags, :dwSelectionAnchor, :srSelection

        layout dwFlags:           ConsoleSelectionInfoFlag,
               dwSelectionAnchor: COORD,
               srSelection:       SMALL_RECT
      end
    end
  end
end