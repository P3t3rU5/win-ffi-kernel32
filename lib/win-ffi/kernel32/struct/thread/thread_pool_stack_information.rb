require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class TP_POOL_STACK_INFORMATION < FFIStruct
      layout :StackReserve, :size_t,
             :StackCommit,  :size_t
    end
  end
end