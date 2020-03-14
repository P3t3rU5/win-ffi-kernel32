require_relative '../enum/processor/processor_cache_type'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-cache_descriptor
    class CACHE_DESCRIPTOR < FFIAdditions::Struct
      attr_accessor :Level, :Associativity, :LineSize, :Size, :Type

      layout Level:         :byte,
             Associativity: :byte,
             LineSize:      :word,
             Size:          :dword,
             Type:          ProcessorCacheType
    end
  end
end