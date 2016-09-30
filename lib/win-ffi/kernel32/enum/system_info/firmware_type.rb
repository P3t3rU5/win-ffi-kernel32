require 'win-ffi/kernel32'

module WinFFI
  module Kernel32

    extend LibBase

    FIRMWARE_TYPE = enum :firmware_type, [
        :Unknown, 0,
        :Bios,    1,
        :Uefi,    2,
        :Max,     3
    ]

    define_prefix(:Firmware, FIRMWARE_TYPE)
  end
end