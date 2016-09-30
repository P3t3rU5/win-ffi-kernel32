require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Define the dwOpenMode values for CreateNamedPipe
    PipeAccessFlag = enum :pipe_acces_flag, [
        :INBOUND,  0x00000001,
        :OUTBOUND, 0x00000002,
        :DUPLEX,   0x00000003,
    ]

    define_prefix(:PIPE_ACCESS, PipeAccessFlag)
  end
end