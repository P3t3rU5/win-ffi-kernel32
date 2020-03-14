module WinFFI
  module Kernel32
    PackageInformation = enum :package_information, [:BASIC, 0x00000000, :FULL, 0x00000100,]

    define_prefix(:PACKAGE_INFORMATION, PackageInformation)
  end
end