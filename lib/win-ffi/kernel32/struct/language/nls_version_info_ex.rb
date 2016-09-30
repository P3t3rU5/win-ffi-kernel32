require 'win-ffi/kernel32'

require 'win-ffi/core/struct/guid'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/dd319087(v=vs.85).aspx
    class NLSVERSIONINFOEX < FFIAdditions::Struct
      layout dwNLSVersionInfoSize: :dword,
             dwNLSVersion:         :dword,
             dwDefinedVersion:     :dword,
             dwEffectiveId:        :dword,
             guidCustomVersion:      GUID
    end
  end
end