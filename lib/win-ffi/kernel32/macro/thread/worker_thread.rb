require 'win-ffi/kernel32/enum/thread/worker_thread'

module WinFFI
  module Kernel32
    def self.WT_SET_MAX_THREADPOOL_THREADS(flags, limit)
      flags |= limit << 16
    end
  end
end