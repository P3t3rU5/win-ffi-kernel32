module WinFFI
  if WINDOWS_VERSION >= 8
    require 'win-ffi/core/struct/security_attributes'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/fileapi/ns-fileapi-createfile2_extended_parameters
      class CREATEFILE2_EXTENDED_PARAMETERS < FFIAdditions::Struct
        attr_accessor :dwSize,
                      :dwFileAttributes,
                      :dwFileFlags,
                      :dwSecurityQosFlags,
                      :lpSecurityAttributes,
                      :hTemplateFile

        layout dwSize:               :dword,
               dwFileAttributes:     :dword,
               dwFileFlags:          :dword,
               dwSecurityQosFlags:   :dword,
               lpSecurityAttributes: SECURITY_ATTRIBUTES,
               hTemplateFile:        :handle

        def initialize
          super
          self.dwSize = self.size
        end

        private :dwSize, :dwSize=
      end
    end
  end
end