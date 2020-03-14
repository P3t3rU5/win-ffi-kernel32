module WinFFI
  if WINDOWS_VERSION >= :xp && WinFFI.x64?
    require 'win-ffi/core/struct/security_attributes'

    require_relative '../enum/memory/acces'
    require_relative '../enum/memory/file_map'

    require_relative '../struct/processor/group_affinity'
    require_relative '../struct/processor/processor_number'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumaavailablememorynode
      # BOOL WINAPI GetNumaAvailableMemoryNode( _In_  UCHAR      Node, _Out_ PULONGLONG AvailableBytes)
      def self.GetNumaAvailableMemoryNode(node, availableBytes); end
      attach_function 'GetNumaAvailableMemoryNode', [:uchar, :long_long], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683203
      # BOOL WINAPI GetNumaHighestNodeNumber(_Out_ PULONG HighestNodeNumber)
      def self.GetNumaHighestNodeNumber(highestNodeNumber); end
      attach_function 'GetNumaHighestNodeNumber', [:ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumanodeprocessormask
      # BOOL WINAPI GetNumaNodeProcessorMask( _In_  UCHAR      Node, _Out_ PULONGLONG ProcessorMask)
      def self.GetNumaNodeProcessorMask(node, processorMask); end
      attach_function 'GetNumaNodeProcessorMask', [:uchar, :long_long], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumaprocessornode
      # BOOL WINAPI GetNumaProcessorNode( _In_  UCHAR  Processor, _Out_ PUCHAR NodeNumber)
      def self.GetNumaProcessorNode(processor, nodeNumber); end
      attach_function 'GetNumaProcessorNode', [:uchar, :uchar], :bool

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366529
        # BOOL WINAPI AllocateUserPhysicalPagesNuma(
        #   _In_     HANDLE hProcess,
        #   _Inout_  PULONG_PTR NumberOfPages,
        #   _Out_    PULONG_PTR PageArray,
        #   _In_     DWORD nndPreferred )
        def self.AllocateUserPhysicalPagesNuma(hProcess, numberOfPages, pageArray, nndPreferred); end
        attach_function 'AllocateUserPhysicalPagesNuma', [:handle, :pointer, :pointer, :dword], :bool

        NUMA_NO_PREFERRED_NODE = 0xffffffff

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createfilemappingnumaa
        # HANDLE WINAPI CreateFileMappingNuma(
        #   _In_      HANDLE hFile,
        #   _In_opt_  LPSECURITY_ATTRIBUTES lpFileMappingAttributes,
        #   _In_      DWORD flProtect,
        #   _In_      DWORD dwMaximumSizeHigh,
        #   _In_      DWORD dwMaximumSizeLow,
        #   _In_opt_  LPCTSTR lpName,
        #   _In_      DWORD nndPreferred )
        def self.CreateFileMappingNuma(hFile, lpFileMappingAttributes, flProtect, dwMaximumSizeHigh, dwMaximumSizeLow,
            lpName, nndPreferred); end
        encoded_function 'CreateFileMappingNuma',
                         [:handle, SECURITY_ATTRIBUTES, MemoryAccess, :dword, :dword, :string, :dword], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumaproximitynode
        # BOOL WINAPI GetNumaProximityNode( _In_  ULONG  ProximityId, _Out_ PUCHAR NodeNumber)
        def self.GetNumaProximityNode(proximityId, nodeNumber); end
        attach_function 'GetNumaProximityNode', [:ulong, :uchar], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-mapviewoffileexnuma
        # LPVOID WINAPI MapViewOfFileExNuma(
        #   _In_      HANDLE hFileMappingObject,
        #   _In_      DWORD dwDesiredAccess,
        #   _In_      DWORD dwFileOffsetHigh,
        #   _In_      DWORD dwFileOffsetLow,
        #   _In_      SIZE_T dwNumberOfBytesToMap,
        #   _In_opt_  LPVOID lpBaseAddress,
        #   _In_      DWORD nndPreferred )
        def self.MapViewOfFileExNuma(hFileMappingObject, dwDesiredAccess, dwFileOffsetHigh, dwFileOffsetLow,
            dwNumberOfBytesToMap, lpBaseAddress, nndPreferred); end
        attach_function 'MapViewOfFileExNuma', [:handle, FileMap, :dword, :dword, :size_t, :pointer, :dword], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366891
        # LPVOID WINAPI VirtualAllocExNuma(
        #   _In_      HANDLE hProcess,
        #   _In_opt_  LPVOID lpAddress,
        #   _In_      SIZE_T dwSize,
        #   _In_      DWORD flAllocationType,
        #   _In_      DWORD flProtect,
        #   _In_      DWORD nndPreferred )
        def self.VirtualAllocExNuma(hProcess, lpAddress, dwSize, flAllocationType, flProtect, nndPreferred); end
        attach_function 'VirtualAllocExNuma', [:handle, :pointer, :size_t, :dword, :dword, :dword], :pointer

        if WINDOWS_VERSION >= 7
          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumaavailablememorynodeex
          # BOOL GetNumaAvailableMemoryNodeEx( _In_  USHORT     Node, _Out_ PULONGLONG AvailableBytes)
          def self.GetNumaAvailableMemoryNodeEx(node, availableBytes); end
          attach_function 'GetNumaAvailableMemoryNodeEx', [:ushort, :long_long], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumanodenumberfromhandle
          # BOOL GetNumaNodeNumberFromHandle( _In_  HANDLE  hFile, _Out_ PUSHORT NodeNumber)
          def self.GetNumaNodeNumberFromHandle(hFile, nodeNumber); end
          attach_function 'GetNumaNodeNumberFromHandle', [:handle, :ushort], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405493
          # BOOL GetNumaNodeProcessorMaskEx( _In_  USHORT          Node, _Out_ PGROUP_AFFINITY ProcessorMask)
          def self.GetNumaNodeProcessorMaskEx(node, processorMask); end
          attach_function 'GetNumaNodeProcessorMaskEx', [:ushort, GROUP_AFFINITY], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnumaprocessornodeex
          # BOOL GetNumaProcessorNodeEx( _In_  PPROCESSOR_NUMBER Processor, _Out_ PUSHORT           NodeNumber)
          def self.GetNumaProcessorNodeEx(processor, nodeNumber); end
          attach_function 'GetNumaProcessorNodeEx', [PROCESSOR_NUMBER, :ushort], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405495
          # BOOL GetNumaProximityNodeEx( _In_  ULONG   ProximityId, _Out_ PUSHORT NodeNumber)
          def self.GetNumaProximityNodeEx(proximityId, nodeNumber); end
          attach_function 'GetNumaProximityNodeEx', [:ulong, :ushort], :bool
        end
      end
    end
  end
end