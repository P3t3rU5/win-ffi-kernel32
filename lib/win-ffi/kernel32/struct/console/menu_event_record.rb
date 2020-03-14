module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/menu-event-record-str
    class MENU_EVENT_RECORD < FFIAdditions::Struct
      attr_accessor :dwCommandId

      layout dwCommandId: :uint
    end
  end
end