module WinFFI
  module Kernel32

    typedef :ushort, :langid
    typedef :pointer, :hrsrc

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-beginupdateresourcea
    # HANDLE BeginUpdateResource( _In_  LPCTSTR pFileName, _In_  BOOL bDeleteExistingResources )
    def self.BeginUpdateResource(pFileName, bDeleteExistingResources) end
    encoded_function 'BeginUpdateResource', [:string, :bool], :handle

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-endupdateresourcea
    # BOOL EndUpdateResource( _In_  HANDLE hUpdate, _In_  BOOL fDiscard )
    def self.EndUpdateResource(hUpdate, fDiscard) end
    encoded_function 'EndUpdateResource', [:handle, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648033
    # BOOL CALLBACK EnumResLangProc(
    #   _In_opt_  HMODULE hModule,
    #   _In_      LPCTSTR lpszType,
    #   _In_      LPCTSTR lpszName,
    #   _In_      WORD wIDLanguage,
    #   _In_      LONG_PTR lParam )
    EnumResLangProc = callback 'EnumResLangProc', [:hmodule, :string, :string, :word, :long_ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648034
    # BOOL CALLBACK EnumResNameProc(
    #   _In_opt_  HMODULE hModule,
    #   _In_      LPCTSTR lpszType,
    #   _In_      LPTSTR lpszName,
    #   _In_      LONG_PTR lParam )
    EnumResNameProc = callback 'EnumResNameProc', [:hmodule, :pointer, :pointer, :long_ptr], :bool

    # https://msdn.microsoft.com/library/ms648041
    # BOOL CALLBACK EnumResTypeProc(
    #   _In_opt_ HMODULE  hModule,
    #   _In_     LPTSTR   lpszType,
    #   _In_     LONG_PTR lParam)
    EnumResTypeProc = callback 'EnumResTypeProc', [:hmodule, :string, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-enumresourcelanguagesa
    # BOOL EnumResourceLanguages(
    #   _In_  HMODULE hModule,
    #   _In_  LPCTSTR lpType,
    #   _In_  LPCTSTR lpName,
    #   _In_  ENUMRESLANGPROC lpEnumFunc,
    #   _In_  LONG_PTR lParam )
    def self.EnumResourceLanguages(hModule, lpType, lpName, lpEnumFunc, lParam) end
    encoded_function 'EnumResourceLanguages', [:hmodule, :pointer, :pointer, EnumResLangProc, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-enumresourcenamesa
    # BOOL EnumResourceNames(
    #   _In_opt_  HMODULE hModule,
    #   _In_      LPCTSTR lpszType,
    #   _In_      ENUMRESNAMEPROC lpEnumFunc,
    #   _In_      LONG_PTR lParam )
    def self.EnumResourceNames(hModule, lpszType, lpEnumFunc, lParam) end
    encoded_function 'EnumResourceNames', [:hmodule, :pointer, EnumResNameProc, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-enumresourcetypesa
    # BOOL EnumResourceTypes(
    #   _In_opt_  HMODULE hModule,
    #   _In_      ENUMRESTYPEPROC lpEnumFunc,
    #   _In_      LONG_PTR lParam )
    def self.EnumResourceTypes(hModule, lpEnumFunc, lParam) end
    encoded_function 'EnumResourceTypes', [:hmodule, EnumResTypeProc, :long_ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findresourcea
    # HRSRC FindResource( _In_opt_  HMODULE hModule, _In_      LPCTSTR lpName, _In_      LPCTSTR lpType )
    def self.FindResource(hModule, lpName, lpType) end
    encoded_function 'FindResource', [:hmodule, :pointer, :pointer], :hrsrc

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findresourceexa
    # HRSRC FindResourceEx(
    #   _In_opt_  HMODULE hModule,
    #   _In_      LPCTSTR lpType,
    #   _In_      LPCTSTR lpName,
    #   _In_      WORD wLanguage )
    def self.FindResourceEx(hModule, lpType, lpName, wLanguage) end
    encoded_function 'FindResourceEx', [:hmodule, :pointer, :pointer, :word], :hrsrc

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648044(v=vs.85).aspx
    # BOOL FreeResource( _In_  HGLOBAL hglbResource )
    def self.FreeResource(hglbResource) end
    attach_function 'FreeResource', [:hglobal], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648046(v=vs.85).aspx
    # HGLOBAL LoadResource( _In_opt_  HMODULE hModule, _In_      HRSRC hResInfo )
    def self.LoadResource(hModule, hResInfo) end
    attach_function 'LoadResource', [:hmodule, :hrsrc], :hglobal

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648047(v=vs.85).aspx
    # LPVOID LockResource( _In_  HGLOBAL hResData )
    def self.LockResource(hResData) end
    attach_function 'LockResource', [:hglobal], :pointer

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648048(v=vs.85).aspx
    # DWORD SizeofResource( _In_opt_  HMODULE hModule, _In_      HRSRC hResInfo )
    def self.SizeofResource(hModule, hResInfo) end
    attach_function 'SizeofResource', [:dword, :hmodule, :hrsrc], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-updateresourcea
    # BOOL UpdateResource(
    #   _In_      HANDLE hUpdate,
    #   _In_      LPCTSTR lpType,
    #   _In_      LPCTSTR lpName,
    #   _In_      WORD wLanguage,
    #   _In_opt_  LPVOID lpData,
    #   _In_      DWORD cbData )
    def self.UpdateResource(hUpdate, lpType, lpName, wLanguage, lpData, cbData) end
    encoded_function 'UpdateResource', [:handle, :pointer, :pointer, :word, :pointer, :dword], :bool

    if WINDOWS_VERSION >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648036(v=vs.85).aspx
      # BOOL EnumResourceLanguagesEx(
      #   _In_  HMODULE hModule,
      #   _In_  LPCTSTR lpType,
      #   _In_  LPCTSTR lpName,
      #   _In_  ENUMRESLANGPROC lpEnumFunc,
      #   _In_  LONG_PTR lParam,
      #   _In_  DWORD dwFlags,
      #   _In_  LANGID LangId )
      def self.EnumResourceLanguagesEx(hModule, lpType, lpName, lpEnumFunc, dwFlags, langId) end
      encoded_function 'EnumResourceLanguagesEx', [:hmodule, :pointer, :pointer, EnumResLangProc, :long_ptr, :dword, :langid], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648038(v=vs.85).aspx
      # BOOL EnumResourceNamesEx(
      #   _In_opt_  HMODULE hModule,
      #   _In_      LPCTSTR lpszType,
      #   _In_      ENUMRESNAMEPROC lpEnumFunc,
      #   _In_      LONG_PTR lParam,
      #   _In_      DWORD dwFlags,
      #   _In_      LANGID LangId )
      def self.EnumResourceNamesEx(hModule, lpszType, lpEnumFunc, lParam, dwFlags, langId) end
      encoded_function 'EnumResourceNamesEx', [:hmodule, :pointer, EnumResNameProc, :long_ptr, :dword, :langid], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms648040(v=vs.85).aspx
      # BOOL EnumResourceTypesEx(
      #   _In_opt_  HMODULE hModule,
      #   _In_      ENUMRESTYPEPROC lpEnumFunc,
      #   _In_      LONG_PTR lParam,
      #   _In_      DWORD dwFlags,
      #   _In_      LANGID LangId )
      def self.EnumResourceTypesEx(hModule, lpEnumFunc, lParam, dwFlags, langId) end
      encoded_function 'EnumResourceTypesEx', [:hmodule, EnumResTypeProc, :long_ptr, :dword, :langid], :bool
    end
  end
end