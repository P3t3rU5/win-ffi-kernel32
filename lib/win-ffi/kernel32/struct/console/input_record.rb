require 'win-ffi/kernel32/struct/console/key_event_record'
require 'win-ffi/kernel32/struct/console/mouse_event_record'
require 'win-ffi/kernel32/struct/console/window_buffer_size_record'
require 'win-ffi/kernel32/struct/console/menu_event_record'
require 'win-ffi/kernel32/struct/console/focus_event_record'

module WinFFI
  module Kernel32
    class INPUT_RECORD_UNION < FFIAdditions::Union
      layout KeyEvent:                       KEY_EVENT_RECORD,
             MouseEvent:                   MOUSE_EVENT_RECORD,
             WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD,
             MenuEvent:                     MENU_EVENT_RECORD,
             FocusEvent:                   FOCUS_EVENT_RECORD
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683499(v=vs.85).aspx
    class INPUT_RECORD < FFIAdditions::Struct
      layout EventType:          :word,
             Event: INPUT_RECORD_UNION
    end
  end
end