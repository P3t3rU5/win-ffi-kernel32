require 'win-ffi/core'
require 'win-ffi/core/lib_base'

require 'win-ffi/kernel32/enum/file_management/open_file_flag'
require 'win-ffi/kernel32/struct/file_management/of_struct'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Lz32
      extend LibBase

      ffi_lib 'lz32'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa364941(v=vs.85).aspx
      # INT WINAPI GetExpandedName(_In_  LPTSTR lpszSource, _Out_ LPTSTR lpszBuffer)
      encoded_function 'GetExpandedName', [:string, :string], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365221(v=vs.85).aspx
      # void APIENTRY LZClose(_In_ INT hFile)
      attach_function 'LZClose', [:int], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365223(v=vs.85).aspx
      # LONG WINAPI LZCopy(_In_ INT hfSource, _In_ INT hfDest)
      attach_function 'LZCopy', [:int, :int], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365224(v=vs.85).aspx
      # INT WINAPI LZInit(_In_ INT hfSource)
      attach_function 'LZInit', [:int], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365225(v=vs.85).aspx
      # INT WINAPI LZOpenFile(
      #   _In_  LPTSTR     lpFileName,
      #   _Out_ LPOFSTRUCT lpReOpenBuf,
      #   _In_  WORD       wStyle)
      encoded_function 'LZOpenFile', [:string, Kernel32::OFSTRUCT.ptr(:out), Kernel32::OpenFileFlag], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365226(v=vs.85).aspx
      # INT WINAPI LZRead(
      #   _In_  INT   hFile,
      #   _Out_ LPSTR lpBuffer,
      #   _In_  INT   cbRead)
      attach_function 'LZRead', [:int, :string, :int], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365227(v=vs.85).aspx
      # LONG WINAPI LZSeek(
      #   _In_ INT  hFile,
      #   _In_ LONG lOffset,
      #   _In_ INT  iOrigin)
      attach_function 'LZSeek', [:int, :long, :int], :long

      # Undocumented
      # INT APIENTRY LZStart(VOID)
      attach_function 'LZStart', [], :int

      # VOID APIENTRY LZDone(VOID)
      attach_function 'LZDone', [], :void

      # LONG APIENTRY CopyLZFile(_In_ INT hfSource, _In_ INT hfDest)
      attach_function 'CopyLZFile', [:int, :int], :long

    end
  end
end