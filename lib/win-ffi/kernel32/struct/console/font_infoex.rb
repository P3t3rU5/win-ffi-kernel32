module WinFFI
  if WINDOWS_VERSION >= :vista
    require 'win-ffi/gdi32/constant_base'

    require_relative '../console/coord'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-font-infoex
      class CONSOLE_FONT_INFOEX < FFIAdditions::Struct
        attr_accessor :cbSize,
                      :nFont,
                      :dwFontSize,
                      :FontFamily,
                      :FontWeight,
                      :FaceName

        layout cbSize:     :ulong,
               nFont:      :dword,
               dwFontSize: COORD,
               FontFamily: :uint,
               FontWeight: :uint,
               FaceName:   [:wchar, Gdi32::LF_FACESIZE]
      end
    end
  end
end