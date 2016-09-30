require 'win-ffi/kernel32/enum/communication/baud_rate'
require 'win-ffi/kernel32/enum/communication/provider_sub_type'
require 'win-ffi/kernel32/enum/communication/provider_capabilities_flag'
require 'win-ffi/kernel32/enum/communication/settable_parameter'
require 'win-ffi/kernel32/enum/communication/data_bit'

module WinFFI
  module Kernel32
    class COMMPROP < FFIAdditions::Struct
      layout wPacketLength:                         :word,
             wPacketVersion:                        :word,
             dwServiceMask:                        :dword,
             dwReserved1:                          :dword,
             dwMaxTxQueue:                         :dword,
             dwMaxRxQueue:                         :dword,
             dwMaxBaud:                          BaudRate,
             dwProvSubType:               ProviderSubType,
             dwProvCapabilities: ProviderCapabilitiesFlag,
             dwSettableParams:          SettableParameter,
             dwSettableBaud:                       :dword,
             wSettableData:                       DataBit,
             wSettableStopParity:                   :word,
             dwCurrentTxQueue:                     :dword,
             dwCurrentRxQueue:                     :dword,
             dwProvSpec1:                          :dword,
             dwProvSpec2:                          :dword,
             wcProvChar:                       [:wchar, 1]
    end
  end
end