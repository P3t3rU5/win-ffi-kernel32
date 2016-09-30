require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405505(v=vs.85).aspx
    # Structure to represent a system wide processor number. It contains a
    # group number and relative processor number within the group.
    class PROCESSOR_NUMBER < FFIAdditions::Struct
      layout Group:    :word,
             Number:   :byte,
             Reserved: :byte
    end
  end
end