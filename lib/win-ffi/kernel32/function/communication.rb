require 'win-ffi/kernel32/struct/communication/dcb'
require 'win-ffi/kernel32/struct/communication/comstat'
require 'win-ffi/kernel32/struct/communication/commtimeouts'
require 'win-ffi/kernel32/struct/communication/commconfig'
require 'win-ffi/kernel32/struct/communication/commprop'

require 'win-ffi/kernel32/struct/synchronization/overlapped'

require 'win-ffi/kernel32/enum/communication/event'
require 'win-ffi/kernel32/enum/communication/purge_flag'


module WinFFI
  module Kernel32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363143(v=vs.85).aspx
      # BOOL WINAPI BuildCommDCB(_In_  LPCTSTR lpDef, _Out_ LPDCB   lpDCB)
      encoded_function 'BuildCommDCB', [:string, DCB.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363145(v=vs.85).aspx
      # BOOL WINAPI BuildCommDCBAndTimeouts(
      #   _In_  LPCTSTR        lpDef,
      #   _Out_ LPDCB          lpDCB,
      #   _Out_ LPCOMMTIMEOUTS lpCommTimeouts)
      encoded_function 'BuildCommDCBAndTimeouts', [:string, DCB.ptr(:out), COMMTIMEOUTS.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363179(v=vs.85).aspx
      # BOOL WINAPI ClearCommBreak(_In_ HANDLE hFile)
      attach_function 'ClearCommBreak', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363180(v=vs.85).aspx
      # BOOL WINAPI ClearCommError(
      #   _In_      HANDLE    hFile,
      #   _Out_opt_ LPDWORD   lpErrors,
      #   _Out_opt_ LPCOMSTAT lpStat)
      attach_function 'ClearCommError', [:handle, :pointer, COMSTAT.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363187(v=vs.85).aspx
      # BOOL WINAPI CommConfigDialog(
      #   _In_    LPCTSTR      lpszName,
      #   _In_    HWND         hWnd,
      #   _Inout_ LPCOMMCONFIG lpCC)
      encoded_function 'CommConfigDialog', [:string, :hwnd, COMMCONFIG.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363254(v=vs.85).aspx
      # BOOL WINAPI EscapeCommFunction(_In_ HANDLE hFile, _In_ DWORD  dwFunc)
      attach_function 'EscapeCommFunction', [:handle, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363256(v=vs.85).aspx
      # BOOL WINAPI GetCommConfig(
      #   _In_    HANDLE       hCommDev,
      #   _Out_   LPCOMMCONFIG lpCC,
      #   _Inout_ LPDWORD      lpdwSize)
      attach_function 'GetCommConfig', [:handle, COMMCONFIG.ptr(:out), :pointer], :bool

      # BOOL WINAPI GetCommMask(_In_  HANDLE  hFile, _Out_ LPDWORD lpEvtMask)
      attach_function 'GetCommMask', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363258(v=vs.85).aspx
      # BOOL WINAPI GetCommModemStatus(_In_  HANDLE  hFile, _Out_ LPDWORD lpModemStat)
      attach_function 'GetCommModemStatus', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363259(v=vs.85).aspx
      # BOOL WINAPI GetCommProperties(_In_  HANDLE     hFile, _Out_ LPCOMMPROP lpCommProp)
      attach_function 'GetCommProperties', [:handle, COMMPROP.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363260(v=vs.85).aspx
      # BOOL WINAPI GetCommState(_In_ HANDLE hFile, _Inout_ LPDCB  lpDCB)
      attach_function 'GetCommState', [:handle, DCB.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363261(v=vs.85).aspx
      # BOOL WINAPI GetCommTimeouts(_In_  HANDLE hFile, _Out_ LPCOMMTIMEOUTS lpCommTimeouts)
      attach_function 'GetCommTimeouts', [:handle, COMMTIMEOUTS.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363262(v=vs.85).aspx
      # BOOL WINAPI GetDefaultCommConfig(
      #   _In_    LPCTSTR      lpszName,
      #   _Out_   LPCOMMCONFIG lpCC,
      #   _Inout_ LPDWORD      lpdwSize)
      encoded_function 'GetDefaultCommConfig', [:string, COMMCONFIG.ptr(:out), :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363428(v=vs.85).aspx
      # BOOL WINAPI PurgeComm(_In_ HANDLE hFile, _In_ DWORD  dwFlags)
      attach_function 'PurgeComm', [:handle, PurgeFlag], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363433(v=vs.85).aspx
      # BOOL WINAPI SetCommBreak(_In_ HANDLE hFile)
      attach_function 'SetCommBreak', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363434(v=vs.85).aspx
      # BOOL WINAPI SetCommConfig(
      #   _In_ HANDLE       hCommDev,
      #   _In_ LPCOMMCONFIG lpCC,
      #   _In_ DWORD        dwSize)
      attach_function 'SetCommConfig', [:handle, COMMCONFIG.ptr(:in), :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363435(v=vs.85).aspx
      # BOOL WINAPI SetCommMask(_In_ HANDLE hFile, _In_ DWORD  dwEvtMask)
      attach_function 'SetCommMask', [:handle, Event], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363436(v=vs.85).aspx
      # BOOL WINAPI SetCommState(_In_ HANDLE hFile, _In_ LPDCB  lpDCB)
      attach_function 'SetCommState', [:handle, DCB.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363437(v=vs.85).aspx
      # BOOL WINAPI SetCommTimeouts(_In_ HANDLE hFile, _In_ LPCOMMTIMEOUTS lpCommTimeouts)
      attach_function 'SetCommTimeouts', [:handle, COMMTIMEOUTS.ptr(:in)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363438(v=vs.85).aspx
      # BOOL WINAPI SetDefaultCommConfig(
      #   _In_ LPCTSTR      lpszName,
      #   _In_ LPCOMMCONFIG lpCC,
      #   _In_ DWORD        dwSize)
      encoded_function 'SetDefaultCommConfig', [:string, COMMCONFIG.ptr(:in), :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363439(v=vs.85).aspx
      # BOOL WINAPI SetupComm(
      #   _In_ HANDLE hFile,
      #   _In_ DWORD  dwInQueue,
      #   _In_ DWORD  dwOutQueue)
      attach_function 'SetupComm', [:handle, :dword, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363473(v=vs.85).aspx
      # BOOL WINAPI TransmitCommChar(_In_ HANDLE hFile, _In_ char   cChar)
      attach_function 'TransmitCommChar', [:handle, :char], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363479(v=vs.85).aspx
      # BOOL WINAPI WaitCommEvent(
      #   _In_  HANDLE       hFile,
      #   _Out_ LPDWORD      lpEvtMask,
      #   _In_  LPOVERLAPPED lpOverlapped)
      attach_function 'WaitCommEvent', [:handle, :pointer, OVERLAPPED.ptr(:in)], :bool

    end
  end
end