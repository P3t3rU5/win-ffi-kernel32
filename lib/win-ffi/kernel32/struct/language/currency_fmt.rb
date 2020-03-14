module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-currencyfmta
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-currencyfmtw
    class CURRENCYFMT < FFIAdditions::Struct
      attr_accessor :NumDigits,
                    :LeadingZero,
                    :Grouping,
                    :lpDecimalSep,
                    :lpThousandSep,
                    :NegativeOrder,
                    :PositiveOrder,
                    :lpCurrencySymbol

      layout NumDigits:        :uint,
             LeadingZero:      :uint,
             Grouping:         :uint,
             lpDecimalSep:     :string,
             lpThousandSep:    :string,
             NegativeOrder:    :uint,
             PositiveOrder:    :uint,
             lpCurrencySymbol: :string
    end
  end
end