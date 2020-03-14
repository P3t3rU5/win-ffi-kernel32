require_relative 'group_affinity'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-processor_relationship
    class PROCESSOR_RELATIONSHIP < FFIAdditions::Struct
      attr_accessor :Flags,
                    :EfficiencyClass,
                    :Reserved,
                    :GroupCount,
                    :GroupMask

      layout Flags:           :byte,
             EfficiencyClass: :byte,
             Reserved:        [:byte, 20],
             GroupCount:      :word,
             GroupMask:       [GROUP_AFFINITY, 1]
    end
  end
end