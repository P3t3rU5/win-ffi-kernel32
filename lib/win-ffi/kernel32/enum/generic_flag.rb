module WinFFI
  module Kernel32
    GenericFlag = enum :generic_flag, [
        :READ,    (0x80000000),
        :WRITE,   (0x40000000),
        :EXECUTE, (0x20000000),
        :ALL,     (0x10000000),
    ]

    define_prefix(:GENERIC, GenericFlag)
  end
end