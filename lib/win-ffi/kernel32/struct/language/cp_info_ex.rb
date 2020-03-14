require_relative '../../constant/language'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-cpinfoexa
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-cpinfoexw
    class CPINFOEX < FFIAdditions::Struct
      attr_accessor :MaxCharSize,
                    :DefaultChar,
                    :LeadByte,
                    :UnicodeDefaultChar,
                    :CodePage,
                    :CodePageName

      layout MaxCharSize:        :uint,
             DefaultChar:        [:byte, MAX_DEFAULTCHAR],
             LeadByte:           [:byte, MAX_LEADBYTES],
             UnicodeDefaultChar: :wchar,
             CodePage:           :uint,
             CodePageName:       [:tchar, MAX_PATH]
    end
  end
end