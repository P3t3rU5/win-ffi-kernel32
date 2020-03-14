require 'win-ffi/core'
require 'win-ffi/core/lib_base'

require_relative '../win-ffi/kernel32/enum/language/get_string_script_flag'
require_relative '../win-ffi/kernel32/enum/language/verify_scripts_flag'
require_relative '../win-ffi/kernel32/enum/language/get_string_script_flag'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Idndl
      extend LibBase

      ffi_lib 'Idndl.dll'

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevelgetlocalescripts
      # int DownlevelGetLocaleScripts(
      #   _In_  LPCWSTR lpLocaleName,
      #   _Out_ LPWSTR  lpScripts,
      #   _In_  int     cchScripts)
      def self.DownlevelGetLocaleScripts(lpLocaleName, lpScripts, cchScripts) end
      attach_function 'DownlevelGetLocaleScripts', [:string, :string, :int], :int

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevelgetstringscripts
      # int DownlevelGetStringScripts(
      #   _In_  DWORD   dwFlags,
      #   _In_  LPCWSTR lpString,
      #   _In_  int     cchString,
      #   _Out_ LPWSTR  lpScripts,
      #   _In_  int     cchScripts)
      def self.DownlevelGetStringScripts(dwFlags, lpString, cchString, lpScripts, cchScripts) end
      attach_function 'DownlevelGetStringScripts', [Kernel32::GetStringScriptFlag, :string, :int, :string, :int], :int

      # https://docs.microsoft.com/en-us/windows/desktop/Intl/downlevelverifyscripts
      # BOOL DownlevelVerifyScripts(
      #   _In_ DWORD   dwFlags,
      #   _In_ LPCWSTR lpLocaleScripts,
      #   _In_ int     cchLocaleScripts,
      #   _In_ LPCWSTR lpTestScripts,
      #   _In_ int     cchTestScripts)
      def self.DownlevelVerifyScripts(dwFlags, lpLocaleScripts, cchLocaleScripts, lpTestScripts, cchTestScripts) end
      attach_function 'DownlevelVerifyScripts', [Kernel32::VerifyScriptsFlag, :string, :int, :string, :int], :bool
    end
  end
end