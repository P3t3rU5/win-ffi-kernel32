require 'win-ffi/core'
require 'win-ffi/core/lib_base'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Nlsmap
      extend LibBase

      ffi_lib 'Nlsdl.dll'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317796(v=vs.85).aspx
      # LCID DownlevelGetParentLocaleLCID(_In_ LCID Locale)
      attach_function 'DownlevelGetParentLocaleLCID', [:lcid], :lcid

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317797(v=vs.85).aspx
      # int DownlevelGetParentLocaleName(
      #   _In_  LCID   Locale,
      #   _Out_ LPWSTR lpName,
      #   _In_  int    cchName)
      attach_function 'DownlevelGetParentLocaleName', [:lcid, :string, :int], :int

      # int DownlevelLCIDToLocaleName(
      #   _In_  LCID   Locale,
      #   _Out_ LPWSTR lpName,
      #   _In_  int    cchName,
      #   _In_  DWORD  dwFlags)
      attach_function 'DownlevelLCIDToLocaleName', [:lcid, :string, :int, :dword], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317800(v=vs.85).aspx
      # LCID DownlevelLocaleNameToLCID(_In_ LPWSTR lpName, _In_ DWORD  dwFlags)
      attach_function 'DownlevelLocaleNameToLCID', [:string, :dword], :lcid
    end
  end
end