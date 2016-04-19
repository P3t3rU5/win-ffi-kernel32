require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684844(v=vs.85).aspx
    ProcessorCacheType = enum :processor_cache_type, [
        :CacheUnified,
        :CacheInstruction,
        :CacheData,
        :CacheTrace
    ]
  end
end