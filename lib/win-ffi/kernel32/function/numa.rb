require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/processor/group_afinity'
require 'win-ffi/kernel32/struct/processor/processor_number'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp && Architecture =  'x64-mingw32'
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683202(v=vs.85).aspx
      # BOOL WINAPI GetNumaAvailableMemoryNode(
      #   _In_  UCHAR      Node,
      #   _Out_ PULONGLONG AvailableBytes)
      attach_function 'GetNumaAvailableMemoryNode', [:uchar, :long_long], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683203(v=vs.85).aspx
      # BOOL WINAPI GetNumaHighestNodeNumber(_Out_ PULONG HighestNodeNumber)
      attach_function 'GetNumaHighestNodeNumber', [:ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683204(v=vs.85).aspx
      # BOOL WINAPI GetNumaNodeProcessorMask(
      #   _In_  UCHAR      Node,
      #   _Out_ PULONGLONG ProcessorMask)
      attach_function 'GetNumaNodeProcessorMask', [:uchar, :long_long], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683205(v=vs.85).aspx
      # BOOL WINAPI GetNumaProcessorNode(
      #   _In_  UCHAR  Processor,
      #   _Out_ PUCHAR NodeNumber)
      attach_function 'GetNumaProcessorNode', [:uchar, :uchar], :bool

      if WindowsVersion >= :vista

        # BOOL WINAPI GetNumaProximityNode(
        #   _In_  ULONG  ProximityId,
        #   _Out_ PUCHAR NodeNumber)
        attach_function 'GetNumaProximityNode', [:ulong, :uchar], :bool

        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405491(v=vs.85).aspx
          # BOOL GetNumaAvailableMemoryNodeEx(
          #   _In_  USHORT     Node,
          #   _Out_ PULONGLONG AvailableBytes)
          attach_function 'GetNumaAvailableMemoryNodeEx', [:ushort, :long_long], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405492(v=vs.85).aspx
          # BOOL GetNumaNodeNumberFromHandle(
          #   _In_  HANDLE  hFile,
          #   _Out_ PUSHORT NodeNumber)
          attach_function 'GetNumaNodeNumberFromHandle', [:handle, :ushort], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405493(v=vs.85).aspx
          # BOOL GetNumaNodeProcessorMaskEx(
          #   _In_  USHORT          Node,
          #   _Out_ PGROUP_AFFINITY ProcessorMask)
          attach_function 'GetNumaNodeProcessorMaskEx', [:ushort, GROUP_AFFINITY], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405494(v=vs.85).aspx
          # BOOL GetNumaProcessorNodeEx(
          #   _In_  PPROCESSOR_NUMBER Processor,
          #   _Out_ PUSHORT           NodeNumber)
          attach_function 'GetNumaProcessorNodeEx', [PROCESSOR_NUMBER, :ushort], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405495(v=vs.85).aspx
          # BOOL GetNumaProximityNodeEx(
          #   _In_  ULONG   ProximityId,
          #   _Out_ PUSHORT NodeNumber)
          attach_function 'GetNumaProximityNodeEx', [:ulong, :ushort], :bool



        end
      end
    end
  end
end