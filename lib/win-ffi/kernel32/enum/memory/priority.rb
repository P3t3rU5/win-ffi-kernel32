require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    MemoryPriority = enum :memory_priority, [
        :LOWEST,       0,
        :VERY_LOW,     1,
        :LOW,          2,
        :MEDIUM,       3,
        :BELOW_NORMAL, 4,
        :NORMAL,       5
    ]
  end
end