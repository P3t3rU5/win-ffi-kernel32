require 'win-ffi/core'
require 'win-ffi/core/lib_base'

require 'win-ffi/kernel32/enum/language/get_string_script_flag'
require 'win-ffi/kernel32/enum/language/verify_scripts_flag'
require 'win-ffi/kernel32/enum/language/get_string_script_flag'

module WinFFI
  if WindowsVersion >= :xp
    module Idndl
      extend LibBase

      ffi_lib 'Idndl.dll'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317795(v=vs.85).aspx
      # int DownlevelGetLocaleScripts(
      #   _In_  LPCWSTR lpLocaleName,
      #   _Out_ LPWSTR  lpScripts,
      #   _In_  int     cchScripts)
      attach_function 'DownlevelGetLocaleScripts', [:string, :string, :int], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317798(v=vs.85).aspx
      # int DownlevelGetStringScripts(
      #   _In_  DWORD   dwFlags,
      #   _In_  LPCWSTR lpString,
      #   _In_  int     cchString,
      #   _Out_ LPWSTR  lpScripts,
      #   _In_  int     cchScripts)
      attach_function 'DownlevelGetStringScripts', [Kernel32::GetStringScriptFlag, :string, :int, :string, :int], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd317801(v=vs.85).aspx
      # BOOL DownlevelVerifyScripts(
      #   _In_ DWORD   dwFlags,
      #   _In_ LPCWSTR lpLocaleScripts,
      #   _In_ int     cchLocaleScripts,
      #   _In_ LPCWSTR lpTestScripts,
      #   _In_ int     cchTestScripts)
      attach_function 'DownlevelVerifyScripts', [Kernel32::VerifyScriptsFlag, :string, :int, :string, :int], :bool
    end
  end
end