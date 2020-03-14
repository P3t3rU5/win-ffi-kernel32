module WinFFI
  module Kernel32
    PSS_DUPLICATE_FLAGS = enum :pss_duplicate_flags, [:NONE, 0x00, :CLOSE_SOURCE, 0x01]

    define_prefix(:PSS_DUPLICATE, PSS_DUPLICATE_FLAGS)
  end
end