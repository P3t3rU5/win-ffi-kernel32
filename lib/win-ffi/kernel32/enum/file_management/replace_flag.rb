module WinFFI
  module Kernel32
    # Define ReplaceFile option flags
    buffer = [:WRITE_THROUGH, 0x00000001, :IGNORE_MERGE_ERRORS, 0x00000002]

    buffer += [:IGNORE_ACL_ERRORS, 0x00000004] if WINDOWS_VERSION >= :vista

    ReplaceFlag = enum :replace_flag, buffer

    define_prefix(:REPLACEFILE, ReplaceFlag)
  end
end