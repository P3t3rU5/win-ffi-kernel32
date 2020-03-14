module WinFFI
  module Kernel32

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprivateprofileint
    # UINT GetPrivateProfileInt(
    #   _In_ LPCTSTR lpAppName,
    #   _In_ LPCTSTR lpKeyName,
    #   _In_ INT     nDefault,
    #   _In_ LPCTSTR lpFileName)
    def self.GetPrivateProfileInt(lpAppName, lpKeyName, nDefault, lpFileName) end
    encoded_function 'GetPrivateProfileInt', [:string, :string, :int, :string], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprivateprofilesection
    # DWORD GetPrivateProfileSection(
    #   _In_  LPCTSTR lpAppName,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    def self.GetPrivateProfileSection(lpAppName, lpReturnedString, nSize, lpFileName) end
    encoded_function 'GetPrivateProfileSection', [:string, :string, :dword, :string], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprivateprofilesectionnames
    # DWORD GetPrivateProfileSectionNames(
    #   _Out_ LPTSTR  lpszReturnBuffer,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    def self.GetPrivateProfileSectionNames(lpszReturnBuffer, nSize, lpFileName) end
    encoded_function 'GetPrivateProfileSectionNames', [:string, :dword, :string], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprivateprofilestring
    # DWORD GetPrivateProfileString(
    #   _In_  LPCTSTR lpAppName,
    #   _In_  LPCTSTR lpKeyName,
    #   _In_  LPCTSTR lpDefault,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    def self.GetPrivateProfileString(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize, lpFileName) end
    encoded_function 'GetPrivateProfileString', [:string, :string, :string, :string, :dword, :string], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprivateprofilestruct
    # BOOL GetPrivateProfileStruct(
    #   _In_  LPCTSTR lpszSection,
    #   _In_  LPCTSTR lpszKey,
    #   _Out_ LPVOID  lpStruct,
    #   _In_  UINT    uSizeStruct,
    #   _In_  LPCTSTR szFile)
    def self.GetPrivateProfileStruct(lpszSection, lpszKey, lpStruct, uSizeStruct, szFile) end
    encoded_function 'GetPrivateProfileStruct', [:string, :string, :pointer, :uint, :string], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprofileinta
    # UINT GetProfileInt( _In_ LPCTSTR lpAppName, _In_ LPCTSTR lpKeyName, _In_ INT     nDefault)
    def self. GetProfileInt(lpAppName, lpKeyName, nDefault) end
    encoded_function 'GetProfileInt', [:string, :string, :int], :uint

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprofilesectiona
    # DWORD GetProfileSection( _In_  LPCTSTR lpAppName, _Out_ LPTSTR  lpReturnedString, _In_  DWORD   nSize)
    def self.GetProfileSection(lpAppName, lpReturnedString, nSize) end
    encoded_function 'GetProfileSection', [:string, :string, :dword], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprofilestringa
    # DWORD GetProfileString(
    #   _In_  LPCTSTR lpAppName,
    #   _In_  LPCTSTR lpKeyName,
    #   _In_  LPCTSTR lpDefault,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize)
    def self.GetProfileString(lpAppName, lpKeyName, lpDefault, lpReturnedString, nSize) end
    encoded_function 'GetProfileString', [:string, :string, :string, :string, :dword], :dword
  end
end
