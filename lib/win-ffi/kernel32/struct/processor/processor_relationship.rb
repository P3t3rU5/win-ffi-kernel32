require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/processor/group_affinity'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405506(v=vs.85).aspx
    class PROCESSOR_RELATIONSHIP < FFIAdditions::Struct
      layout Flags:                  :byte,
             EfficiencyClass:        :byte,
             Reserved:         [:byte, 20],
             GroupCount:             :word,
             GroupMask: [GROUP_AFFINITY, 1]
    end
  end
end