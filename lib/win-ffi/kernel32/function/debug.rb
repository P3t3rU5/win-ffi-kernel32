require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/debug/status'
require 'win-ffi/kernel32/struct/debug/context'

module WinFFI
  module Kernel32

    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679285(v=vs.85).aspx
      # BOOL WINAPI ContinueDebugEvent(
      #   _In_ DWORD dwProcessId,
      #   _In_ DWORD dwThreadId,
      #   _In_ DWORD dwContinueStatus)
      attach_function 'ContinueDebugEvent', [:dword, :dword, Status], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679295(v=vs.85).aspx
      # BOOL WINAPI DebugActiveProcess(_In_ DWORD dwProcessId)
      attach_function 'DebugActiveProcess', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679296(v=vs.85).aspx
      # BOOL WINAPI DebugActiveProcessStop(_In_ DWORD dwProcessId)
      attach_function 'DebugActiveProcessStop', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679297(v=vs.85).aspx
      # void WINAPI DebugBreak(void);
      attach_function 'DebugBreak', [], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679298(v=vs.85).aspx
      # BOOL WINAPI DebugBreakProcess(_In_ HANDLE Process)
      attach_function 'DebugBreakProcess', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679307(v=vs.85).aspx
      # BOOL WINAPI DebugSetProcessKillOnExit(_In_ BOOL KillOnExit)
      attach_function 'DebugSetProcessKillOnExit', [:bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679337(v=vs.85).aspx
      # void WINAPI FatalExit(_In_ int ExitCode)
      attach_function 'FatalExit', [:int], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679350(v=vs.85).aspx
      # BOOL WINAPI FlushInstructionCache(
      #   _In_ HANDLE  hProcess,
      #   _In_ LPCVOID lpBaseAddress,
      #   _In_ SIZE_T  dwSize)
      attach_function 'FlushInstructionCache', [:handle, :pointer, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679362(v=vs.85).aspx
      # BOOL WINAPI GetThreadContext(
      #   _In_    HANDLE    hThread,
      #   _Inout_ LPCONTEXT lpContext)
      attach_function 'GetThreadContext', [:handle, CONTEXT], :bool

      # TODO LDT_ENTRY Struct https://msdn.microsoft.com/en-us/library/windows/desktop/ms680348(v=vs.85).aspx
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679363(v=vs.85).aspx
      # BOOL WINAPI GetThreadSelectorEntry(
      #   _In_  HANDLE      hThread,
      #   _In_  DWORD       dwSelector,
      #   _Out_ LPLDT_ENTRY lpSelectorEntry)
      attach_function 'GetThreadSelectorEntry', [:handle, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680345(v=vs.85).aspx
      # BOOL WINAPI IsDebuggerPresent(void);
      attach_function 'IsDebuggerPresent', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363362(v=vs.85).aspx
      # void WINAPI OutputDebugString(_In_opt_ LPCTSTR lpOutputString)
      encoded_function 'OutputDebugString', [:string], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680553(v=vs.85).aspx
      # BOOL WINAPI ReadProcessMemory(
      #   _In_  HANDLE  hProcess,
      #   _In_  LPCVOID lpBaseAddress,
      #   _Out_ LPVOID  lpBuffer,
      #   _In_  SIZE_T  nSize,
      #   _Out_ SIZE_T  *lpNumberOfBytesRead)
      attach_function 'ReadProcessMemory', [:handle, :pointer, :pointer, :size_t, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680632(v=vs.85).aspx
      # BOOL WINAPI SetThreadContext(
      #   _In_       HANDLE  hThread,
      #   _In_ const CONTEXT *lpContext)
      attach_function 'SetThreadContext', [:handle, CONTEXT.ptr(:in)], :bool

      # TODO DEBUG_EVENT https://msdn.microsoft.com/en-us/library/windows/desktop/ms679308(v=vs.85).aspx
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681423(v=vs.85).aspx
      # BOOL WINAPI WaitForDebugEvent(
      #   _Out_ LPDEBUG_EVENT lpDebugEvent,
      #   _In_  DWORD         dwMilliseconds)
      attach_function 'WaitForDebugEvent', [:pointer, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681674(v=vs.85).aspx
      # BOOL WINAPI WriteProcessMemory(
      #   _In_  HANDLE  hProcess,
      #   _In_  LPVOID  lpBaseAddress,
      #   _In_  LPCVOID lpBuffer,
      #   _In_  SIZE_T  nSize,
      #   _Out_ SIZE_T  *lpNumberOfBytesWritten)
      attach_function 'WriteProcessMemory', [:handle, :pointer, :pointer, :size_t, :size_t], :bool

      if WindowsVersion >= :vista || WindowsVersion == :xp && WindowsVersion.sp == 1

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679280(v=vs.85).aspx
        # BOOL WINAPI CheckRemoteDebuggerPresent(
        #   _In_    HANDLE hProcess,
        #   _Inout_ PBOOL  pbDebuggerPresent)
        attach_function 'CheckRemoteDebuggerPresent', [:handle, :pointer], :bool

        if WindowsVersion >= :vista

          # TODO WOW64_CONTEXT https://msdn.microsoft.com/en-us/library/windows/desktop/ms681670(v=vs.85).aspx
          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681665(v=vs.85).aspx
          # BOOL WINAPI Wow64GetThreadContext(
          #   _In_    HANDLE         hThread,
          #   _Inout_ PWOW64_CONTEXT lpContext)
          attach_function 'Wow64GetThreadContext', [:handle, :pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681668(v=vs.85).aspx
          # BOOL WINAPI Wow64SetThreadContext(
          #   _In_       HANDLE        hThread,
          #   _In_ const WOW64_CONTEXT *lpContext)
          attach_function 'Wow64SetThreadContext', [:handle, :pointer], :bool

          if WindowsVersion >= 7

            # TODO WOW64_LDT_ENTRY https://msdn.microsoft.com/en-us/library/windows/desktop/dd709485(v=vs.85).aspx
            # https://msdn.microsoft.com/en-us/library/windows/desktop/dd709484(v=vs.85).aspx
            # BOOL Wow64GetThreadSelectorEntry(
            #   _In_  HANDLE           hThread,
            #   _In_  DWORD            dwSelector,
            #   _Out_ PWOW64_LDT_ENTRY lpSelectorEntry)
            attach_function 'Wow64GetThreadSelectorEntry', [:handle, :dword, :pointer], :bool

            if WindowsVersion >= 10

              # https://msdn.microsoft.com/en-us/library/windows/desktop/mt171594(v=vs.85).aspx
              # BOOL WINAPI WaitForDebugEventEx(
              #   _Out_ LPDEBUG_EVENT lpDebugEvent,
              #   _In_  DWORD         dwMilliseconds)
              attach_function 'WaitForDebugEventEx', [:pointer, :dword], :bool

            end
          end
        end
      end
    end
  end
end