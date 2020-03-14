require_relative '../../enum/processor/logical_processor_relationship'

require_relative '../cache_descriptor'

module WinFFI
  module Kernel32

    class ProcessCore < FFIAdditions::Struct
      attr_accessor :Flags

      layout Flags: :byte
    end

    class NumaNode < FFIAdditions::Struct
      attr_accessor :NodeNumber

      layout NodeNumber: :dword
    end

    class SLPI_UNION < FFIAdditions::Union
      attr_accessor :ProcessorCore, :NumaNode, :Cache, :Reserved

      layout ProcessorCore: ProcessCore,
             NumaNode:      NumaNode,
             Cache:         CACHE_DESCRIPTOR,
             Reserved:      [:ulong, 2]
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-system_logical_processor_information
    class SYSTEM_LOGICAL_PROCESSOR_INFORMATION < FFIAdditions::Struct
      attr_accessor :ProcessorMask, :Relationship, :u

      layout ProcessorMask: :ulong,
             Relationship:  LogicalProcessorRelationship,
             u:             SLPI_UNION
    end
  end
end