require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # RtlVerifyVersionInfo() conditions
    VersionConditionMask = enum :version_condition_mask, [
        :EQUAL,                       1,
        :GREATER,                     2,
        :GREATER_EQUAL,               3,
        :LESS,                        4,
        :LESS_EQUAL,                  5,
        :AND,                         6,
        :OR,                          7,

        :CONDITION_MASK,              7,
        :NUM_BITS_PER_CONDITION_MASK, 3,
    ]

    define_prefix(:VER, VersionConditionMask)
  end
end