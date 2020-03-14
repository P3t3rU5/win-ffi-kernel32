module WinFFI
  module Kernel32
    class PACKAGE_INFO_REFERENCE < FFIAdditions::Struct
      def reserved; end
      def reserved=(v) end

      layout reserved: :pointer
    end
  end
end