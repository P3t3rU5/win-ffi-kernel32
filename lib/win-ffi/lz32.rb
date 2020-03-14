require 'win-ffi/core'
require 'win-ffi/core/lib_base'


module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../win-ffi/kernel32/enum/file_management/open_file_flag'
    require_relative '../win-ffi/kernel32/struct/file_management/of_struct'

    module Lz32
      extend LibBase

      ffi_lib 'lz32'

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-getexpandednamea
      # INT GetExpandedName(_In_  LPTSTR lpszSource, _Out_ LPTSTR lpszBuffer)
      def self.GetExpandedName(lpszSource, lpszBuffer) end
      encoded_function 'GetExpandedName', [:string, :string], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzclose
      # void LZClose(_In_ INT hFile)
      def self.LZClose(hFile) end
      attach_function 'LZClose', [:int], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzcopy
      # LONG LZCopy(_In_ INT hfSource, _In_ INT hfDest)
      def self.LZCopy(hfSource, hfDest) end
      attach_function 'LZCopy', [:int, :int], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzinit
      # INT LZInit(_In_ INT hfSource)
      def self.LZInit(hfSource) end
      attach_function 'LZInit', [:int], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzopenfilea
      # INT LZOpenFile( _In_  LPTSTR     lpFileName, _Out_ LPOFSTRUCT lpReOpenBuf, _In_  WORD       wStyle)
      def self.LZOpenFile(lpFileName, lpReOpenBuf, wStyle) end
      encoded_function 'LZOpenFile', [:string, Kernel32::OFSTRUCT.ptr(:out), Kernel32::OpenFileFlag], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzread
      # INT LZRead(
      #   _In_  INT   hFile,
      #   _Out_ LPSTR lpBuffer,
      #   _In_  INT   cbRead)
      def self.LZRead(hFile, lpBuffer, cbRead) end
      attach_function 'LZRead', [:int, :string, :int], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/lzexpand/nf-lzexpand-lzseek
      # LONG LZSeek(
      #   _In_ INT  hFile,
      #   _In_ LONG lOffset,
      #   _In_ INT  iOrigin)
      def self.LZSeek(hFile, lOffset, iOrigin) end
      attach_function 'LZSeek', [:int, :long, :int], :long

      # Undocumented
      # INT LZStart(VOID)
      def self.LZStart; end
      attach_function 'LZStart', [], :int

      # VOID LZDone(VOID)
      def self.LZDone; end
      attach_function 'LZDone', [], :void

      # LONG CopyLZFile(_In_ INT hfSource, _In_ INT hfDest)
      def self.CopyLZFile(hfSource, hfDest) end
      attach_function 'CopyLZFile', [:int, :int], :long

    end
  end
end