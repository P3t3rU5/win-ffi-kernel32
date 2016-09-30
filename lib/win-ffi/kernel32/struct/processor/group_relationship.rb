require 'win-ffi/kernel32/struct/processor/processor_group_info'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405501(v=vs.85).aspx
    class GROUP_RELATIONSHIP < FFIAdditions::Struct
      layout MaximumGroupCount:             :word,
             ActiveGroupCount:              :word,
             Reserved:                [:byte, 20],
             GroupInfo: [PROCESSOR_GROUP_INFO, 1]
    end
  end
end