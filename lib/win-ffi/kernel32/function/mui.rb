require_relative '../enum/mui/flag'
require_relative '../struct/mui/file_mui_info'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317835
    # BOOL CALLBACK EnumUILanguagesProc(_In_ LPTSTR   lpUILanguageString, _In_ LONG_PTR lParam)
    EnumUILanguagesProc = callback 'EnumUILanguagesProc', [:string, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-enumuilanguagesa
    # BOOL EnumUILanguages( _In_ UILANGUAGE_ENUMPROC lpUILanguageEnumProc, _In_ DWORD dwFlags, _In_ LONG_PTR lParam)
    def self.EnumUILanguages(lpUILanguageEnumProc, dwFlags, lParam); end
    encoded_function 'EnumUILanguages', [EnumUILanguagesProc, MuiFlag, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getsystemdefaultuilanguage
    # LANGID GetSystemDefaultUILanguage(void)
    def self.GetSystemDefaultUILanguage; end
    attach_function 'GetSystemDefaultUILanguage', [], :langid

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserdefaultuilanguage
    # LANGID GetUserDefaultUILanguage(void)
    def self.GetUserDefaultUILanguage; end
    attach_function 'GetUserDefaultUILanguage', [], :langid

    # https://docs.microsoft.com/en-us/windows/desktop/api/muiload/nf-muiload-loadmuilibrarya
    # HINSTANCE LoadMUILibrary( _In_ LPCTSTR pszFullModuleName, _In_ DWORD   dwLangConvention, _In_ LANGID  LangID)
    # def self.LoadMUILibrary(pszFullModuleName, dwLangConvention, langID); end
    # encoded_function 'LoadMUILibrary', [:string, MuiFlag, :langid], :hinstance

    if WINDOWS_VERSION >= :xp
      # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setthreaduilanguage
      # LANGID SetThreadUILanguage(_In_ LANGID LangId)
      def self.SetThreadUILanguage(langId); end
      attach_function 'SetThreadUILanguage', [:langid], :langid

      if WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/muiload/nf-muiload-freemuilibrary
        # BOOL FreeMUILibrary(_In_ HMODULE hResModule)
        # def self.FreeMUILibrary(hResModule); end
        # attach_function 'FreeMUILibrary', [:hmodule], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getfilemuiinfo
        # BOOL GetFileMUIInfo(
        #   _In_        DWORD        dwFlags,
        #   _In_        PCWSTR       pcwszFilePath,
        #   _Inout_opt_ PFILEMUIINFO pFileMUIInfo,
        #   _Inout_     DWORD        *pcbFileMUIInfo)
        def self.GetFileMUIInfo(dwFlags, pcwszFilePath, pFileMUIInfo, pcbFileMUIInfo); end
        attach_function 'GetFileMUIInfo', [MuiFlag, :string, FILEMUIINFO.ptr, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getfilemuipath
        # BOOL GetFileMUIPath(
        #   _In_        DWORD      dwFlags,
        #   _In_        PCWSTR     pcwszFilePath,
        #   _Inout_opt_ PWSTR      pwszLanguage,
        #   _Inout_     PULONG     pcchLanguage,
        #   _Out_opt_   PWSTR      pwszFileMUIPath,
        #   _Inout_     PULONG     pcchFileMUIPath,
        #   _Inout_     PULONGLONG pululEnumerator)
        def self.GetFileMUIPath(dwFlags, pcwszFilePath, pwszLanguage, pcchLanguage, pwszFileMUIPath, pcchFileMUIPath,
            pululEnumerator); end
        attach_function 'GetFileMUIPath', [MuiFlag, :string, :string, :pointer, :string, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getsystempreferreduilanguages
        # BOOL GetSystemPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        def self.GetSystemPreferredUILanguages(dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer); end
        attach_function 'GetSystemPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getthreadpreferreduilanguages
        # BOOL GetThreadPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        def self.GetThreadPreferredUILanguages(dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer); end
        attach_function 'GetThreadPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getthreaduilanguage
        # LANGID GetThreadUILanguage(void)
        def self.GetThreadUILanguage; end
        attach_function 'GetThreadUILanguage', [], :langid

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuilanguageinfo
        # BOOL GetUILanguageInfo(
        #   _In_        DWORD    dwFlags,
        #   _In_        PCZZWSTR pwmszLanguage,
        #   _Out_opt_   PZZWSTR  pwszFallbackLanguages,
        #   _Inout_opt_ PDWORD   pcchFallbackLanguages,
        #   _Out_       PDWORD   pdwAttributes)
        def self.GetUILanguageInfo(dwFlags, pwmszLanguage, pwszFallbackLanguages, pcchFallbackLanguages, pdwAttributes)
        end
        attach_function 'GetUILanguageInfo', [MuiFlag, :pointer, :pointer, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getuserpreferreduilanguages
        # BOOL GetUserPreferredUILanguages(
        #   _In_      DWORD   dwFlags,
        #   _Out_     PULONG  pulNumLanguages,
        #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
        #   _Inout_   PULONG  pcchLanguagesBuffer)
        def self.GetUserPreferredUILanguages(dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer); end
        attach_function 'GetUserPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setthreadpreferreduilanguages
        # BOOL SetThreadPreferredUILanguages(
        #   _In_      DWORD    dwFlags,
        #   _In_opt_  PCZZWSTR pwszLanguagesBuffer,
        #   _Out_opt_ PULONG   pulNumLanguages)
        def self.SetThreadPreferredUILanguages(dwFlags, pwszLanguagesBuffer, pulNumLanguages); end
        attach_function 'SetThreadPreferredUILanguages', [MuiFlag, :pointer, :pointer], :bool

        if WINDOWS_VERSION >= 7
          # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-getprocesspreferreduilanguages
          # BOOL GetProcessPreferredUILanguages(
          #   _In_      DWORD   dwFlags,
          #   _Out_     PULONG  pulNumLanguages,
          #   _Out_opt_ PZZWSTR pwszLanguagesBuffer,
          #   _Inout_   PULONG  pcchLanguagesBuffer)
          def self.GetProcessPreferredUILanguages(dwFlags, pulNumLanguages, pwszLanguagesBuffer, pcchLanguagesBuffer)
          end
          attach_function 'GetProcessPreferredUILanguages', [MuiFlag, :pointer, :pointer, :pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/muiload/nf-muiload-getuilanguagefallbacklist
          # BOOL GetUILanguageFallbackList(
          #   _Out_opt_ PWSTR  pFallbackList,
          #   _In_      ULONG  cchFallbackList,
          #   _Out_opt_ PULONG pcchFallbackListOut)
          # def self.GetUILanguageFallbackList(pFallbackList, cchFallbackList, pcchFallbackListOut); end
          # attach_function 'GetUILanguageFallbackList', [:string, :ulong, :pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winnls/nf-winnls-setprocesspreferreduilanguages
          # BOOL SetProcessPreferredUILanguages(
          #   _In_      DWORD    dwFlags,
          #   _In_opt_  PCZZWSTR pwszLanguagesBuffer,
          #   _Out_opt_ PULONG   pulNumLanguages)
          def self.SetProcessPreferredUILanguages(dwFlags, pwszLanguagesBuffer, pulNumLanguages); end
          attach_function 'SetProcessPreferredUILanguages', [MuiFlag, :pointer, :pointer], :bool
        end
      end
    end
  end
end
