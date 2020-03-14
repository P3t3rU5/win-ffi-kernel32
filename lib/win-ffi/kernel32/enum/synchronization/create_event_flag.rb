module WinFFI
  module Kernel32
    CreateEventFlag = enum :create_event_flag, [:MANUAL_RESET, 0x00000001, :INITIAL_SET, 0x00000002]

    define_prefix(:CREATE_EVENT, CreateEventFlag)
  end
end