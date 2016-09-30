require 'win-ffi/kernel32/enum/backup/tape_erase_type'
require 'win-ffi/kernel32/enum/backup/tape_position_flag'
require 'win-ffi/kernel32/enum/backup/set_tape_parameter'
require 'win-ffi/kernel32/enum/backup/set_tape_position'
require 'win-ffi/kernel32/enum/backup/tapemark_type'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362509(v=vs.85).aspx
      # BOOL BackupRead(
      #   _In_  HANDLE  hFile,
      #   _Out_ LPBYTE  lpBuffer,
      #   _In_  DWORD   nNumberOfBytesToRead,
      #   _Out_ LPDWORD lpNumberOfBytesRead,
      #   _In_  BOOL    bAbort,
      #   _In_  BOOL    bProcessSecurity,
      #   _Out_ LPVOID  *lpContext)
      attach_function 'BackupRead', [:handle, :pointer, :dword, :pointer, :bool, :bool, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362510(v=vs.85).aspx
      # BOOL BackupSeek(
      #   _In_  HANDLE  hFile,
      #   _In_  DWORD   dwLowBytesToSeek,
      #   _In_  DWORD   dwHighBytesToSeek,
      #   _Out_ LPDWORD lpdwLowByteSeeked,
      #   _Out_ LPDWORD lpdwHighByteSeeked,
      #   _In_  LPVOID  *lpContext)
      attach_function 'BackupSeek', [:handle, :dword, :dword, :pointer, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362511(v=vs.85).aspx
      # BOOL BackupWrite(
      #   _In_  HANDLE  hFile,
      #   _In_  LPBYTE  lpBuffer,
      #   _In_  DWORD   nNumberOfBytesToWrite,
      #   _Out_ LPDWORD lpNumberOfBytesWritten,
      #   _In_  BOOL    bAbort,
      #   _In_  BOOL    bProcessSecurity,
      #   _Out_ LPVOID  *lpContext)
      attach_function 'BackupWrite', [:handle, :pointer, :dword, :pointer, :bool, :bool, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362519(v=vs.85).aspx
      # DWORD CreateTapePartition(
      #   _In_ HANDLE hDevice,
      #   _In_ DWORD  dwPartitionMethod,
      #   _In_ DWORD  dwCount,
      #   _In_ DWORD  dwSize)
      attach_function 'CreateTapePartition', [:handle, :dword, :dword, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362523(v=vs.85).aspx
      # DWORD EraseTape(_In_ HANDLE hDevice,_In_ DWORD  dwEraseType,_In_ BOOL   bImmediate)
      attach_function 'EraseTape', [:handle, TapeEraseType, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362526(v=vs.85).aspx
      # DWORD GetTapeParameters(
      #   _In_  HANDLE  hDevice,
      #   _In_  DWORD   dwOperation,
      #   _Out_ LPDWORD lpdwSize,
      #   _Out_ LPVOID  lpTapeInformation)
      attach_function 'GetTapeParameters', [:handle, :dword, :pointer, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362528(v=vs.85).aspx
      # DWORD GetTapePosition(
      #   _In_  HANDLE  hDevice,
      #   _In_  DWORD   dwPositionType,
      #   _Out_ LPDWORD lpdwPartition,
      #   _Out_ LPDWORD lpdwOffsetLow,
      #   _Out_ LPDWORD lpdwOffsetHigh)
      attach_function 'GetTapePosition', [:handle, TapePositionFlag, :pointer, :pointer, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362530(v=vs.85).aspx
      # DWORD GetTapeStatus(_In_ HANDLE hDevice)
      attach_function 'GetTapeStatus', [:handle], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362532(v=vs.85).aspx
      # DWORD PrepareTape(_In_ HANDLE hDevice, _In_ DWORD  dwOperation, _In_ BOOL   bImmediate)
      attach_function 'PrepareTape', [:handle, :dword, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362534(v=vs.85).aspx
      # DWORD SetTapeParameters(
      #   _In_ HANDLE hDevice,
      #   _In_ DWORD  dwOperation,
      #   _In_ LPVOID lpTapeInformation)
      attach_function 'SetTapeParameters', [:handle, SetTapeParameter, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362536(v=vs.85).aspx
      # DWORD SetTapePosition(
      #   _In_ HANDLE hDevice,
      #   _In_ DWORD  dwPositionMethod,
      #   _In_ DWORD  dwPartition,
      #   _In_ DWORD  dwOffsetLow,
      #   _In_ DWORD  dwOffsetHigh,
      #   _In_ BOOL   bImmediate)
      attach_function 'SetTapePosition', [:handle, SetTapePosition, :dword, :dword, :dword, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa362668(v=vs.85).aspx
      # DWORD WriteTapemark(
      #   _In_ HANDLE hDevice,
      #   _In_ DWORD  dwTapemarkType,
      #   _In_ DWORD  dwTapemarkCount,
      #   _In_ BOOL   bImmediate)
      attach_function 'WriteTapemark', [:handle, TapemarkType, :dword, :bool], :dword


    end
  end
end