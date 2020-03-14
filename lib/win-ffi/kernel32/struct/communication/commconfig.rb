require_relative 'dcb'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-commconfig
    class COMMCONFIG < FFIAdditions::Struct
      attr_accessor :dwSize,
                    :wVersion,
                    :wReserved,
                    :dcb,
                    :dwProviderSubType,
                    :dwProviderOffset,
                    :dwProviderSize,
                    :wcProviderData

      layout dwSize:            :dword,
             wVersion:          :word,
             wReserved:         :word,
             dcb:               DCB,
             dwProviderSubType: :dword,
             dwProviderOffset:  :dword,
             dwProviderSize:    :dword,
             wcProviderData:    [:wchar, 1]
    end
  end
end