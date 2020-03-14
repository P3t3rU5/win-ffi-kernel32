module WinFFI
  module Kernel32
    class REASON_CONTEXT_DETAILED < FFIAdditions::Struct
      attr_accessor :LocalizedReasonModule,
                    :LocalizedReasonId,
                    :ReasonStringCount,
                    :ReasonStrings

      layout LocalizedReasonModule: :hmodule,
             LocalizedReasonId:     :ulong,
             ReasonStringCount:     :ulong,
             ReasonStrings:         :string
    end

    class REASON_CONTEXT_UNION < FFIAdditions::Struct
      attr_accessor :Detailed, :SimpleReasonString

      layout Detailed:           REASON_CONTEXT_DETAILED,
             SimpleReasonString: :string
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-reason_context
    class REASON_CONTEXT < FFIAdditions::Struct
      attr_accessor :Version, :Flags, :Reason

      layout Version: :ulong,
             Flags:   :dword,
             Reason:  REASON_CONTEXT_UNION
    end
  end
end