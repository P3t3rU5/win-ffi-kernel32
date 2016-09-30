require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/mui/mui_flag'
require 'win-ffi/kernel32/struct/mui/file_mui_info'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317835(v=vs.85).aspx
    # BOOL CALLBACK EnumUILanguagesProc(_In_ LPTSTR   lpUILanguageString, _In_ LONG_PTR lParam)
    EnumUILanguagesProc = callback 'EnumUILanguagesProc', [:string, :long], :bool

    # BOOL EnumUILanguages(
    #   _In_ UILANGUAGE_ENUMPROC lpUILanguageEnumProc,
    #   _In_ DWORD               dwFlags,
    #   _In_ LONG_PTR            lParam)
    encoded_function 'EnumUILanguages', [EnumUILanguagesProc, MuiFlag, :lparam], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318123(v=vs.85).aspx
    # LANGID GetSystemDefaultUILanguage(void)
    attach_function 'GetSystemDefaultUILanguage', [], :langid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318137(v=vs.85).aspx
    # LANGID GetUserDefaultUILanguage(void)
    attach_function 'GetUserDefaultUILanguage', [], :langid

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318709(v=vs.85).aspx
    # HINSTANCE LoadMUILibrary(
    #   _In_ LPCTSTR pszFullModuleName,
    #   _In_ DWORD   dwLangConvention,
    #   _In_ LANGID  LangID)
    # encoded_function 'LoadMUILibrary', [:string, MuiFlag, :langid], :hinstance

    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374053(v=vs.85).aspx
      # LANGID SetThreadUILanguage(_In_ LANGID LangId)
      attach_function 'SetThreadUILanguage', [:langid], :langid

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318067(v=vs.85).aspx
        # BOOL FreeMUILibrary(_In_ HMODULE hResModule)
        # attach_function 'FreeMUILibrary', [:hmodule], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318095(v=vs.85).aspx
        # BOOL GetFileMUIInfo(
        #   _In_        DWORD        dwFlags,
        #   _In_        PCWSTR       pcwszFilePath,
        #   _Inout_opt_ PFILEMUIINFO pFileMUIInfo,
        #   _Inout_     DWORD        *pcbFileMUIInfo)
        attach_function 'GetFileMUIInfo', [MuiFlag, :string, FILEMUIINFO.ptr, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318097(v=vs.85).aspx
        # BOOL GetFileMUIPath(
        #   _In_        DWORD      dwFlags,
        #   _In_        PCWSTR     pcwszFilePath,
        #   _Inout_opt_ PWSTR      pwszLanguage,
        #   _Inout_     PULONG     pcchLanguage,
        #   _Out_opt_   PWSTR      pwszFileMUIPath,
        #   _Inout_     PULONG     pcchFileMUIPath,
        #   _Inout_     PULONGLONG pululEnumerator)
        attach_function 'GetFileMUIPath', [MuiFlag, :string, :string, :pointer, :string, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318124(v=vs.85).aspx
        # BOOL GetSystemPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        attach_function 'GetSystemPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318128(v=vs.85).aspx
        # BOOL GetThreadPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        attach_function 'GetThreadPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318129(v=vs.85).aspx
        # LANGID GetThreadUILanguage(void)
        attach_function 'GetThreadUILanguage', [], :langid

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318133(v=vs.85).aspx
        # BOOL GetUILanguageInfo(
        #   _In_        DWORD    dwFlags,
        #   _In_        PCZZWSTR pwmszLanguage,
        #   _Out_opt_   PZZWSTR  pwszFallbackLanguages,
        #   _Inout_opt_ PDWORD   pcchFallbackLanguages,
        #   _Out_       PDWORD   pdwAttributes)
        attach_function 'GetUILanguageInfo', [MuiFlag, :pointer, :pointer, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318139(v=vs.85).aspx
        # BOOL GetUserPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        attach_function 'GetUserPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374052(v=vs.85).aspx
        # BOOL SetThreadPreferredUILanguages(
        #   _In_      DWORD    dwFlags,
        #   _In_opt_  PCZZWSTR pwszLanguagesBuffer,
        #   _Out_opt_ PULONG   pulNumLanguages)
        attach_function 'SetThreadPreferredUILanguages', [MuiFlag, :pointer, :pointer], :bool

        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318115(v=vs.85).aspx
          # BOOL GetProcessPreferredUILanguages(
          #   _In_      DWORD   dwFlags,
          #   _Out_     PULONG  pulNumLanguages,
          #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
          #   _Inout_   PULONG  pcchLanguagesBuffer)
          attach_function 'GetProcessPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd318132(v=vs.85).aspx
          # BOOL GetUILanguageFallbackList(
          #   _Out_opt_ PWSTR  pFallbackList,
          #   _In_      ULONG  cchFallbackList,
          #   _Out_opt_ PULONG pcchFallbackListOut)
          # attach_function 'GetUILanguageFallbackList', [:string, :ulong, :pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd374050(v=vs.85).aspx
          # BOOL SetProcessPreferredUILanguages(
          #   _In_      DWORD    dwFlags,
          #   _In_opt_  PCZZWSTR pwszLanguagesBuffer,
          #   _Out_opt_ PULONG   pulNumLanguages)
          attach_function 'SetProcessPreferredUILanguages', [MuiFlag, :pointer, :pointer], :bool
        end
      end
    end
  end
end
