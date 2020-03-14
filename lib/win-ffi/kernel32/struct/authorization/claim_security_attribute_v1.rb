module WinFFI
  module Kernel32
    class CLAIM_SECURITY_ATTRIBUTE_V1_UNION < FFIAdditions::Union
      attr_accessor :pInt64, :pUint64, :ppString, :pFqbn, :pOctetString

      layout pInt64:       :pointer,
             pUint64:      :pointer,
             ppString:     :pointer,
             pFqbn:        :pointer,
             pOctetString: :pointer
    end

    # An individual security attribute.
    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-claim_security_attribute_v1
    class CLAIM_SECURITY_ATTRIBUTE_V1 < FFIAdditions::Struct
      attr_accessor :Name, :ValueType, :Reserved, :Flags, :ValueCount, :Values

      layout Name:       :string,
             ValueType:  :word,
             Reserved:   :word,
             Flags:      :dword,
             ValueCount: :dword,
             Values:     CLAIM_SECURITY_ATTRIBUTE_V1_UNION


    end
  end
end