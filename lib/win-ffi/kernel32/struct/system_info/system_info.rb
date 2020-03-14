require_relative '../../enum/system_info/processor_type'
require_relative '../../enum/system_info/processor_architecture'

module WinFFI
  module Kernel32
    class SYSTEM_INFO_UNION_STRUCT < FFIAdditions::Struct
      attr_accessor :wProcessorArchitecture, :wReserved

      layout wProcessorArchitecture: ProcessorArchitecture,
             wReserved:              :word
    end

    class SYSTEM_INFO_UNION < FFIAdditions::Union
      attr_accessor :dwOemId, :s

      layout dwOemId: :dword,
             s:       SYSTEM_INFO_UNION_STRUCT
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info
    class SYSTEM_INFO < FFIAdditions::Struct
      attr_accessor :u,
                    :dwPageSize,
                    :lpMinimumApplicationAddress,
                    :lpMaximumApplicationAddress,
                    :dwActiveProcessorMask,
                    :dwNumberOfProcessors,
                    :dwProcessorType,
                    :dwAllocationGranularity,
                    :wProcessorLevel,
                    :wProcessorRevision

      layout u:                           SYSTEM_INFO_UNION,
             dwPageSize:                  :dword,
             lpMinimumApplicationAddress: :pointer,
             lpMaximumApplicationAddress: :pointer,
             dwActiveProcessorMask:       :dword,
             dwNumberOfProcessors:        :dword,
             dwProcessorType:             ProcessorType,
             dwAllocationGranularity:     :dword,
             wProcessorLevel:             :word,
             wProcessorRevision:          :word
    end
  end
end