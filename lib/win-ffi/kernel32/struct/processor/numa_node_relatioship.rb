require_relative 'group_affinity'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-numa_node_relationship
    class NUMA_NODE_RELATIONSHIP < FFIAdditions::Struct
      attr_accessor :NodeNumber, :Reserved, :GroupMask

      layout NodeNumber: :dword,
             Reserved:   [:byte, 20],
             GroupMask:  GROUP_AFFINITY
    end
  end
end