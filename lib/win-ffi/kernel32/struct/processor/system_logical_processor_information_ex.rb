require 'win-ffi/kernel32/enum/processor/logical_processor_relationship'

require 'win-ffi/kernel32/struct/processor/processor_relationship'
require 'win-ffi/kernel32/struct/processor/numa_node_relatioship'
require 'win-ffi/kernel32/struct/processor/cache_relationship'
require 'win-ffi/kernel32/struct/processor/group_relationship'

module WinFFI
  module Kernel32
    class SLPIE_UNION < FFI::Union
      layout :Processor, PROCESSOR_RELATIONSHIP,
             :NumaNode,  NUMA_NODE_RELATIONSHIP,
             :Cache,     CACHE_RELATIONSHIP,
             :Group,     GROUP_RELATIONSHIP
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405522(v=vs.85).aspx
    class SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX < FFIStruct
      layout :Relationship, LogicalProcessorRelationship,
             :Size,         :dword,
             :u,            SLPIE_UNION

      def initialize
        super
        self.Size = self.size
      end
    end
  end
end