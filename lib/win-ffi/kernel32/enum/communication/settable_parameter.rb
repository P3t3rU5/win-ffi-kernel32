module WinFFI
  module Kernel32
    # Comm provider settable parameters.
    SettableParameter = enum :settable_parameter, [
        :PARITY,       0x0001,
        :BAUD,         0x0002,
        :DATABITS,     0x0004,
        :STOPBITS,     0x0008,
        :HANDSHAKING,  0x0010,
        :PARITY_CHECK, 0x0020,
        :RLSD,         0x0040,
    ]

    define_prefix(:SP, SettableParameter)
  end
end