module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/error/format_message_flag'
    require_relative '../enum/set_error_mode_flags'

    require_relative '../struct/error/exception_record'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679277
      # @param [Integer] dwFreq
      # @param [Integer] dwDuration
      # @return [true, false]
      def self.Beep(dwFreq, dwDuration) end
      attach_function 'Beep', [:ulong, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb204633
      # @param [Integer] framesToSkip
      # @param [Integer] framesToCapture
      # @param [FFI::Pointer] backTrace
      # @param [FFI::Pointer] backTraceHash
      # @return [Integer]
      def self.RtlCaptureStackBackTrace(framesToSkip, framesToCapture, backTrace, backTraceHash) end
      attach_function 'RtlCaptureStackBackTrace', [:ulong, :ulong, :pointer, :pointer], :ushort

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679336
      # void FatalAppExit( _In_ UINT    uAction, _In_ LPCTSTR lpMessageText)
      # @param [Integer] uAction
      # @param [String] lpMessageText
      # @return [nil]
      def self.FatalAppExit(uAction, lpMessageText) end
      encoded_function 'FatalAppExit', [:uint, :string], :void

      # TODO LANGID
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679351
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpSource
      # @param [Integer] dwMessageId
      # @param [Integer] dwLanguageId
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nSize
      # @param [FFI::Pointer] arguments
      # @return [Integer]
      def self.FormatMessage(dwFlags, lpSource, dwMessageId, dwLanguageId, lpBuffer, nSize, arguments) end
      encoded_function 'FormatMessage',
                       [FormatMessageFlag, :pointer, :dword, :dword, :pointer, :dword, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679360
      # @return [Integer]
      def self.GetLastError; end
      attach_function 'GetLastError', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680609
      # @param [FFI::Pointer] targetFrame
      # @param [FFI::Pointer] targetIp
      # @param [FFI::Pointer] exceptionRecord
      # @param [FFI::Pointer] returnValue
      # @return [nil]
      def self.RtlUnwind(targetFrame, targetIp, exceptionRecord, returnValue) end
      attach_function 'RtlUnwind', [:pointer, :pointer, EXCEPTION_RECORD.ptr(:in), :pointer], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680627
      # @param [Integer] dwErrCode
      # @return [nil]
      def self.SetLastError(dwErrCode) end
      attach_function 'SetLastError', [:dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680621
      # @param [Integer] uMode
      # @return [Integer]
      def self.SetErrorMode(uMode) end
      attach_function 'SetErrorMode', [SetErrorModeFlags], :uint

      if WinFFI.x64?
        # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-rtllookupfunctionentry
        # @param [Integer] controlPc
        # @param [FFI::Pointer] imageBase
        # @param [FFI::Pointer] targetGp
        # @return [FFI::Pointer]
        def self.RtlLookupFunctionEntry(controlPc, imageBase, targetGp) end
        attach_function 'RtlLookupFunctionEntry', [:ulong_long, :pointer, :pointer], :pointer

        # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-rtlpctofileheader
        # @param [FFI::Pointer] pcValue
        # @param [FFI::Pointer] baseOfImage
        # @return [FFI::Pointer]
        def self.RtlPcToFileHeader(pcValue, baseOfImage) end
        attach_function 'RtlPcToFileHeader', [:pointer, :pointer], :pointer
      end

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679355
        # @return [Integer]
        def self.GetErrorMode; end
        attach_function 'GetErrorMode', [], :uint

        if WINDOWS_VERSION >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd553629
          # @return [Integer]
          def self.GetThreadErrorMode; end
          attach_function 'GetThreadErrorMode', [], :dword
        end
      end
    end
  end
end
