module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative 'coord'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-font-info-str
      class CONSOLE_FONT_INFO < FFIAdditions::Struct
        attr_accessor :nFont, :dwFontSize

        layout nFont:      :dword,
               dwFontSize: COORD
      end
    end
  end
end