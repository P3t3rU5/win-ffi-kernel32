module WinFFI
  module Kernel32
    COPYFILE2_COPY_PHASE = enum :copyfile2_copy_phase, [
        :NONE, 0,
        :PREPARE_SOURCE,
        :PREPARE_DEST,
        :READ_SOURCE,
        :WRITE_DESTINATION,
        :SERVER_COPY,
        :NAMEGRAFT_COPY,
        :MAX,
    ]

    define_prefix(:COPYFILE2_PHASE, COPYFILE2_COPY_PHASE)
  end
end