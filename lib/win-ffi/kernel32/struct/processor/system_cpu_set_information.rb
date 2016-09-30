require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/processor/cpu_set_information_type'

# TODO

# _Struct_size_bytes_(Size) struct _SYSTEM_CPU_SET_INFORMATION {
#   DWORD Size;
#   CPU_SET_INFORMATION_TYPE Type;
#   union {
#     struct {
#       DWORD Id;
#       WORD   Group;
#       BYTE  LogicalProcessorIndex;
#       BYTE  CoreIndex;
#       BYTE  LastLevelCacheIndex;
#       BYTE  NumaNodeIndex;
#       BYTE  EfficiencyClass;
#       union {
#
# #define SYSTEM_CPU_SET_INFORMATION_PARKED 0x1
# #define SYSTEM_CPU_SET_INFORMATION_ALLOCATED 0x2
# #define SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS 0x4
# #define SYSTEM_CPU_SET_INFORMATION_REALTIME 0x8
#
#         BYTE  AllFlags;
#         struct {
#           BYTE  Parked : 1;
#           BYTE  Allocated : 1;
#           BYTE  AllocatedToTargetProcess : 1;
#           BYTE  RealTime : 1;
#           BYTE  ReservedFlags : 4;
#         } DUMMYSTRUCTNAME;
#       } DUMMYUNIONNAME2;
#       DWORD Reserved;
#       DWORD64 AllocationTag;
#     } CpuSet;
#   } DUMMYUNIONNAME;
# };
#
# typedef struct _SYSTEM_CPU_SET_INFORMATION SYSTEM_CPU_SET_INFORMATION, *PSYSTEM_CPU_SET_INFORMATION;
module WinFFI
  module Kernel32

    class SYSTEM_CPU_SET_INFORMATION < FFIAdditions::Struct
      layout Size:                :dword,
             Type: CpuSetInformationType
    end
  end
end