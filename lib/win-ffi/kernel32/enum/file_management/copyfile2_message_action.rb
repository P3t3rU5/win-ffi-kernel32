require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    COPYFILE2_MESSAGE_ACTION = enum :copyfile2_message_action, [
       :CONTINUE, 0,
       :CANCEL,
       :STOP,
       :QUIET,
       :PAUSE,
    ]

    define_prefix(:COPYFILE2_PROGRESS, COPYFILE2_MESSAGE_ACTION)
  end
end