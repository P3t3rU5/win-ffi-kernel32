require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    VersionFlag = enum :version_flag, [

        # Product mask constants
        # RtlVerifyVersionInfo() os product type values
        :NT_WORKSTATION,              0x0000001,
        :NT_DOMAIN_CONTROLLER,        0x0000002,
        :NT_SERVER,                   0x0000003,

        # Platform definitions
        # dwPlatformId defines:
        :PLATFORM_WIN32s,             0,
        :PLATFORM_WIN32_WINDOWS,      1,
        :PLATFORM_WIN32_NT,           2
    ]

    define_prefix(:VER, VersionFlag)
  end
end