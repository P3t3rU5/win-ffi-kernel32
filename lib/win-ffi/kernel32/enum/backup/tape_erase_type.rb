module WinFFI
  module Kernel32
    # IOCTL_TAPE_ERASE definitions
    TapeEraseType = enum :tape_erase_type, [
        :SHORT, 0,
        :LONG,  1,
    ]

    define_prefix(:TAPE_ERASE, TapeEraseType)
  end
end