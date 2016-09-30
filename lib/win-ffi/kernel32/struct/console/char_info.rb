require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class CHAR_INFO_UNION < FFIAdditions::Struct
      layout UnicodeChar: :wchar,
             AsciiChar:    :char
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682013(v=vs.85).aspx
    class CHAR_INFO < FFIAdditions::Struct
      layout Char: CHAR_INFO_UNION,
             Attributes:     :word
    end
  end
end