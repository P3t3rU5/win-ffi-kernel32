require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    DebugEventCode = enum :debug_event_code, [
        :EXCEPTION_DEBUG_EVENT,      1,
        :CREATE_THREAD_DEBUG_EVENT,  2,
        :CREATE_PROCESS_DEBUG_EVENT, 3,
        :EXIT_THREAD_DEBUG_EVENT,    4,
        :EXIT_PROCESS_DEBUG_EVENT,   5,
        :LOAD_DLL_DEBUG_EVENT,       6,
        :UNLOAD_DLL_DEBUG_EVENT,     7,
        :OUTPUT_DEBUG_STRING_EVENT,  8,
        :RIP_EVENT,                  9,
    ]
  end
end