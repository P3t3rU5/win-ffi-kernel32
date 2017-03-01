require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/kernel32/enum/debug/debug_event_code'

    require 'win-ffi/kernel32/struct/debug/exception_debug_info'
    require 'win-ffi/kernel32/struct/debug/create_thread_debug_info'
    require 'win-ffi/kernel32/struct/debug/create_process_debug_info'
    require 'win-ffi/kernel32/struct/debug/exit_thread_debug_info'
    require 'win-ffi/kernel32/struct/debug/exit_process_debug_info'
    require 'win-ffi/kernel32/struct/debug/load_dll_debug_info'
    require 'win-ffi/kernel32/struct/debug/unload_dll_debug_info'
    require 'win-ffi/kernel32/struct/debug/output_debug_string_info'
    require 'win-ffi/kernel32/struct/debug/rip_info'
    module Kernel32
      class DEBUG_EVENT_UNION < FFIAdditions::Struct
        layout Exception:              EXCEPTION_DEBUG_INFO,
               CreateThread:       CREATE_THREAD_DEBUG_INFO,
               CreateProcessInfo: CREATE_PROCESS_DEBUG_INFO,
               ExitThread:           EXIT_THREAD_DEBUG_INFO,
               ExitProcess:         EXIT_PROCESS_DEBUG_INFO,
               LoadDll:                 LOAD_DLL_DEBUG_INFO,
               UnloadDll:             UNLOAD_DLL_DEBUG_INFO,
               DebugString:        OUTPUT_DEBUG_STRING_INFO,
               RipInfo:                            RIP_INFO
      end

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679308
      class DEBUG_EVENT < FFIAdditions::Struct
        layout dwDebugEventCode: DebugEventCode,
               dwProcessId:              :dword,
               dwThreadId:               :dword,
               u:             DEBUG_EVENT_UNION
      end
    end
  end
end
