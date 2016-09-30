require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724345%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # UINT WINAPI GetPrivateProfileInt(
    #   _In_ LPCTSTR lpAppName,
    #   _In_ LPCTSTR lpKeyName,
    #   _In_ INT     nDefault,
    #   _In_ LPCTSTR lpFileName)
    encoded_function 'GetPrivateProfileInt', [:string, :string, :int, :string], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724348%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # DWORD WINAPI GetPrivateProfileSection(
    #   _In_  LPCTSTR lpAppName,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    encoded_function 'GetPrivateProfileSection', [:string, :string, :dword, :string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724352(v=vs.85).aspx
    # DWORD WINAPI GetPrivateProfileSectionNames(
    #   _Out_ LPTSTR  lpszReturnBuffer,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    encoded_function 'GetPrivateProfileSectionNames', [:string, :dword, :string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724353%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # DWORD WINAPI GetPrivateProfileString(
    #   _In_  LPCTSTR lpAppName,
    #   _In_  LPCTSTR lpKeyName,
    #   _In_  LPCTSTR lpDefault,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize,
    #   _In_  LPCTSTR lpFileName)
    encoded_function 'GetPrivateProfileString', [:string, :string, :string, :string, :dword, :string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724356(v=vs.85).aspx
    # BOOL WINAPI GetPrivateProfileStruct(
    #   _In_  LPCTSTR lpszSection,
    #   _In_  LPCTSTR lpszKey,
    #   _Out_ LPVOID  lpStruct,
    #   _In_  UINT    uSizeStruct,
    #   _In_  LPCTSTR szFile)
    encoded_function 'GetPrivateProfileStruct', [:string, :string, :pointer, :uint, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724360%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # UINT WINAPI GetProfileInt(
    #   _In_ LPCTSTR lpAppName,
    #   _In_ LPCTSTR lpKeyName,
    #   _In_ INT     nDefault)
    encoded_function 'GetProfileInt', [:string, :string, :int], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724363(v=vs.85).aspx
    # DWORD WINAPI GetProfileSection(
    #   _In_  LPCTSTR lpAppName,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize)
    encoded_function 'GetProfileSection', [:string, :string, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724366(v=vs.85).aspx
    # DWORD WINAPI GetProfileString(
    #   _In_  LPCTSTR lpAppName,
    #   _In_  LPCTSTR lpKeyName,
    #   _In_  LPCTSTR lpDefault,
    #   _Out_ LPTSTR  lpReturnedString,
    #   _In_  DWORD   nSize)
    encoded_function 'GetProfileString', [:string, :string, :string, :string, :dword], :dword

  end
end