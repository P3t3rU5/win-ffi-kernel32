module WinFFI
  module Kernel32
    class TP_POOL_STACK_INFORMATION < FFIAdditions::Struct
      attr_accessor :StackReserve, :StackCommit

      layout StackReserve: :size_t,
             StackCommit:  :size_t
    end
  end
end