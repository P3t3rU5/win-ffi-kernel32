require 'win-ffi/gdi32'
require 'win-ffi/kernel32/struct/console/coord'

module WinFFI
  if WindowsVersion >= :vista
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682069(v=vs.85).aspx
      class CONSOLE_FONT_INFOEX < FFIAdditions::Struct
        layout cbSize:                        :ulong,
               nFont:                         :dword,
               dwFontSize:                     COORD,
               FontFamily:                     :uint,
               FontWeight:                     :uint,
               FaceName: [:wchar, Gdi32::LF_FACESIZE]
      end
    end
  end
end