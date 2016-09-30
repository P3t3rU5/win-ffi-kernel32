require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ProcessorArchitecture = enum :processor_architecture, [
        :INTEL,          0,
        :MIPS,           1,
        :ALPHA,          2,
        :PPC,            3,
        :SHX,            4,
        :ARM,            5,
        :IA64,           6,
        :ALPHA64,        7,
        :MSIL,           8,
        :AMD64,          9,
        :IA32_ON_WIN64, 10,
        :NEUTRAL,       11,
        :ARM64,         12,
        :UNKNOWN,   0xFFFF
    ]

    define_prefix(:PROCESSOR_ARCHITECTURE, ProcessorArchitecture)
  end
end