require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/processor/system_logical_processor_information'
require 'win-ffi/kernel32/struct/processor/system_logical_processor_information_ex'
require 'win-ffi/kernel32/struct/process/system_processor_cycle_time_information'
require 'win-ffi/kernel32/struct/processor/system_cpu_set_information'
require 'win-ffi/kernel32/struct/processor/processor_number'

module WinFFI
  module Kernel32
    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683181(v=vs.85).aspx
      # DWORD WINAPI GetCurrentProcessorNumber(void)
      attach_function 'GetCurrentProcessorNumber', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683194(v=vs.85).aspx
      # BOOL WINAPI GetLogicalProcessorInformation(
      #   _Out_   PSYSTEM_LOGICAL_PROCESSOR_INFORMATION Buffer,
      #   _Inout_ PDWORD                                ReturnLength)
      attach_function 'GetLogicalProcessorInformation', [SYSTEM_LOGICAL_PROCESSOR_INFORMATION.ptr(:out), :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405488(v=vs.85).aspx
      # BOOL GetLogicalProcessorInformationEx(
      #   _In_      LOGICAL_PROCESSOR_RELATIONSHIP           RelationshipType,
      #   _Out_opt_ PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX Buffer,
      #   _Inout_   PDWORD                                   ReturnedLength)
      attach_function 'GetLogicalProcessorInformationEx',
                      [LogicalProcessorRelationship, SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684922(v=vs.85).aspx
      # BOOL WINAPI QueryIdleProcessorCycleTime(
      #   _Inout_ PULONG   BufferLength,
      #   _Out_   PULONG64 ProcessorIdleCycleTime)
      attach_function 'QueryIdleProcessorCycleTime', [:pointer, :pointer], :bool

      if WindowsVersion >= 7
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405485(v=vs.85).aspx
        # DWORD GetActiveProcessorCount(_In_ WORD GroupNumber)
        attach_function 'GetActiveProcessorCount', [:word], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405486(v=vs.85).aspx
        # WORD GetActiveProcessorGroupCount(void)
        attach_function 'GetActiveProcessorGroupCount', [], :word

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405487(v=vs.85).aspx
        # VOID GetCurrentProcessorNumberEx(_Out_ PPROCESSOR_NUMBER ProcNumber)
        attach_function 'GetCurrentProcessorNumberEx', [PROCESSOR_NUMBER.ptr(:out)], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405496(v=vs.85).aspx
        # BOOL GetProcessGroupAffinity(
        #   _In_    HANDLE  hProcess,
        #   _Inout_ PUSHORT GroupCount,
        #   _Out_   PUSHORT GroupArray)
        attach_function 'GetProcessGroupAffinity', [:handle, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405489(v=vs.85).aspx
        # DWORD GetMaximumProcessorCount(_In_ WORD GroupNumber)
        attach_function 'GetMaximumProcessorCount', [:word], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405490(v=vs.85).aspx
        # WORD GetMaximumProcessorGroupCount(void)
        attach_function 'GetMaximumProcessorGroupCount', [], :word

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405497(v=vs.85).aspx
        # BOOL GetProcessorSystemCycleTime(
        #   _In_    USHORT                                   Group,
        #   _Out_   PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION Buffer,
        #   _Inout_ PDWORD                                   ReturnedLength)
        attach_function 'GetProcessorSystemCycleTime',
                        [:ushort, SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION.ptr(:out), :dword], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405507(v=vs.85).aspx
        # BOOL QueryIdleProcessorCycleTimeEx(
        #   _In_    USHORT   Group,
        #   _Inout_ PULONG   BufferLength,
        #   _Out_   PULONG64 ProcessorIdleCycleTime)
        attach_function 'QueryIdleProcessorCycleTimeEx', [:ushort, :pointer, :pointer], :bool

        if WindowsVersion >= 10
          # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186425(v=vs.85).aspx
          # BOOL WINAPI GetSystemCpuSetInformation(
          #   _Out_opt_  PSYSTEM_CPU_SET_INFORMATION  Information,
          #   _In_       ULONG                        BufferLength,
          #   _Out_      PULONG                       ReturnedLength,
          #   _In_opt_   HANDLE                       Process,
          #   _Reserved_ ULONG                        Flags)
          attach_function 'GetSystemCpuSetInformation',
                          [SYSTEM_CPU_SET_INFORMATION.ptr, :ulong, :pointer, :handle, :ulong], :bool

        end
      end
    end
  end
end