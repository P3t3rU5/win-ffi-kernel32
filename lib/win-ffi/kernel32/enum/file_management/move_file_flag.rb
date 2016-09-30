require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    MoveFileFlag = enum :move_file_flag, [
        :REPLACE_EXISTING,      0x00000001,
        :COPY_ALLOWED,          0x00000002,
        :DELAY_UNTIL_REBOOT,    0x00000004,
        :WRITE_THROUGH,         0x00000008,
        :CREATE_HARDLINK,       0x00000010,
        :FAIL_IF_NOT_TRACKABLE, 0x00000020,
    ]

    define_prefix(:MOVEFILE, MoveFileFlag)
  end
end