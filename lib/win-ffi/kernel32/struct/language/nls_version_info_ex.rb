require 'win-ffi/core/struct/guid'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winnls/ns-winnls-nlsversioninfoex
    class NLSVERSIONINFOEX < FFIAdditions::Struct
      attr_accessor :dwNLSVersionInfoSize,
                    :dwNLSVersion,
                    :dwDefinedVersion,
                    :dwEffectiveId,
                    :guidCustomVersion

      layout dwNLSVersionInfoSize: :dword,
             dwNLSVersion:         :dword,
             dwDefinedVersion:     :dword,
             dwEffectiveId:        :dword,
             guidCustomVersion:    GUID
    end
  end
end