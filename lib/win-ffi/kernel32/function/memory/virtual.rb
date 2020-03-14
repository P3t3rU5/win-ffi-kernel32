module WinFFI
  if WINDOWS_VERSION >= :xp

    require_relative '../../enum/memory/flag'
    require_relative '../../enum/memory/protection_constants'

    require_relative '../../struct/memory/basic_information'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366887
      # @param [FFI:Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] flAllocationType
      # @param [Integer] flProtect
      # @param [FFI::Pointer] lpAddress
      def self.VirtualAlloc(lpAddress, dwSize, flAllocationType, flProtect) end
      attach_function 'VirtualAlloc', [:pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366890
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] flAllocationType
      # @param [Integer] flProtect
      # @return [FFI::Pointer]
      def self.VirtualAllocEx(hProcess, lpAddress, dwSize, flAllocationType, flProtect) end
      attach_function 'VirtualAllocEx', [:handle, :pointer, :size_t, MemoryFlags, MemoryProtectionConstants], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366892
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] dwFreeType
      # @return [true, false]
      def self.VirtualFree(lpAddress, dwSize, dwFreeType) end
      attach_function 'VirtualFree', [:pointer, :size_t, MemoryFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366894
      # @param [Inteer] hProcess
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] dwFreeType
      # @return [true, false]
      def self.VirtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) end
      attach_function 'VirtualFreeEx', [:handle, :pointer, :size_t, MemoryFlags], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366895
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @return [true, false]
      def self.VirtualLock(lpAddress, dwSize) end
      attach_function 'VirtualLock', [:pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366898
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] flNewProtect
      # @param [FFI::Pointer] lpflOldProtect
      # @return [true, false]
      def self.VirtualProtect(lpAddress, dwSize, flNewProtect, lpflOldProtect) end
      attach_function 'VirtualProtect', [:pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366899
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @param [Integer] flNewProtect
      # @param [FFI::Pointer] lpflOldProtect
      # @return [true, false]
      def self.VirtualProtectEx(hProcess, lpAddress, dwSize, flNewProtect, lpflOldProtect) end
      attach_function 'VirtualProtectEx', [:handle, :pointer, :size_t, MemoryProtectionConstants, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366902
      # @param [FFI::Pointer] lpAddress
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] dwLength
      # @return [Integer]
      def self.VirtualQuery(lpAddress, lpBuffer, dwLength) end
      attach_function 'VirtualQuery', [:pointer, MEMORY_BASIC_INFORMATION.ptr(:out), :size_t], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366907
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpAddress
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] dwLength
      # @return [Integer]
      def self.VirtualQueryEx(hProcess, lpAddress, lpBuffer, dwLength) end
      attach_function 'VirtualQueryEx', [:handle, :pointer, MEMORY_BASIC_INFORMATION.ptr(:out), :size_t], :size_t

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366910
      # BOOL VirtualUnlock( _In_  LPVOID lpAddress, _In_  SIZE_T dwSize )
      # @param [FFI::Pointer] lpAddress
      # @param [Integer] dwSize
      # @return [true, false]
      def self.VirtualUnlock(lpAddress, dwSize) end
      attach_function 'VirtualUnlock', [:pointer, :size_t], :bool
    end
  end
end
