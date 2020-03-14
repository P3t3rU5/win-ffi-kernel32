module WinFFI
  module Kernel32
    PSS_CAPTURE_FLAGS = enum :process_snapshot_capture, [
        :CAPTURE_NONE,                             0x00000000,
        :CAPTURE_VA_CLONE,                         0x00000001,
        :CAPTURE_RESERVED_00000002,                0x00000002,
        :CAPTURE_HANDLES,                          0x00000004,
        :CAPTURE_HANDLE_NAME_INFORMATION,          0x00000008,
        :CAPTURE_HANDLE_BASIC_INFORMATION,         0x00000010,
        :CAPTURE_HANDLE_TYPE_SPECIFIC_INFORMATION, 0x00000020,
        :CAPTURE_HANDLE_TRACE,                     0x00000040,
        :CAPTURE_THREADS,                          0x00000080,
        :CAPTURE_THREAD_CONTEXT,                   0x00000100,
        :CAPTURE_THREAD_CONTEXT_EXTENDED,          0x00000200,
        :CAPTURE_RESERVED_00000400,                0x00000400,
        :CAPTURE_VA_SPACE,                         0x00000800,
        :CAPTURE_VA_SPACE_SECTION_INFORMATION,     0x00001000,

        :CREATE_BREAKAWAY_OPTIONAL,                0x04000000,
        :CREATE_BREAKAWAY,                         0x08000000,
        :CREATE_FORCE_BREAKAWAY,                   0x10000000,
        :CREATE_USE_VM_ALLOCATIONS,                0x20000000,
        :CREATE_MEASURE_PERFORMANCE,               0x40000000,
        :CREATE_RELEASE_SECTION,                   0x80000000,
    ]

    define_prefix(:PSS, PSS_CAPTURE_FLAGS)
  end
end