module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../../enum/debug/debug_event_code'

    require_relative 'exception_debug_info'
    require_relative 'create_thread_debug_info'
    require_relative 'create_process_debug_info'
    require_relative 'exit_thread_debug_info'
    require_relative 'exit_process_debug_info'
    require_relative 'load_dll_debug_info'
    require_relative 'unload_dll_debug_info'
    require_relative 'output_debug_string_info'
    require_relative 'rip_info'

    module Kernel32
      class DEBUG_EVENT_UNION < FFIAdditions::Struct
        attr_accessor :Exception,
                      :CreateThread,
                      :CreateProcessInfo,
                      :ExitThread,
                      :ExitProcess,
                      :LoadDll,
                      :UnloadDll,
                      :DebugString,
                      :RipInfo

        layout Exception:         EXCEPTION_DEBUG_INFO,
               CreateThread:      CREATE_THREAD_DEBUG_INFO,
               CreateProcessInfo: CREATE_PROCESS_DEBUG_INFO,
               ExitThread:        EXIT_THREAD_DEBUG_INFO,
               ExitProcess:       EXIT_PROCESS_DEBUG_INFO,
               LoadDll:           LOAD_DLL_DEBUG_INFO,
               UnloadDll:         UNLOAD_DLL_DEBUG_INFO,
               DebugString:       OUTPUT_DEBUG_STRING_INFO,
               RipInfo:           RIP_INFO
      end

      # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-debug_event
      class DEBUG_EVENT < FFIAdditions::Struct
        attr_accessor :dwDebugEventCode, :dwProcessId, :dwThreadId, :u

        layout dwDebugEventCode: DebugEventCode,
               dwProcessId:      :dword,
               dwThreadId:       :dword,
               u:                DEBUG_EVENT_UNION
      end
    end
  end
end
