module WinFFI
  module Kernel32
    # Version info type constants
    VersionType = enum :version_type, [
        :MINORVERSION,                0x0000001,
        :MAJORVERSION,                0x0000002,
        :BUILDNUMBER,                 0x0000004,
        :PLATFORMID,                  0x0000008,
        :SERVICEPACKMINOR,            0x0000010,
        :SERVICEPACKMAJOR,            0x0000020,
        :SUITENAME,                   0x0000040,
        :PRODUCT_TYPE,                0x0000080,
    ]

    define_prefix(:VER, VersionType)
  end
end