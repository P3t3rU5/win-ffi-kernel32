module WinFFI
  module Kernel32
    # Settable Data Bits
    DataBit = enum :data_bit, [
        :'5',   0x0001,
        :'6',   0x0002,
        :'7',   0x0004,
        :'8',   0x0008,
        :'16',  0x0010,
        :'16X', 0x0020,
    ]

    define_prefix(:DATABITS, DataBit)
  end
end