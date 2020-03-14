require_relative '../enum/activation_context'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-actctxa
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-actctxw
    class ACTCTX < FFIAdditions::Struct
      attr_accessor :cbSize,
                    :dwFlags,
                    :lpSource,
                    :wProcessorArchitecture,
                    :wLangId,
                    :lpAssemblyDirectory,
                    :lpResourceName,
                    :lpApplicationName,
                    :hModule

      layout cbSize:                 :ulong,
             dwFlags:                ActivationContext,
             lpSource:               :pointer,
             wProcessorArchitecture: :ushort,
             wLangId:                :langid,
             lpAssemblyDirectory:    :pointer,
             lpResourceName:         :pointer,
             lpApplicationName:      :pointer,
             hModule:                :hmodule

      def initialize(*args)
        super
        self.cbSize = self.size
      end

      private :cbSize=
    end
  end
end