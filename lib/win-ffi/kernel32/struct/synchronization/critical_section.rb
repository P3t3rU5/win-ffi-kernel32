require_relative 'critical_section_debug'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/sync/using-critical-section-objects
    class CRITICAL_SECTION < FFIAdditions::Struct
      attr_accessor :DebugInfo,
                    :LockCount,
                    :RecursionCount,
                    :OwningThread,
                    :LockSemaphore,
                    :SpinCount

      layout DebugInfo:      CRITICAL_SECTION_DEBUG,
             LockCount:      :long,
             RecursionCount: :long,
             OwningThread:   :handle,
             LockSemaphore:  :handle,
             SpinCount:      :ulong_ptr
    end
  end
end