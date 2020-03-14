module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/memory/global/memory_flag'
    require_relative '../../struct/memory/status'
    require_relative '../../struct/memory/status_ex'

    module Kernel32
      # Global
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalalloc
      # @param [Integer] uFlags
      # @param [Integer] dwBytes
      # @return [Integer]
      def self.GlobalAlloc(uFlags, dwBytes) end
      attach_function 'GlobalAlloc', [GlobalMemoryFlag, :size_t], :hglobal

      # @param [Integer] dwMinFree
      # @return [Integer]
      def self.GlobalCompact(dwMinFree) end
      attach_function 'GlobalCompact', [:dword], :size_t

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalflags
      # @param [Integer] hMem
      # @return [Integer]
      def self.GlobalFlags(hMem) end
      attach_function 'GlobalFlags', [:hglobal], :uint

      # @param [Integer] hMem
      # @return [nil]
      def self.GlobalFix(hMem) end
      attach_function 'GlobalFix', [:hglobal], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalfree
      # @param [Integer] hMem
      # @return [Integer]
      def self.GlobalFree(hMem) end
      attach_function 'GlobalFree', [:hglobal], :hglobal

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalhandle
      # @param [FFI::Pointer] pMem
      # @return [Integer]
      def self.GlobalHandle(pMem) end
      attach_function 'GlobalHandle', [:pointer], :hglobal

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globallock
      # @param [Integer] hMem
      # @return [FFI::Pointer]
      def self.GlobalLock(hMem) end
      attach_function 'GlobalLock', [:hglobal], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalmemorystatus
      # @param [FFI::Pointer] lpBuffer
      # @return [nil]
      def self.GlobalMemoryStatus(lpBuffer) end
      attach_function 'GlobalMemoryStatus', [MEMORYSTATUS.ptr(:out)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366589
      # @param [FFI::Pointer] lpBuffer
      # @return [true, false]
      def self.GlobalMemoryStatusEx(lpBuffer) end
      attach_function 'GlobalMemoryStatusEx', [MEMORYSTATUSEX.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalrealloc
      # @param [Integer] hMem
      # @param [Integer] dwBytes
      # @param [Integer] uFlags
      # @return [Integer]
      def self.GlobalReAlloc(hMem, dwBytes, uFlags) end
      attach_function 'GlobalReAlloc', [:hglobal, :size_t, GlobalMemoryFlag], :hglobal

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa366593(v=vs.85).aspx
      # @param [Integer] hMem
      # @return [Integer]
      def self.GlobalSize(hMem); end
      attach_function 'GlobalSize', [:hglobal], :size_t

      # @param [Integer] hMem
      # @return [nil]
      def self.GlobalUnfix(hMem); end
      attach_function 'GlobalUnfix', [:hglobal], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-globalunlock
      # @param [Integer] hMem
      # @return [true, false]
      def self.GlobalUnlock(hMem) end
      attach_function 'GlobalUnlock', [:hglobal], :bool

      # @param [Integer] hMem
      # @return [true, false]
      def self.GlobalUnWire(hMem) end
      attach_function 'GlobalUnWire', [:hglobal], :bool


      # @param [Integer] hMem
      # @return [FFI::Pointer]
      def self.GlobalWire(hMem) end
      attach_function 'GlobalWire', [:hglobal], :pointer
    end
  end
end