require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405500(v=vs.85).aspx
    # Structure to represent a group-specific affinity, such as that of a
    # thread.  Specifies the group number and the affinity within that group.
    class GROUP_AFFINITY < FFIAdditions::Struct
      layout Mask:          :long,  # KAFFINITY
             Group:         :word,
             Reserved: [:word, 3]
    end
  end
end