require 'win-ffi/kernel32/struct/communication/dcb'

module WinFFI
  module Kernel32
    class COMMCONFIG < FFIAdditions::Struct
      layout dwSize:             :dword,
             wVersion:            :word,
             wReserved:           :word,
             dcb:                   DCB,
             dwProviderSubType:  :dword,
             dwProviderOffset:   :dword,
             dwProviderSize:     :dword,
             wcProviderData: [:wchar, 1]
    end
  end
end