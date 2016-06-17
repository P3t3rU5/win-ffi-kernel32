require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    UmsThreadInfoClass = enum :ums_thread_info_class, [
        :InvalidInfoClass, 0,
        :UserContext,      1,
        :Priority,         2,
        :Affinity,         3,
        :Teb,              4,
        :IsSuspended,      5,
        :IsTerminated,     6,
        :MaxInfoClass,     7
    ]
  end
end