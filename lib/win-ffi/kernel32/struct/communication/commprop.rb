require_relative '../../enum/communication/baud_rate'
require_relative '../../enum/communication/provider_sub_type'
require_relative '../../enum/communication/provider_capabilities_flag'
require_relative '../../enum/communication/settable_parameter'
require_relative '../../enum/communication/data_bit'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-commprop
    class COMMPROP < FFIAdditions::Struct
      attr_accessor :wPacketLength,
                    :wPacketVersion,
                    :dwServiceMask,
                    :dwReserved1,
                    :dwMaxTxQueue,
                    :dwMaxRxQueue,
                    :dwMaxBaud,
                    :dwProvSubType,
                    :dwProvCapabilities,
                    :dwSettableParams,
                    :dwSettableBaud,
                    :wSettableData,
                    :wSettableStopParity,
                    :dwCurrentTxQueue,
                    :dwCurrentRxQueue,
                    :dwProvSpec1,
                    :dwProvSpec2,
                    :wcProvChar

      layout wPacketLength:       :word,
             wPacketVersion:      :word,
             dwServiceMask:       :dword,
             dwReserved1:         :dword,
             dwMaxTxQueue:        :dword,
             dwMaxRxQueue:        :dword,
             dwMaxBaud:           BaudRate,
             dwProvSubType:       ProviderSubType,
             dwProvCapabilities:  ProviderCapabilitiesFlag,
             dwSettableParams:    SettableParameter,
             dwSettableBaud:      :dword,
             wSettableData:       DataBit,
             wSettableStopParity: :word,
             dwCurrentTxQueue:    :dword,
             dwCurrentRxQueue:    :dword,
             dwProvSpec1:         :dword,
             dwProvSpec2:         :dword,
             wcProvChar:          [:wchar, 1]
    end
  end
end