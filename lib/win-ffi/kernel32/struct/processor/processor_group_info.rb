module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-processor_group_info
    class PROCESSOR_GROUP_INFO < FFIAdditions::Struct
      attr_accessor :MaximumProcessorCount,
                    :ActiveProcessorCount,
                    :Reserved,
                    :ActiveProcessorMask

      layout MaximumProcessorCount: :byte,
             ActiveProcessorCount:  :byte,
             Reserved:              [:byte, 38],
             ActiveProcessorMask:   :long # KAFFINITY
    end
  end
end