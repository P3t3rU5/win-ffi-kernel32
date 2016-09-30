require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    class PACKAGE_VERSION_STRUCT < FFIAdditions::Struct
      layout Revision: :ushort,
             Build:    :ushort,
             Minor:    :ushort,
             Major:    :ushort
    end

    class PACKAGE_VERSION_UNION < FFIAdditions::Union
      layout Version: :uint64,
             s: PACKAGE_VERSION_STRUCT
    end

    class PACKAGE_VERSION < FFIAdditions::Struct
      layout u: PACKAGE_VERSION_UNION
    end
  end
end