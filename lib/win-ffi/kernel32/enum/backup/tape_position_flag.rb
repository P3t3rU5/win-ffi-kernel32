require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # IOCTL_TAPE_GET_POSITION definitions
    TapePositionFlag = enum :tape_position_flag, [
        :TAPE_ABSOLUTE,       0,
        :TAPE_LOGICAL,        1,
        :TAPE_PSEUDO_LOGICAL, 2,
    ]

    define_suffix(:POSITION, TapePositionFlag)
  end
end