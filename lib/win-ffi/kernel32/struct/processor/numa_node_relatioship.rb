require 'win-ffi/kernel32/struct/processor/group_affinity'

module WinFFI
  module Kernel32
    class NUMA_NODE_RELATIONSHIP < FFIStruct
      layout :NodeNumber, :dword,
             :Reserved,   [:byte, 20],
             :GroupMask,  GROUP_AFFINITY
    end
  end
end