require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Settable baud rates in the provider.
    BaudRate = enum :baud_rate, [
        :'075',    0x00000001,
        :'110',    0x00000002,
        :'134_5',  0x00000004,
        :'150',    0x00000008,
        :'300',    0x00000010,
        :'600',    0x00000020,
        :'1200',   0x00000040,
        :'1800',   0x00000080,
        :'2400',   0x00000100,
        :'4800',   0x00000200,
        :'7200',   0x00000400,
        :'9600',   0x00000800,
        :'14400',  0x00001000,
        :'19200',  0x00002000,
        :'38400',  0x00004000,
        :'56K',    0x00008000,
        :'128K',   0x00010000,
        :'115200', 0x00020000,
        :'57600',  0x00040000,
        :USER,     0x10000000,
    ]

    define_prefix(:BAUD, BaudRate)
  end
end