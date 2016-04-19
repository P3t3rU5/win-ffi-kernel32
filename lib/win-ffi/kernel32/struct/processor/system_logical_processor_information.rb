require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/processor/logical_processor_relationship'

require 'win-ffi/kernel32/struct/cache_descriptor'

module WinFFI
  module Kernel32

    class ProcessCore < FFIStruct
      layout :Flags, :byte
    end

    class NumaNode < FFIStruct
      layout :NodeNumber, :dword
    end

    class SLPI_UNION < FFI::Union
      layout :ProcessorCore, ProcessCore,
             :NumaNode,      NumaNode,
             :Cache,         CACHE_DESCRIPTOR,
             :Reserved,      [:ulong, 2]
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686694(v=vs.85).aspx
    class SYSTEM_LOGICAL_PROCESSOR_INFORMATION < FFIStruct
      layout :ProcessorMask, :ulong,
             :Relationship,  LogicalProcessorRelationship,
             :u,             SLPI_UNION
    end
  end
end