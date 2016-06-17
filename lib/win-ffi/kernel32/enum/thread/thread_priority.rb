require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ThreadPriority = :thread_priority, [
        :BASE_LOWRT,   15, # value that gets a thread to LowRealtime-1
        :BASE_MAX,      2, # maximum thread base priority boost
        :BASE_MIN,     -2, # minimum thread base priority boost
        :BASE_IDLE,   -15, # value that gets a thread to idle

        :LOWEST,          -2,
        :BELOW_NORMAL,    -1,
        :NORMAL,           0,
        :HIGHEST,          2,
        :ABOVE_NORMAL,     1,
        :ERROR_RETURN,     0x7fffffff,

        :TIME_CRITICAL,    15,
        :IDLE,            -15
    ]
  end
end