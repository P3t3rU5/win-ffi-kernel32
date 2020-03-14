require_relative '../struct/processor/system_logical_processor_information'
require_relative '../struct/processor/system_logical_processor_information_ex'
require_relative '../struct/process/system_processor_cycle_time_information'
require_relative '../struct/processor/system_cpu_set_information'
require_relative '../struct/processor/processor_number'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= :vista
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

      if WINDOWS_VERSION >= 7
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getactiveprocessorcount
        # DWORD GetActiveProcessorCount(_In_ WORD GroupNumber)
        def self.GetActiveProcessorCount(groupNumber) end
        attach_function 'GetActiveProcessorCount', [:word], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getactiveprocessorgroupcount
        # WORD GetActiveProcessorGroupCount(void)
        def self.GetActiveProcessorGroupCount; end
        attach_function 'GetActiveProcessorGroupCount', [], :word

        # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessornumberex
        # VOID GetCurrentProcessorNumberEx(_Out_ PPROCESSOR_NUMBER ProcNumber)
        def self.GetCurrentProcessorNumberEx(procNumber) end
        attach_function 'GetCurrentProcessorNumberEx', [PROCESSOR_NUMBER.ptr(:out)], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405496
        # BOOL GetProcessGroupAffinity( _In_  HANDLE  hProcess, _Inout_ PUSHORT GroupCount, _Out_   PUSHORT GroupArray)
        def self.GetProcessGroupAffinity(hProcess, groupCount, groupArray) end
        attach_function 'GetProcessGroupAffinity', [:handle, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getmaximumprocessorcount
        # DWORD GetMaximumProcessorCount(_In_ WORD GroupNumber)
        def self.GetMaximumProcessorCount(groupNumber) end
        attach_function 'GetMaximumProcessorCount', [:word], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getmaximumprocessorgroupcount
        # WORD GetMaximumProcessorGroupCount(void)
        def self.GetMaximumProcessorGroupCount; end
        attach_function 'GetMaximumProcessorGroupCount', [], :word

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405497
        # BOOL GetProcessorSystemCycleTime(
        #   _In_    USHORT                                   Group,
        #   _Out_   PSYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION Buffer,
        #   _Inout_ PDWORD                                   ReturnedLength)
        def self.GetProcessorSystemCycleTime(group, buffer, returnedLength) end
        attach_function 'GetProcessorSystemCycleTime',
                        [:ushort, SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION.ptr(:out), :dword], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryidleprocessorcycletimeex
        # BOOL QueryIdleProcessorCycleTimeEx(
        #   _In_    USHORT   Group,
        #   _Inout_ PULONG   BufferLength,
        #   _Out_   PULONG64 ProcessorIdleCycleTime)
        def self.QueryIdleProcessorCycleTimeEx(group, bufferLength, processorIdleCycleTime) end
        attach_function 'QueryIdleProcessorCycleTimeEx', [:ushort, :pointer, :pointer], :bool

        if WINDOWS_VERSION >= 10
          # https://docs.microsoft.com/en-us/windows/desktop/ProcThread/getsystemcpusetinformation
          # BOOL WINAPI GetSystemCpuSetInformation(
          #   _Out_opt_  PSYSTEM_CPU_SET_INFORMATION  Information,
          #   _In_       ULONG                        BufferLength,
          #   _Out_      PULONG                       ReturnedLength,
          #   _In_opt_   HANDLE                       Process,
          #   _Reserved_ ULONG                        Flags)
          def self.GetSystemCpuSetInformation(information, bufferLength, returnedLength, process, flags) end
          attach_function 'GetSystemCpuSetInformation',
                          [SYSTEM_CPU_SET_INFORMATION.ptr, :ulong, :pointer, :handle, :ulong], :bool

        end
      end
    end
  end
end