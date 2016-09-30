require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class CLAIM_SECURITY_ATTRIBUTE_V1_UNION < FFIAdditions::Union
      layout pInt64:       :pointer,
             pUint64:      :pointer,
             ppString:     :pointer,
             pFqbn:        :pointer,
             pOctetString: :pointer
    end

    # An individual security attribute.
    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448489(v=vs.85).aspx
    class CLAIM_SECURITY_ATTRIBUTE_V1 < FFIAdditions::Struct
      layout Name:                             :string,
             ValueType:                          :word,
             Reserved:                           :word,
             Flags:                             :dword,
             ValueCount:                        :dword,
             Values: CLAIM_SECURITY_ATTRIBUTE_V1_UNION


    end
  end
end