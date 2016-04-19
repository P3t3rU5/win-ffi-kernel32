require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/processor/system_logical_processor_information'
require 'win-ffi/kernel32/struct/processor/system_logical_processor_information_ex'

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
      if WindowsVersion >= 7
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405489(v=vs.85).aspx
        # DWORD GetMaximumProcessorCount(_In_ WORD GroupNumber)
        attach_function 'GetMaximumProcessorCount', [:word], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405490(v=vs.85).aspx
        # WORD GetMaximumProcessorGroupCount(void)
        attach_function 'GetMaximumProcessorGroupCount', [], :word

      end
    end
  end
end