require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Events
    Event = enum :event, [
        :RXCHAR,   0x0001,
        :RXFLAG,   0x0002,
        :TXEMPTY,  0x0004,
        :CTS,      0x0008,
        :DSR,      0x0010,
        :RLSD,     0x0020,
        :BREAK,    0x0040,
        :ERR,      0x0080,
        :RING,     0x0100,
        :PERR,     0x0200,
        :RX80FULL, 0x0400,
        :EVENT1,   0x0800,
        :EVENT2,   0x1000,
    ]

    define_prefix(:EV, Event)
  end
end