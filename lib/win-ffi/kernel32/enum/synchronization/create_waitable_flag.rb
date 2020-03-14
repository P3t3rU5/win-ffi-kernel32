module WinFFI
  module Kernel32
    CreateWaitableFlag = enum :create_waitable_flag, [:TIMER_MANUAL_RESET, 0x00000001]

    define_prefix(:CREATE_WAITABLE, CreateWaitableFlag)
  end
end