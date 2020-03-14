module WinFFI
  module Kernel32
    class PACKAGE_VERSION_STRUCT < FFIAdditions::Struct
      attr_accessor :Revision, :Build, :Minor, :Major

      layout Revision: :ushort,
             Build:    :ushort,
             Minor:    :ushort,
             Major:    :ushort
    end

    class PACKAGE_VERSION_UNION < FFIAdditions::Union
      attr_accessor :Version, :s

      layout Version: :uint64,
             s:       PACKAGE_VERSION_STRUCT
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/appmodel/ns-appmodel-package_version
    class PACKAGE_VERSION < FFIAdditions::Struct
      attr_accessor :u

      layout u: PACKAGE_VERSION_UNION
    end
  end
end