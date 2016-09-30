require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/system_info/processor_type'
require 'win-ffi/kernel32/enum/system_info/processor_architecture'

module WinFFI
  module Kernel32
    class SYSTEM_INFO_UNION_STRUCT < FFIAdditions::Struct
      layout wProcessorArchitecture: ProcessorArchitecture,
             wReserved:                              :word
    end

    class SYSTEM_INFO_UNION < FFIAdditions::Union
      layout dwOemId:             :dword,
             s: SYSTEM_INFO_UNION_STRUCT
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724958(v=vs.85).aspx
    class SYSTEM_INFO < FFIAdditions::Struct
      layout u:                  SYSTEM_INFO_UNION,
             dwPageSize:                    :dword,
             lpMinimumApplicationAddress: :pointer,
             lpMaximumApplicationAddress: :pointer,
             dwActiveProcessorMask:         :dword,
             dwNumberOfProcessors:          :dword,
             dwProcessorType:        ProcessorType,
             dwAllocationGranularity:       :dword,
             wProcessorLevel:                :word,
             wProcessorRevision:             :word
    end
  end
end