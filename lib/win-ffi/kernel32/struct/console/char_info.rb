module WinFFI
  module Kernel32
    class CHAR_INFO_UNION < FFIAdditions::Struct
      attr_accessor :UnicodeChar, :AsciiChar

      layout UnicodeChar: :wchar,
             AsciiChar:   :char
    end

    # https://docs.microsoft.com/en-us/windows/console/char-info-str
    class CHAR_INFO < FFIAdditions::Struct
      attr_accessor :Char, :Attributes

      layout Char:       CHAR_INFO_UNION,
             Attributes: :word
    end
  end
end