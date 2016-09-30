require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    FIND_FIRST_EX_FLAG = enum :find_first_ex_flag, [
        :CASE_SENSITIVE, 0x00000001,
        :LARGE_FETCH,    0x00000002,
    ]

    define_prefix(:FIND_FIRST_EX, FIND_FIRST_EX_FLAG)
  end
end