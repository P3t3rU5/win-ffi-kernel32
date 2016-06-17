require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/memory/memory_acces'
require 'win-ffi/kernel32/enum/memory/file_map'

require 'win-ffi/kernel32/struct/processor/group_affinity'
require 'win-ffi/kernel32/struct/processor/processor_number'
require 'win-ffi/core/struct/security_attributes'

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

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366529(v=vs.85).aspx
        # BOOL WINAPI AllocateUserPhysicalPagesNuma(
        #   _In_     HANDLE hProcess,
        #   _Inout_  PULONG_PTR NumberOfPages,
        #   _Out_    PULONG_PTR PageArray,
        #   _In_     DWORD nndPreferred )
        attach_function 'AllocateUserPhysicalPagesNuma', [:handle, :ulong, :pointer, :dword], :bool

        NUMA_NO_PREFERRED_NODE = 0xffffffff

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366539(v=vs.85).aspx
        # HANDLE WINAPI CreateFileMappingNuma(
        #   _In_      HANDLE hFile,
        #   _In_opt_  LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
        #   _In_      DWORD flProtect,
        #   _In_      DWORD dwMaximumSizeHigh,
        #   _In_      DWORD dwMaximumSizeLow,
        #   _In_opt_  LPCTSTR lpName,
        #   _In_      DWORD nndPreferred )
        encoded_function 'CreateFileMappingNuma', [:handle, SECURITY_ATTRIBUTES, MemoryAccess, :dword, :dword, :string, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683206(v=vs.85).aspx
        # BOOL WINAPI GetNumaProximityNode(
        #   _In_  ULONG  ProximityId,
        #   _Out_ PUCHAR NodeNumber)
        attach_function 'GetNumaProximityNode', [:ulong, :uchar], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366767(v=vs.85).aspx
        # LPVOID WINAPI MapViewOfFileExNuma(
        #   _In_      HANDLE hFileMappingObject,
        #   _In_      DWORD dwDesiredAccess,
        #   _In_      DWORD dwFileOffsetHigh,
        #   _In_      DWORD dwFileOffsetLow,
        #   _In_      SIZE_T dwNumberOfBytesToMap,
        #   _In_opt_  LPVOID lpBaseAddress,
        #   _In_      DWORD nndPreferred )
        attach_function 'MapViewOfFileExNuma', [:handle, FileMap, :dword, :dword, :size_t, :pointer, :dword], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366891(v=vs.85).aspx
        # LPVOID WINAPI VirtualAllocExNuma(
        #   _In_      HANDLE hProcess,
        #   _In_opt_  LPVOID lpAddress,
        #   _In_      SIZE_T dwSize,
        #   _In_      DWORD flAllocationType,
        #   _In_      DWORD flProtect,
        #   _In_      DWORD nndPreferred )
        attach_function 'VirtualAllocExNuma', [:handle, :pointer, :size_t, :dword, :dword, :dword], :pointer

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