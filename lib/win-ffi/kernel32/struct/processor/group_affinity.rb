module WinFFI
  module Kernel32
    # Structure to represent a group-specific affinity, such as that of a
    # thread.  Specifies the group number and the affinity within that group.
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-group_affinity
    class GROUP_AFFINITY < FFIAdditions::Struct
      attr_accessor :Mask, :Group, :Reserved

      layout Mask:     :long,  # KAFFINITY
             Group:    :word,
             Reserved: [:word, 3]
    end
  end
end