
module WinFFI
  if WINDOWS_VERSION >= 8
    require_relative 'claim_security_attribute_v1'

    module Kernel32
      class CLAIM_SECURITY_ATTRIBUTES_INFORMATION_UNION < FFIAdditions::Union
        attr_accessor :pAttributeV1

        layout pAttributeV1: CLAIM_SECURITY_ATTRIBUTE_V1
      end

      # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-claim_security_attributes_information
      class CLAIM_SECURITY_ATTRIBUTES_INFORMATION < FFIAdditions::Struct
        attr_accessor :Version, :Reserved, :AttributeCount, :Attribute

        layout Version:        :word,
               Reserved:       :word,
               AttributeCount: :dword,
               Attribute:      CLAIM_SECURITY_ATTRIBUTES_INFORMATION_UNION
      end
    end
  end
end