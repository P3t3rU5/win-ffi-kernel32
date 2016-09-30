require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/synchronization/critical_section_debug'

module WinFFI
  module Kernel32
    class CRITICAL_SECTION < FFIAdditions::Struct
      layout DebugInfo: CRITICAL_SECTION_DEBUG,
             LockCount:                  :long,
             RecursionCount:             :long,
             OwningThread:             :handle,
             LockSemaphore:            :handle,
             SpinCount:             :ulong_ptr
    end
  end
end