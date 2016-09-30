require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    OpenFileFlag = enum :open_file_flag, [
        :READ,             0x00000000,
        :WRITE,            0x00000001,
        :READWRITE,        0x00000002,
        :SHARE_COMPAT,     0x00000000,
        :SHARE_EXCLUSIVE,  0x00000010,
        :SHARE_DENY_WRITE, 0x00000020,
        :SHARE_DENY_READ,  0x00000030,
        :SHARE_DENY_NONE,  0x00000040,
        :PARSE,            0x00000100,
        :DELETE,           0x00000200,
        :VERIFY,           0x00000400,
        :CANCEL,           0x00000800,
        :CREATE,           0x00001000,
        :PROMPT,           0x00002000,
        :EXIST,            0x00004000,
        :REOPEN,           0x00008000,
    ]

    define_prefix(:OF, OpenFileFlag)
  end
end