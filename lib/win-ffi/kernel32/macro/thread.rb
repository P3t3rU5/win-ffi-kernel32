module WinFFI
  module Kernel32
    def self.ProcThreadAttributeValue(number, thread, input, additive)
      (number & 0x0000FFFF) | (thread ? 0x00010000 : 0) | (input ? 0x00020000 : 0) | (additive ? 0x00040000 : 0)
    end
  end
end