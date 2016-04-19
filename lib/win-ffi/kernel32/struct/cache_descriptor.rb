require 'win-ffi/kernel32/enum/processor/processor_cache_type'

module WinFFI
  module Kernel32
    class CACHE_DESCRIPTOR < FFIStruct
      layout :Level,         :byte,
             :Associativity, :byte,
             :LineSize,      :word,
             :Size,          :dword,
             :Type,          ProcessorCacheType
    end
  end
end