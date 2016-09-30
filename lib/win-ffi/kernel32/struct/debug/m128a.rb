require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class M128A < FFIAdditions::Struct
      layout Low:  :ulong_long,
             High: :long_long
    end
  end
end