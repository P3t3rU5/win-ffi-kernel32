module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/debug/status'
    require_relative '../struct/debug/context'
    require_relative '../struct/debug/ldt_entry'
    require_relative '../struct/debug/wow64_ldt_entry'
    require_relative '../struct/debug/debug_event'
    require_relative '../struct/debug/wow64_context'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679285
      # @param [Integer] dwProcessId
      # @param [Integer] dwThreadId
      # @param [Integer] dwContinueStatus
      # @return [true, false]
      def self.ContinueDebugEvent(dwProcessId, dwThreadId, dwContinueStatus) end
      attach_function 'ContinueDebugEvent', [:dword, :dword, Status], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679295
      # @param [Integer] dwProcessId
      # @return [true, false]
      def self.DebugActiveProcess(dwProcessId) end
      attach_function 'DebugActiveProcess', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679296
      # @param [Integer] dwProcessId
      # @return [true, false]
      def self.DebugActiveProcessStop(dwProcessId) end
      attach_function 'DebugActiveProcessStop', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679297
      # @return [nil]
      def self.DebugBreak; end
      attach_function 'DebugBreak', [], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679298
      # @param [Integer] process
      # @return [true, false]
      def self.DebugBreakProcess(process) end
      attach_function 'DebugBreakProcess', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679307
      # @param [true, false] killOnExit
      # @return [true, false]
      def self.DebugSetProcessKillOnExit(killOnExit) end
      attach_function 'DebugSetProcessKillOnExit', [:bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679337
      # @param [Integer] exitCode
      # @return [nil]
      def self.FatalExit(exitCode) end
      attach_function 'FatalExit', [:int], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679350
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpBaseAddress
      # @param [Integer] dwSize
      # @return [true, false]
      def self.FlushInstructionCache(hProcess, lpBaseAddress, dwSize) end
      attach_function 'FlushInstructionCache', [:handle, :pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679362
      # @param [Integer] hThread
      # @param [FFI::Pointer] lpContext
      # @return [true, false]
      def self.GetThreadContext(hThread, lpContext) end
      attach_function 'GetThreadContext', [:handle, CONTEXT.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679363
      # @param [Integer] hThread
      # @param [Integer] dwSelector
      # @param [FFI::Pointer] lpSelectorEntry
      # @return [true, false]
      def self.GetThreadSelectorEntry(hThread, dwSelector, lpSelectorEntry) end
      attach_function 'GetThreadSelectorEntry', [:handle, :dword, LDT_ENTRY.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680345
      # @return [true, false]
      def self.IsDebuggerPresent; end
      attach_function 'IsDebuggerPresent', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363362
      # @param [String] lpOutputString
      # @return [nil]
      def self.OutputDebugString(lpOutputString) end
      encoded_function 'OutputDebugString', [:string], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680553
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpBaseAddress
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nSize
      # @param [Integer] lpNumberOfBytesRead
      # @return [true, false]
      def self.ReadProcessMemory(hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesRead) end
      attach_function 'ReadProcessMemory', [:handle, :pointer, :pointer, :size_t, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680632
      # @param [Integer] hThread
      # @param [FFI::Pointer] lpContext
      # @return [true, false]
      def self.SetThreadContext(hThread, lpContext) end
      attach_function 'SetThreadContext', [:handle, CONTEXT.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681423
      # @param [FFI::Pointer] lpDebugEvent
      # @param [Integer] dwMilliseconds
      # @return [true, false]
      def self.WaitForDebugEvent(lpDebugEvent, dwMilliseconds) end
      attach_function 'WaitForDebugEvent', [DEBUG_EVENT.ptr(:out), :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681674
      # @param [Integer] hProcess
      # @param [FFI::Pointer] lpBaseAddress
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nSize
      # @param [Integer] lpNumberOfBytesWritten
      # @return [true, false]
      def self.WriteProcessMemory(hProcess, lpBaseAddress, lpBuffer, nSize, lpNumberOfBytesWritten) end
      attach_function 'WriteProcessMemory', [:handle, :pointer, :pointer, :size_t, :size_t], :bool

      if WINDOWS_VERSION >= :vista || WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp == 1
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679280
        # @param [Integer] hProcess
        # @param [FFI::Pointer] pbDebuggerPresent
        # @return [true, false]
        def self.CheckRemoteDebuggerPresent(hProcess, pbDebuggerPresent) end
        attach_function 'CheckRemoteDebuggerPresent', [:handle, :pointer], :bool

        if WINDOWS_VERSION >= :vista
          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681665
          # @param [Integer] hThread
          # @param [FFI::Pointer] lpContext
          # @return [true, false]
          def self.Wow64GetThreadContext(hThread, lpContext) end
          attach_function 'Wow64GetThreadContext', [:handle, WOW64_CONTEXT.ptr], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681668
          # @param [Integer] hThread
          # @param [FFI::Pointer] lpContext
          # @return [true, false]
          def self.Wow64SetThreadContext(hThread, lpContext) end
          attach_function 'Wow64SetThreadContext', [:handle, WOW64_CONTEXT.ptr(:in)], :bool

          if WINDOWS_VERSION >= 7
            # https://msdn.microsoft.com/en-us/library/windows/desktop/dd709484
            # @param [Integer] hThread
            # @param [Integer] dwSelector
            # @param [FFI::Pointer] lpSelectorEntry
            # @return [true, false]
            def self.Wow64GetThreadSelectorEntry(hThread, dwSelector, lpSelectorEntry) end
            attach_function 'Wow64GetThreadSelectorEntry', [:handle, :dword, WOW64_LDT_ENTRY.ptr(:out)], :bool

            if WINDOWS_VERSION >= 8 || WINDOWS_VERSION == 7 && WINDOWS_VERSION.sp == 1
              # https://msdn.microsoft.com/en-us/library/windows/desktop/hh134234%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
              # @param [FFI::Pointer] destination
              # @param [Integer] contextFlags
              # @param [FFI::Pointer] source
              # @return [true, false]
              def self.CopyContext(destination, contextFlags, source) end
              attach_function 'CopyContext', [CONTEXT.ptr, :dword, CONTEXT.ptr(:in)], :bool

              if WINDOWS_VERSION >= 10
                # https://msdn.microsoft.com/en-us/library/windows/desktop/mt171594
                # @param [FFI::Pointer] lpDebugEvent
                # @param [Integer] dwMilliseconds
                # @return [true, false]
                def self.WaitForDebugEventEx(lpDebugEvent, dwMilliseconds) end
                attach_function 'WaitForDebugEventEx', [:pointer, :dword], :bool
              end
            end
          end
        end
      end
    end
  end
end