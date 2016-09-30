require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317784(v=vs.85).aspx
    class CURRENCYFMT < FFIAdditions::Struct
      layout NumDigits:          :uint,
             LeadingZero:        :uint,
             Grouping:           :uint,
             lpDecimalSep:     :string,
             lpThousandSep:    :string,
             NegativeOrder:      :uint,
             PositiveOrder:      :uint,
             lpCurrencySymbol: :string
    end
  end
end