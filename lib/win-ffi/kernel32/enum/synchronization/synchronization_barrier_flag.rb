require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    SynchronizationBarrierFlag = enum :synchronization_barrier_flag, [
        :SPIN_ONLY,  0x01,
        :BLOCK_ONLY, 0x02,
        :NO_DELETE,  0x04,
    ]

    define_prefix(:SYNCHRONIZATION_BARRIER_FLAGS, SynchronizationBarrierFlag)
  end
end