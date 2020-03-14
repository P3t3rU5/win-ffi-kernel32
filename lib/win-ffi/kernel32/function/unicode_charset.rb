require_relative '../enum/language/code_page_value'
require_relative '../enum/unicode_charset/multi_byte_flag'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isdbcsleadbyte
    # BOOL IsDBCSLeadByte(_In_ BYTE TestChar)
    def self.IsDBCSLeadByte(testChar); end
    attach_function 'IsDBCSLeadByte', [:byte], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-isdbcsleadbyteex
    # BOOL IsDBCSLeadByteEx(_In_ UINT CodePage, _In_ BYTE TestChar)
    def self.IsDBCSLeadByteEx(codePage, testChar); end
    attach_function 'IsDBCSLeadByteEx', [CodePageValue, :byte], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/stringapiset/nf-stringapiset-multibytetowidechar
    # int MultiByteToWideChar(
    #   _In_      UINT   CodePage,
    #   _In_      DWORD  dwFlags,
    #   _In_      LPCSTR lpMultiByteStr,
    #   _In_      int    cbMultiByte,
    #   _Out_opt_ LPWSTR lpWideCharStr,
    #   _In_      int    cchWideChar)
    def self.MultiByteToWideChar(codePage, dwFlags, lpMultiByteStr, cbMultiByte, lpWideCharStr, cchWideChar); end
    attach_function 'MultiByteToWideChar', [CodePageValue, MultiByteFlag, :string, :int, :string, :int], :int
  end
end