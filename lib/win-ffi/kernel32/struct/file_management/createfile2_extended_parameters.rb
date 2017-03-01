require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= 8
    require 'win-ffi/core/struct/security_attributes'

    module Kernel32
      class CREATEFILE2_EXTENDED_PARAMETERS < FFIAdditions::Struct
        layout dwSize:                            :dword,
               dwFileAttributes:                  :dword,
               dwFileFlags:                       :dword,
               dwSecurityQosFlags:                :dword,
               lpSecurityAttributes: SECURITY_ATTRIBUTES,
               hTemplateFile:                    :handle
      end
    end
  end
end