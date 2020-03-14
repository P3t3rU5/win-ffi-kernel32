module WinFFI
  module Kernel32
    class M128A < FFIAdditions::Struct
      attr_accessor :Low, :High

      layout Low:  :ulong_long,
             High: :long_long
    end
  end
end