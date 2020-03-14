module WinFFI
  module Kernel32
    # IOCTL_TAPE_WRITE_MARKS definitions
    TapemarkType = enum :tapemark_type, [
        :SETMARKS,        0,
        :FILEMARKS,       1,
        :SHORT_FILEMARKS, 2,
        :LONG_FILEMARKS,  3,
    ]

    define_prefix(:TAPE, TapemarkType)
  end
end