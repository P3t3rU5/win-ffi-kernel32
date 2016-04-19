require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684197(v=vs.85).aspx
    LogicalProcessorRelationship = enum :logical_processor_relatioship, [
        :RelationProcessorCore,
        :RelationNumaNode,
        :RelationCache,
        :RelationProcessorPackage,
        :RelationGroup,
        :RelationAll, 0xffff
    ]
  end
end