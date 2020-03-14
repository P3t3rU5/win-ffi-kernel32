require_relative '../../enum/processor/processor_cache_type'

require_relative 'group_affinity'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-cache_relationship
    class CACHE_RELATIONSHIP < FFIAdditions::Struct
      attr_accessor :Level,
                    :Associativity,
                    :LineSize,
                    :CacheSize,
                    :Type,
                    :Reserved,
                    :GroupMask

      layout Level:         :byte,
             Associativity: :byte,
             LineSize:      :word,
             CacheSize:     :dword,
             Type:          ProcessorCacheType,
             Reserved:      [:byte, 20],
             GroupMask:     GROUP_AFFINITY
    end
  end
end