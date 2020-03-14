require_relative 'key_event_record'
require_relative 'mouse_event_record'
require_relative 'window_buffer_size_record'
require_relative 'menu_event_record'
require_relative 'focus_event_record'

module WinFFI
  module Kernel32
    class INPUT_RECORD_UNION < FFIAdditions::Union
      attr_accessor :KeyEvent,
                    :MouseEvent,
                    :WindowBufferSizeEvent,
                    :MenuEvent,
                    :FocusEvent

      layout KeyEvent:              KEY_EVENT_RECORD,
             MouseEvent:            MOUSE_EVENT_RECORD,
             WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD,
             MenuEvent:             MENU_EVENT_RECORD,
             FocusEvent:            FOCUS_EVENT_RECORD
    end

    # https://docs.microsoft.com/en-us/windows/console/input-record-str
    class INPUT_RECORD < FFIAdditions::Struct
      attr_accessor :EventType, :Event

      layout EventType: :word,
             Event:     INPUT_RECORD_UNION
    end
  end
end