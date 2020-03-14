module WinFFI
  module Kernel32
    FileShareFlag = enum :file_share_flag, [:READ, 0x00000001, :WRITE, 0x00000002, :DELETE, 0x00000004]

    define_prefix(:FILE_SHARE, FileShareFlag)
  end
end