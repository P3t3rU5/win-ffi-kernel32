require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    SetTapeParameter = enum :set_tape_parameter, [
        :MEDIA_INFORMATION, 0,
        :DRIVE_INFORMATION, 1,
    ]

    define_prefix(:SET_TAPE, SetTapeParameter)
  end
end