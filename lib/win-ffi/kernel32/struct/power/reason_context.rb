require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class REASON_CONTEXT_DETAILED < FFIAdditions::Struct
      layout LocalizedReasonModule: :hmodule,
             LocalizedReasonId:       :ulong,
             ReasonStringCount:       :ulong,
             ReasonStrings:          :string
    end

    class REASON_CONTEXT_UNION < FFIAdditions::Struct
      layout Detailed: REASON_CONTEXT_DETAILED,
             SimpleReasonString:       :string
    end

    class REASON_CONTEXT < FFIAdditions::Struct
      layout Version:              :ulong,
             Flags:                :dword,
             Reason: REASON_CONTEXT_UNION
    end
  end
end