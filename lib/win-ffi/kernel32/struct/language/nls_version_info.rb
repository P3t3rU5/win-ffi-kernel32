require 'win-ffi/kernel32'

require 'win-ffi/core/struct/guid'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319086(v=vs.85).aspx
    if WindowsVersion >= 8
      class NLSVERSIONINFO < FFIAdditions::Struct
        layout dwNLSVersionInfoSize: :dword,
               dwNLSVersion:         :dword,
               dwDefinedVersion:     :dword,
               dwEffectiveId:        :dword,
               guidCustomVersion:      GUID
      end
    else
      class NLSVERSIONINFO < FFIAdditions::Struct
        layout dwNLSVersionInfoSize: :dword,
               dwNLSVersion:         :dword,
               dwDefinedVersion:     :dword
      end
    end
  end
end