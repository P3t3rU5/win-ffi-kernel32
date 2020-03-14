require_relative 'm128a'
require_relative 'xsave_format'

module WinFFI
  module Kernel32
    class CONTEXT_STRUCT < FFIAdditions::Struct
      attr_accessor :Header,
                    :Legacy,
                    :Xmm0,
                    :Xmm1,
                    :Xmm2,
                    :Xmm3,
                    :Xmm4,
                    :Xmm5,
                    :Xmm6,
                    :Xmm7,
                    :Xmm8,
                    :Xmm9,
                    :Xmm10,
                    :Xmm11,
                    :Xmm12,
                    :Xmm13,
                    :Xmm14,
                    :Xmm15

      layout Header: [M128A, 2],
             Legacy: [M128A, 8],
             Xmm0:   M128A,
             Xmm1:   M128A,
             Xmm2:   M128A,
             Xmm3:   M128A,
             Xmm4:   M128A,
             Xmm5:   M128A,
             Xmm6:   M128A,
             Xmm7:   M128A,
             Xmm8:   M128A,
             Xmm9:   M128A,
             Xmm10:  M128A,
             Xmm11:  M128A,
             Xmm12:  M128A,
             Xmm13:  M128A,
             Xmm14:  M128A,
             Xmm15:  M128A
    end

    class CONTEXT_UNION < FFIAdditions::Union
      attr_accessor :FltDave, :u

      layout FltDave: XSAVE_FORMAT,
             u:       CONTEXT_STRUCT
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-context
    class CONTEXT < FFIAdditions::Struct
      attr_accessor :P1Home,
                    :P2Home,
                    :P3Home,
                    :P4Home,
                    :P5Home,
                    :P6Home,
                    :ContextFlags,
                    :MxCsr,
                    :SegCs,
                    :SegDs,
                    :SegEs,
                    :SegFs,
                    :SegGs,
                    :SegSs,
                    :EFlags,
                    :Dr0,
                    :Dr1,
                    :Dr2,
                    :Dr3,
                    :Dr6,
                    :Dr7,
                    :Rax,
                    :Rcx,
                    :Rdx,
                    :Rbx,
                    :Rsp,
                    :Rbp,
                    :Rsi,
                    :Rdi,
                    :R8,
                    :R9,
                    :R10,
                    :R11,
                    :R12,
                    :R13,
                    :R14,
                    :R15,
                    :Rip,
                    :u,
                    :VectorRegister,
                    :VectorControl,
                    :DebugControl,
                    :LastBranchToRip,
                    :LastBranchFromRip,
                    :LastExceptionToRip,
                    :LastExceptionFromRip,

      layout P1Home:               :dword64,
             P2Home:               :dword64,
             P3Home:               :dword64,
             P4Home:               :dword64,
             P5Home:               :dword64,
             P6Home:               :dword64,

             ContextFlags:         :dword,
             MxCsr:                :dword,

             SegCs:                :word,
             SegDs:                :word,
             SegEs:                :word,
             SegFs:                :word,
             SegGs:                :word,
             SegSs:                :word,
             EFlags:               :dword,

             Dr0:                  :dword64,
             Dr1:                  :dword64,
             Dr2:                  :dword64,
             Dr3:                  :dword64,
             Dr6:                  :dword64,
             Dr7:                  :dword64,

             Rax:                  :dword64,
             Rcx:                  :dword64,
             Rdx:                  :dword64,
             Rbx:                  :dword64,
             Rsp:                  :dword64,
             Rbp:                  :dword64,
             Rsi:                  :dword64,
             Rdi:                  :dword64,
             R8:                   :dword64,
             R9:                   :dword64,
             R10:                  :dword64,
             R11:                  :dword64,
             R12:                  :dword64,
             R13:                  :dword64,
             R14:                  :dword64,
             R15:                  :dword64,

             Rip:                  :dword64,

             u:                    CONTEXT_UNION,
             VectorRegister:       [M128A, 26],
             VectorControl:        :dword64,

             DebugControl:         :dword64,
             LastBranchToRip:      :dword64,
             LastBranchFromRip:    :dword64,
             LastExceptionToRip:   :dword64,
             LastExceptionFromRip: :dword64
    end
  end
end