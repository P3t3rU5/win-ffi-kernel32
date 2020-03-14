module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-numberfmta
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-numberfmtw
    class NUMBERFMT < FFIAdditions::Struct
      attr_accessor :NumDigits,
                    :LeadingZero,
                    :Grouping,
                    :lpDecimalSep,
                    :lpThousandSep,
                    :NegativeOrder

      layout NumDigits:     :uint,
             LeadingZero:   :uint,
             Grouping:      :uint,
             lpDecimalSep:  :string,
             lpThousandSep: :string,
             NegativeOrder: :uint
    end
  end
end