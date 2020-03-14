module WinFFI
  module Kernel32
    # Flags to be passed into CREATE_SYMBOLIC_LINK
    SymbolicLinkFlag = enum :symbolic_link_flag, [:DIRECTORY, (0x1)]

    define_prefix(:SYMBOLIC_LINK_FLAG, SymbolicLinkFlag)
  end
end