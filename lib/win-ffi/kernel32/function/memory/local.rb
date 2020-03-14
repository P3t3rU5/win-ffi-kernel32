module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/memory/local/flag'

    module Kernel32

      typedef :handle, :hlocal

      # Local
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localalloc
      # @param [Integer] uFlags
      # @param [Integer] uBytes
      # @return [Integer]
      def self.LocalAlloc(uFlags, uBytes) end
      attach_function 'LocalAlloc', [LocalFlag, :size_t], :ulong

      # @param [Integer] uMinFree
      # @return [Integer]
      def self.LocalCompact(uMinFree) end
      attach_function 'LocalCompact', [:uint], :size_t

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localflags
      # @param [Integer] hMem
      # @return [Integer]
      def self.LocalFlags(hMem) end
      attach_function 'LocalFlags', [:hlocal], :uint

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localfree
      # @param [Integer] hMem
      # @return [Integer]
      def self.LocalFree(hMem) end
      attach_function 'LocalFree', [:hlocal], :hlocal

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localhandle
      # @param [FFI::Pointer] pMem
      # @return [Integer]
      def self.LocalHandle(pMem) end
      attach_function 'LocalHandle', [:pointer], :hlocal

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-locallock
      # @param [Integer] hMem
      # @return [FFI::Pointer]
      def self.LocalLock(hMem) end
      attach_function 'LocalLock', [:hlocal], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localrealloc
      # @param [Integer] hMem
      # @param [Integer] uBytes
      # @param [Integer] uFlags
      # @return [Integer]
      def self.LocalReAlloc(hMem, uBytes, uFlags) end
      attach_function 'LocalReAlloc', [:hlocal, :size_t, LocalFlag], :hlocal

      # @param [Integer] hMem
      # @param [Intger] cbNewSize
      # @return [Integer]
      def self.LocalShrink(hMem, cbNewSize) end
      attach_function 'LocalShrink', [:hlocal, :uint], :size_t

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localsize
      # @param [Integer] hMem
      # @return [Integer]
      def self.LocalSize(hMem) end
      attach_function 'LocalSize', [:hlocal], :uint

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-localunlock
      # @param [Integer] hMem
      # @return [true, false]
      def self.LocalUnlock(hMem) end
      attach_function 'LocalUnlock', [:hlocal], :bool
    end
  end
end