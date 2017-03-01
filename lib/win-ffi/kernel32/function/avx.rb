require 'win-ffi/kernel32/struct/debug/context'

require 'win-ffi/kernel32/enum/avx/context'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION == 7 && WINDOWS_VERSION.sp == 1 ||  WINDOWS_VERSION >= 8
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh134235(v=vs.85).aspx
      # DWORD64 WINAPI GetEnabledXStateFeatures(void)
      attach_function 'GetEnabledXStateFeatures', [], :dword64

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh134236(v=vs.85).aspx
      # BOOL WINAPI GetXStateFeaturesMask(_In_  PCONTEXT Context, _Out_ PWORD64  FeatureMask)
      attach_function 'GetXStateFeaturesMask', [CONTEXT, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh134237(v=vs.85).aspx
      # BOOL WINAPI InitializeContext(
      #   _Out_opt_ PVOID    Buffer,
      #   _In_      DWORD    ContextFlags,
      #   _Out_opt_ PCONTEXT *Context,
      #   _Inout_   PWORD    ContextLength)
      attach_function 'InitializeContext', [:pointer, Context, CONTEXT.ptr(:out), :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh134238(v=vs.85).aspx
      # PVOID WINAPI LocateXStateFeature(
      #   _In_      PCONTEXT Context,
      #   _In_      DWORD    FeatureId,
      #   _Out_opt_ PDWORD   Length)
      attach_function 'LocateXStateFeature', [CONTEXT.ptr(:in), :dword, :pointer], :pointer

    end
  end
end