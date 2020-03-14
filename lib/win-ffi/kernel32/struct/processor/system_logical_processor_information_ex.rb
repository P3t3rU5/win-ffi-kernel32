require_relative '../../enum/processor/logical_processor_relationship'

require_relative 'processor_relationship'
require_relative 'numa_node_relatioship'
require_relative 'cache_relationship'
require_relative 'group_relationship'

module WinFFI
  module Kernel32
    class SLPIE_UNION < FFIAdditions::Union
      attr_accessor :Processor, :NumaNode, :Cache, :Group

      layout Processor: PROCESSOR_RELATIONSHIP,
             NumaNode:  NUMA_NODE_RELATIONSHIP,
             Cache:     CACHE_RELATIONSHIP,
             Group:     GROUP_RELATIONSHIP
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex
    class SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX < FFIAdditions::Struct
      attr_accessor :Relationship, :Size, :u

      layout Relationship: LogicalProcessorRelationship,
             Size:         :dword,
             u:            SLPIE_UNION

      def initialize
        super
        self.Size = self.size
      end
    end
  end
end