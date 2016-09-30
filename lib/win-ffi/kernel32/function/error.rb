require 'win-ffi/kernel32/enum/error/format_message_flag'
require 'win-ffi/kernel32/enum/set_error_mode_flags'
require 'win-ffi/kernel32/struct/error/exception_record'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679277(v=vs.85).aspx
      # BOOL WINAPI Beep(
      #   _In_  DWORD dwFreq,
      #   _In_  DWORD dwDuration )
      attach_function 'Beep', [:ulong, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/bb204633(v=vs.85).aspx
      # USHORT WINAPI CaptureStackBackTrace(
      #   _In_      ULONG  FramesToSkip,
      #   _In_      ULONG  FramesToCapture,
      #   _Out_     PVOID  *BackTrace,
      #   _Out_opt_ PULONG BackTraceHash)
      attach_function 'RtlCaptureStackBackTrace', [:ulong, :ulong, :pointer, :pointer], :ushort

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679336(v=vs.85).aspx
      # void WINAPI FatalAppExit(
      #   _In_ UINT    uAction,
      #   _In_ LPCTSTR lpMessageText)
      encoded_function 'FatalAppExit', [:uint, :string], :void

      # TODO LANGID
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679351(v=vs.85).aspx
      # DWORD WINAPI FormatMessage(
      #   _In_      DWORD dwFlags,
      #   _In_opt_  LPCVOID lpSource,
      #   _In_      DWORD dwMessageId,
      #   _In_      DWORD dwLanguageId,
      #   _Out_     LPTSTR lpBuffer,
      #   _In_      DWORD nSize,
      #   _In_opt_  va_list *Arguments )
      encoded_function 'FormatMessage',
                       [FormatMessageFlag, :pointer, :dword, :dword, :pointer, :dword, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679360(v=vs.85).aspx
      # DWORD WINAPI GetLastError(void)
      attach_function 'GetLastError', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680609(v=vs.85).aspx
      # void WINAPI RtlUnwind(
      #   _In_opt_ PVOID             TargetFrame,
      #   _In_opt_ PVOID             TargetIp,
      #   _In_opt_ PEXCEPTION_RECORD ExceptionRecord,
      #   _In_     PVOID             ReturnValue)
      attach_function 'RtlUnwind', [:pointer, :pointer, EXCEPTION_RECORD.ptr(:in), :pointer], :void

      if Architecture == 'x64-mingw32'

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680597(v=vs.85).aspx
        # PVOID WINAPI RtlLookupFunctionEntry(
        #   _In_  ULONGLONG  ControlPc,
        #   _Out_ PULONGLONG ImageBase,
        #   _Out_ PULONGLONG TargetGp)
        attach_function 'RtlLookupFunctionEntry', [:ulong_long, :pointer, :pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms680603(v=vs.85).aspx
        # PVOID WINAPI RtlPcToFileHeader(
        #   _In_  PVOID PcValue,
        #   _Out_ PVOID *BaseOfImage)
        attach_function 'RtlPcToFileHeader', [:pointer, :pointer], :pointer

      end

      if WindowsVersion >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms679355(v=vs.85).aspx
        # UINT WINAPI GetErrorMode(void)
        attach_function 'GetErrorMode', [], :uint

        if WindowsVersion >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd553629(v=vs.85).aspx
          # DWORD GetThreadErrorMode(void)
          attach_function 'GetThreadErrorMode', [], :dword
        end
      end
    end

    #xp

    #void WINAPI SetLastError( _In_  DWORD dwErrCode )
    attach_function 'SetLastError', [:dword], :void

    #UINT WINAPI SetErrorMode( _In_  UINT uMode )
    attach_function 'SetErrorMode', [SetErrorModeFlags], :int
  end
end
