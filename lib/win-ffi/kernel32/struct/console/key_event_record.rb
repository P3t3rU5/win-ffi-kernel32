module WinFFI
  module Kernel32
    class KEY_EVENT_RECORD_UNION < FFIAdditions::Union
      attr_accessor :UnicodeChar, :AsciiChar

      layout UnicodeChar: :wchar,
             AsciiChar:   :char
    end

    # https://docs.microsoft.com/en-us/windows/console/key-event-record-str
    class KEY_EVENT_RECORD < FFIAdditions::Struct
      attr_accessor :bKeyDown,
                    :wRepeatCount,
                    :wVirtualKeyCode,
                    :wVirtualScanCode,
                    :uChar,
                    :dwControlKeyState

      layout bKeyDown:          :bool,
             wRepeatCount:      :word,
             wVirtualKeyCode:   :word,
             wVirtualScanCode:  :word,
             uChar:             KEY_EVENT_RECORD_UNION,
             dwControlKeyState: :dword
    end
  end
end