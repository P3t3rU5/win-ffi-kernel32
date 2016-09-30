require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class OVERLAPPED_UNION_STRUCT < FFIAdditions::Struct
      layout Offset:     :dword,
             OffsetHigh: :dword
    end

    class OVERLAPPED_UNION < FFIAdditions::Union
      layout struct: OVERLAPPED_UNION_STRUCT,
             Pointer:               :pointer
    end

    class OVERLAPPED < FFIAdditions::Struct
      layout Internal:        :ulong,
             InternalHigh:    :ulong,
             union: OVERLAPPED_UNION,
             hEvent:         :handle
    end
  end
end