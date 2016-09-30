require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Define the dwPipeMode values for CreateNamedPipe
    PipeMode = enum :pipe_mode, [
        :WAIT,                  0x00000000,
        :NOWAIT,                0x00000001,
        :READMODE_BYTE,         0x00000000,
        :READMODE_MESSAGE,      0x00000002,
        :TYPE_BYTE,             0x00000000,
        :TYPE_MESSAGE,          0x00000004,
        :ACCEPT_REMOTE_CLIENTS, 0x00000000,
        :REJECT_REMOTE_CLIENTS, 0x00000008,
    ]

    define_prefix(:PIPE, PipeMode)
  end
end