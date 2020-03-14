module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-muldiv
    # @param [Integer] nNumber
    # @param [Integer] nNumerator
    # @param [Integer] nDenominator
    # @return [Integer]
    def self.MulDiv(nNumber, nNumerator, nDenominator); end
    attach_function 'MulDiv', [:int, :int, :int], :int
  end
end