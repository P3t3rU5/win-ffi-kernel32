module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/focus-event-record-str
    class FOCUS_EVENT_RECORD < FFIAdditions::Struct
      attr_accessor :bSetFocus

      layout bSetFocus: :bool
    end
  end
end