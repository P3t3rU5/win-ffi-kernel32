module WinFFI
  if WINDOWS_VERSION == 7 && WINDOWS_VERSION.sp == 1 ||  WINDOWS_VERSION >= 8
    require_relative '../struct/debug/context'

    require_relative '../enum/avx/context'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getenabledxstatefeatures
      # @return [Integer]
      def self.GetEnabledXStateFeatures; end
      attach_function 'GetEnabledXStateFeatures', [], :dword64

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetXStateFeaturesMask
      # @param [FFI::Pointer] context
      # @param [FFI::Pointer] featureMask
      # @return [true, false]
      def self.GetXStateFeaturesMask(context, featureMask) end
      attach_function 'GetXStateFeaturesMask', [CONTEXT.ptr(:in), :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-InitializeContext
      # @param [FFI::Pointer] buffer
      # @param [Integer] contextFlags
      # @param [FFI::Pointer] context
      # @param [FFI::Pointer] contextLength
      # @return [true, false]
      def self.InitializeContext(buffer, contextFlags, context, contextLength) end
      attach_function 'InitializeContext', [:pointer, Context, CONTEXT.ptr(:out), :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-LocateXStateFeature
      # @param [FFI::Pointer] context
      # @param [Integer] featureId
      # @param [FFI::Pointer] length
      # @return [FFI::Pointer]
      def self.LocateXStateFeature(context, featureId, length); end
      attach_function 'LocateXStateFeature', [CONTEXT.ptr(:in), :dword, :pointer], :pointer
    end
  end
end