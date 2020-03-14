module WinFFI
  module Kernel32
    class OVERLAPPED_UNION_STRUCT < FFIAdditions::Struct
      attr_accessor :Offset, :OffsetHigh

      layout Offset:     :dword,
             OffsetHigh: :dword
    end

    class OVERLAPPED_UNION < FFIAdditions::Union
      attr_accessor :struct, :Pointer

      layout struct:  OVERLAPPED_UNION_STRUCT,
             Pointer: :pointer
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-overlapped
    class OVERLAPPED < FFIAdditions::Struct
      attr_accessor :Internal, :InternalHigh, :union, :hEvent

      layout Internal:     :ulong,
             InternalHigh: :ulong,
             union:        OVERLAPPED_UNION,
             hEvent:       :handle
    end
  end
end