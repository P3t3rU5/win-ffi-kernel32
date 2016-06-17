require 'win-ffi/kernel32/struct/processor/group_affinity'

require 'win-ffi/kernel32/enum/processor/processor_cache_type'
require 'win-ffi/kernel32/struct/processor/group_affinity'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405483(v=vs.85).aspx
    class CACHE_RELATIONSHIP < FFIStruct
      layout :Level,         :byte,
             :Associativity, :byte,
             :LineSize,      :word,
             :CacheSize,     :dword,
             :Type,          ProcessorCacheType,
             :Reserved,      [:byte, 20],
             :GroupMask,     GROUP_AFFINITY
    end
  end
end