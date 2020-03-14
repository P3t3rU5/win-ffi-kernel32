require 'win-ffi/core'
require 'win-ffi/core/lib_base'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Nlsmap
      extend LibBase

      ffi_lib 'Nlsdl.dll'

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevelgetparentlocalelcid
      # LCID DownlevelGetParentLocaleLCID(_In_ LCID Locale)
      def self.DownlevelGetParentLocaleLCID(locale) end
      attach_function 'DownlevelGetParentLocaleLCID', [:lcid], :lcid

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevelgetparentlocalename
      # int DownlevelGetParentLocaleName(
      #   _In_  LCID   Locale,
      #   _Out_ LPWSTR lpName,
      #   _In_  int    cchName)
      def self.DownlevelGetParentLocaleName(locale, lpName, cchName) end
      attach_function 'DownlevelGetParentLocaleName', [:lcid, :string, :int], :int

      # https://docs.microsoft.com/en-us/windows/desktop/intl/downlevellcidtolocalename
      # int DownlevelLCIDToLocaleName(_In_ LCID Locale, _Out_ LPWSTR lpName, _In_ int cchName, _In_ DWORD dwFlags)
      def self.DownlevelLCIDToLocaleName(locale, lpName, cchName, dwFlags) end
      attach_function 'DownlevelLCIDToLocaleName', [:lcid, :string, :int, :dword], :int

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevellocalenametolcid
      # LCID DownlevelLocaleNameToLCID(_In_ LPWSTR lpName, _In_ DWORD  dwFlags)
      def self.DownlevelLocaleNameToLCID(lpName, dwFlags) end
      attach_function 'DownlevelLocaleNameToLCID', [:string, :dword], :lcid
    end
  end
end