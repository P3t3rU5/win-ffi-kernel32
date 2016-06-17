require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/debug/m128a'
require 'win-ffi/kernel32/struct/debug/xsave_format'

module WinFFI
  module Kernel32
    class CONTEXT_STRUCT < FFIStruct
      layout :Header,  [M128A, 2],
             :Legacy,  [M128A, 8],
             :Xmm0,    M128A,
             :Xmm1,    M128A,
             :Xmm2,    M128A,
             :Xmm3,    M128A,
             :Xmm4,    M128A,
             :Xmm5,    M128A,
             :Xmm6,    M128A,
             :Xmm7,    M128A,
             :Xmm8,    M128A,
             :Xmm9,    M128A,
             :Xmm10,   M128A,
             :Xmm11,   M128A,
             :Xmm12,   M128A,
             :Xmm13,   M128A,
             :Xmm14,   M128A,
             :Xmm15,   M128A
    end

    class CONTEXT_UNION < FFI::Union
      layout :FltDave, XSAVE_FORMAT,
             :u,       CONTEXT_STRUCT
    end

    class CONTEXT < FFIStruct
      layout :P1Home, :dword64,
             :P2Home, :dword64,
             :P3Home, :dword64,
             :P4Home, :dword64,
             :P5Home, :dword64,
             :P6Home, :dword64,

             :ContextFlags, :dword,
             :MxCsr,        :dword,

             :SegCs,  :word,
             :SegDs,  :word,
             :SegEs,  :word,
             :SegFs,  :word,
             :SegGs,  :word,
             :SegSs,  :word,
             :EFlags, :dword,

             :Dr0, :dword64,
             :Dr1, :dword64,
             :Dr2, :dword64,
             :Dr3, :dword64,
             :Dr6, :dword64,
             :Dr7, :dword64,

             :Rax, :dword64,
             :Rcx, :dword64,
             :Rdx, :dword64,
             :Rbx, :dword64,
             :Rsp, :dword64,
             :Rbp, :dword64,
             :Rsi, :dword64,
             :Rdi, :dword64,
             :R8,  :dword64,
             :R9,  :dword64,
             :R10, :dword64,
             :R11, :dword64,
             :R12, :dword64,
             :R13, :dword64,
             :R14, :dword64,
             :R15, :dword64,

             :Rip, :dword64,

             :u,   CONTEXT_UNION,
             :VectorRegister, [M128A, 26],
             :VectorControl,  :dword64,

             :DebugControl,         :dword64,
             :LastBranchToRip,      :dword64,
             :LastBranchFromRip,    :dword64,
             :LastExceptionToRip,   :dword64,
             :LastExceptionFromRip, :dword64
    end
  end
end