module WinFFI
  module Kernel32
    NamedPipeWait = enum :named_pipe_wait, [
        :WAIT_FOREVER,     0xffffffff,
        :NOWAIT,           0x00000001,
        :USE_DEFAULT_WAIT, 0x00000000,
    ]

    define_prefix(:NMPWAIT, NamedPipeWait)
  end
end