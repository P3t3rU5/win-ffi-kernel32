module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= 8
      require 'win-ffi/core/struct/guid'

      LOGGER.warn("Starting with Windows 8, your app should use NLSVERSIONINFOEX instead of NLSVERSIONINFO")
    else
      # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-nlsversioninfo~r1
      class NLSVERSIONINFO < FFIAdditions::Struct
        attr_accessor :dwNLSVersionInfoSize,
                      :dwNLSVersion,
                      :dwDefinedVersion

        layout dwNLSVersionInfoSize: :dword,
               dwNLSVersion:         :dword,
               dwDefinedVersion:     :dword
      end
    end
  end
end