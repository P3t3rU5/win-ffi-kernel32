require 'win-ffi/kernel32/struct/authorization/claim_security_attribute_v1'

module WinFFI
  if WindowsVersion >= 8
    module Kernel32
      class CLAIM_SECURITY_ATTRIBUTES_INFORMATION_UNION < FFIAdditions::Union
        layout pAttributeV1: CLAIM_SECURITY_ATTRIBUTE_V1
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448481(v=vs.85).aspx
      class CLAIM_SECURITY_ATTRIBUTES_INFORMATION < FFIAdditions::Struct
        layout Version:                                         :word,
               Reserved:                                        :word,
               AttributeCount:                                 :dword,
               Attribute: CLAIM_SECURITY_ATTRIBUTES_INFORMATION_UNION

      end
    end
  end
end