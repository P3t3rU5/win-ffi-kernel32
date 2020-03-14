require_relative 'processor_group_info'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-group_relationship
    class GROUP_RELATIONSHIP < FFIAdditions::Struct
      attr_accessor :MaximumGroupCount, :ActiveGroupCount, :Reserved, :GroupInfo

      layout MaximumGroupCount: :word,
             ActiveGroupCount:  :word,
             Reserved:          [:byte, 20],
             GroupInfo:         [PROCESSOR_GROUP_INFO, 1]
    end
  end
end