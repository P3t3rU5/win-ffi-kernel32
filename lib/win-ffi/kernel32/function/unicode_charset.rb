require 'win-ffi/kernel32/enum/language/code_page_value'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318664(v=vs.85).aspx
    # BOOL IsDBCSLeadByte(_In_ BYTE TestChar)
    attach_function 'IsDBCSLeadByte', [:byte], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318667(v=vs.85).aspx
    # BOOL IsDBCSLeadByteEx(_In_ UINT CodePage, _In_ BYTE TestChar)
    attach_function 'IsDBCSLeadByteEx', [CodePageValue, :byte], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319072(v=vs.85).aspx
    # int MultiByteToWideChar(
    #   _In_      UINT   CodePage,
    #   _In_      DWORD  dwFlags,
    #   _In_      LPCSTR lpMultiByteStr,
    #   _In_      int    cbMultiByte,
    #   _Out_opt_ LPWSTR lpWideCharStr,
    #   _In_      int    cchWideChar)
    attach_function 'MultiByteToWideChar', [CodePageValue, MultiByteFlag, :string, :int, :string, :int], :int
  end
end