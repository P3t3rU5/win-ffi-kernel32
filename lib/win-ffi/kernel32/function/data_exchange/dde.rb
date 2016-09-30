require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649056(v=vs.85).aspx
    # ATOM WINAPI AddAtom(_In_ LPCTSTR lpString)
    encoded_function 'AddAtom', [:string], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649057(v=vs.85).aspx
    # ATOM WINAPI DeleteAtom(_In_ ATOM nAtom)
    attach_function 'DeleteAtom', [:atom], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649058(v=vs.85).aspx
    # ATOM WINAPI FindAtom(_In_ LPCTSTR lpString)
    encoded_function 'FindAtom', [:string], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649059(v=vs.85).aspx
    # UINT WINAPI GetAtomName(
    #   _In_  ATOM   nAtom,
    #   _Out_ LPTSTR lpBuffer,
    #   _In_  int    nSize)
    encoded_function 'GetAtomName', [:atom, :string, :int], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649060(v=vs.85).aspx
    # ATOM WINAPI GlobalAddAtom(_In_ LPCTSTR lpString)
    encoded_function 'GlobalAddAtom', [:string], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn764994(v=vs.85).aspx
    # ATOM WINAPI GlobalAddAtomEx(_In_opt_ LPCTSTR lpString, _In_     DWORD   Flags)
    encoded_function 'GlobalAddAtomEx', [:string, :dword], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649061(v=vs.85).aspx
    # ATOM WINAPI GlobalDeleteAtom(_In_ ATOM nAtom)
    attach_function 'GlobalDeleteAtom', [:atom], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649062(v=vs.85).aspx
    # ATOM WINAPI GlobalFindAtom(_In_ LPCTSTR lpString)
    encoded_function 'GlobalFindAtom', [:string], :atom

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649063(v=vs.85).aspx
    # UINT WINAPI GlobalGetAtomName(
    #   _In_  ATOM   nAtom,
    #   _Out_ LPTSTR lpBuffer,
    #   _In_  int    nSize)
    encoded_function 'GlobalGetAtomName', [:atom, :string, :int], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms649064(v=vs.85).aspx
    # BOOL WINAPI InitAtomTable(_In_ DWORD nSize)
    attach_function 'InitAtomTable', [:dword], :bool

  end
end