require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # File creation flags must start at the high end since they are combined with the attributes
    # These are flags supported through CreateFile (W7) and CreateFile2 (W8 and beyond)
    FileFlag = enum :file_flag, [
        :WRITE_THROUGH,       0x80000000,
        :OVERLAPPED,          0x40000000,
        :NO_BUFFERING,        0x20000000,
        :RANDOM_ACCESS,       0x10000000,
        :SEQUENTIAL_SCAN,     0x08000000,
        :DELETE_ON_CLOSE,     0x04000000,
        :BACKUP_SEMANTICS,    0x02000000,
        :POSIX_SEMANTICS,     0x01000000,
        :SESSION_AWARE,       0x00800000,
        :OPEN_REPARSE_POINT,  0x00200000,
        :OPEN_NO_RECALL,      0x00100000,
        :FIRST_PIPE_INSTANCE, 0x00080000,
    ]

    define_prefix(:FILE_FLAG, FileFlag)
  end
end