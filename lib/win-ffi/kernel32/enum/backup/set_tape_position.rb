module WinFFI
  module Kernel32
    # IOCTL_TAPE_SET_POSITION definitions
    SetTapePosition = enum :set_tape_position, [
        :REWIND,                 0,
        :ABSOLUTE_BLOCK,         1,
        :LOGICAL_BLOCK,          2,
        :PSEUDO_LOGICAL_BLOCK ,  3,
        :SPACE_END_OF_DATA,      4,
        :SPACE_RELATIVE_BLOCKS,  5,
        :SPACE_FILEMARKS,        6,
        :SPACE_SEQUENTIAL_FMKS,  7,
        :SPACE_SETMARKS,         8,
        :SPACE_SEQUENTIAL_SMKS,  9,
    ]

    define_prefix(:TAPE, SetTapePosition)
  end
end