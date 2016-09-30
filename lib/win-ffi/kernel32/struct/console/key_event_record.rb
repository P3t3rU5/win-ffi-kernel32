require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class KEY_EVENT_RECORD_UNION < FFIAdditions::Union
      layout UnicodeChar: :wchar,
             AsciiChar:    :char
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684166(v=vs.85).aspx
    class KEY_EVENT_RECORD < FFIAdditions::Struct
      layout bKeyDown:               :bool,
             wRepeatCount:           :word,
             wVirtualKeyCode:        :word,
             wVirtualScanCode:       :word,
             uChar: KEY_EVENT_RECORD_UNION,
             dwControlKeyState:     :dword
    end
  end
end