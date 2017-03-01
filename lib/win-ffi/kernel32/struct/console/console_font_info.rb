require 'win-ffi/kernel32/struct/console/coord'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682071(v=vs.85).aspx
      class CONSOLE_FONT_INFO < FFIAdditions::Struct
        layout nFont:     :dword,
               dwFontSize: COORD
      end
    end
  end
end