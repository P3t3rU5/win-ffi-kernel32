require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ProcessorType = enum :processor_type, [
       :INTEL_386,      386,
       :INTEL_486,      486,
       :INTEL_PENTIUM,  586,
       :INTEL_IA64,    2200,
       :AMD_X8664,     8664,
       :MIPS_R4000,    4000,
       :ALPHA_21064,  21064,
       :PPC_601,        601,
       :PPC_603,        603,
       :PPC_604,        604,
       :PPC_620,        620,
       :HITACHI_SH3,  10003,
       :HITACHI_SH3E, 10004,
       :HITACHI_SH4,  10005,
       :MOTOROLA_821,   821,
       :SHx_SH3,        103,
       :SHx_SH4,        104,
       :STRONGARM,     2577,
       :ARM720,        1824,
       :ARM820,        2080,
       :ARM920,        2336,
       :ARM_7TDMI,    70001,
       :OPTIL,       0x494f,
    ]

    define_prefix(:PROCESSOR, ProcessorType)
  end
end