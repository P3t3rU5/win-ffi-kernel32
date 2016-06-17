require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    buffer = [
        :STATUS_WAIT_0,                     0x00000000,
        :STATUS_ABANDONED_WAIT_0,           0x00000080,
        :STATUS_USER_APC,                   0x000000C0,
        :STATUS_TIMEOUT,                    0x00000102,
        :STATUS_PENDING,                    0x00000103,
        :DBG_EXCEPTION_HANDLED,             0x00010001,
        :DBG_CONTINUE,                      0x00010002,
        :STATUS_SEGMENT_NOTIFICATION,       0x40000005,
        :STATUS_FATAL_APP_EXIT,             0x40000015,
        :DBG_REPLY_LATER,                   0x40010001,
        :DBG_TERMINATE_THREAD,              0x40010003,
        :DBG_TERMINATE_PROCESS,             0x40010004,
        :DBG_CONTROL_C,                     0x40010005,
        :DBG_PRINTEXCEPTION_C,              0x40010006,
        :DBG_RIPEXCEPTION,                  0x40010007,
        :DBG_CONTROL_BREAK,                 0x40010008,
        :DBG_COMMAND_EXCEPTION,             0x40010009,
        :DBG_PRINTEXCEPTION_WIDE_C,         0x4001000A,
        :STATUS_GUARD_PAGE_VIOLATION,       0x80000001,
        :STATUS_DATATYPE_MISALIGNMENT,      0x80000002,
        :STATUS_BREAKPOINT,                 0x80000003,
        :STATUS_SINGLE_STEP,                0x80000004,
        :STATUS_LONGJUMP,                   0x80000026,
        :STATUS_UNWIND_CONSOLIDATE,         0x80000029,
        :DBG_EXCEPTION_NOT_HANDLED,         0x80010001,
        :STATUS_ACCESS_VIOLATION,           0xC0000005,
        :STATUS_IN_PAGE_ERROR,              0xC0000006,
        :STATUS_INVALID_HANDLE,             0xC0000008,
        :STATUS_INVALID_PARAMETER,          0xC000000D,
        :STATUS_NO_MEMORY,                  0xC0000017,
        :STATUS_ILLEGAL_INSTRUCTION,        0xC000001D,
        :STATUS_NONCONTINUABLE_EXCEPTION,   0xC0000025,
        :STATUS_INVALID_DISPOSITION,        0xC0000026,
        :STATUS_ARRAY_BOUNDS_EXCEEDED,      0xC000008C,
        :STATUS_FLOAT_DENORMAL_OPERAND,     0xC000008D,
        :STATUS_FLOAT_DIVIDE_BY_ZERO,       0xC000008E,
        :STATUS_FLOAT_INEXACT_RESULT,       0xC000008F,
        :STATUS_FLOAT_INVALID_OPERATION,    0xC0000090,
        :STATUS_FLOAT_OVERFLOW,             0xC0000091,
        :STATUS_FLOAT_STACK_CHECK,          0xC0000092,
        :STATUS_FLOAT_UNDERFLOW,            0xC0000093,
        :STATUS_INTEGER_DIVIDE_BY_ZERO,     0xC0000094,
        :STATUS_INTEGER_OVERFLOW,           0xC0000095,
        :STATUS_PRIVILEGED_INSTRUCTION,     0xC0000096,
        :STATUS_STACK_OVERFLOW,             0xC00000FD,
        :STATUS_DLL_NOT_FOUND,              0xC0000135,
        :STATUS_ORDINAL_NOT_FOUND,          0xC0000138,
        :STATUS_ENTRYPOINT_NOT_FOUND,       0xC0000139,
        :STATUS_CONTROL_C_EXIT,             0xC000013A,
        :STATUS_DLL_INIT_FAILED,            0xC0000142,
        :STATUS_FLOAT_MULTIPLE_FAULTS,      0xC00002B4,
        :STATUS_FLOAT_MULTIPLE_TRAPS,       0xC00002B5,
        :STATUS_REG_NAT_CONSUMPTION,        0xC00002C9,
        :STATUS_HEAP_CORRUPTION,            0xC0000374,
        :STATUS_STACK_BUFFER_OVERRUN,       0xC0000409,
        :STATUS_INVALID_CRUNTIME_PARAMETER, 0xC0000417,
        :STATUS_ASSERTION_FAILURE,          0xC0000420,
    ]

    if WindowsVersion >= :xp
      buffer += [
          :STATUS_SXS_EARLY_DEACTIVATION,   0xC015000F,
          :STATUS_SXS_INVALID_DEACTIVATION, 0xC0150010,
      ]
    end

    Status = enum :status, buffer
  end
end