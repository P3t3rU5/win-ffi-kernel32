module WinFFI
  module Kernel32
    # Structure to represent a system wide processor number. It contains a
    # group number and relative processor number within the group.
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-processor_number
    class PROCESSOR_NUMBER < FFIAdditions::Struct
      attr_accessor :Group, :Number, :Reserved

      layout Group:    :word,
             Number:   :byte,
             Reserved: :byte
    end
  end
end