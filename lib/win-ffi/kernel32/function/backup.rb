module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/backup/tape_erase_type'
    require_relative '../enum/backup/tape_position_flag'
    require_relative '../enum/backup/set_tape_parameter'
    require_relative '../enum/backup/set_tape_position'
    require_relative '../enum/backup/tapemark_type'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-backupread
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nNumberOfBytesToRead
      # @param [FFI::Pointer] lpNumberOfBytesRead
      # @param [true, false] bAbort
      # @param [true, false] bProcessSecurity
      # @param [FFI::Pointer] lpContext
      # @return [true, false]
      def self.BackupRead(
          hFile, lpBuffer, nNumberOfBytesToRead, lpNumberOfBytesRead, bAbort, bProcessSecurity, lpContext) end
      attach_function 'BackupRead', [:handle, :pointer, :dword, :pointer, :bool, :bool, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-BackupSeek
      # @param [Integer] hFile
      # @param [Integer] dwLowBytesToSeek
      # @param [Integer] dwHighBytesToSeek
      # @param [FFI::Pointer] lpdwLowByteSeeked
      # @param [FFI::Pointer] lpdwHighByteSeeked
      # @param [FFI::Pointer] lpContext
      # @return [Pointer]
      def self.BackupSeek(hFile, dwLowBytesToSeek, dwHighBytesToSeek, lpdwLowByteSeeked, lpdwHighByteSeeked, lpContext)
      end
      attach_function 'BackupSeek', [:handle, :dword, :dword, :pointer, :pointer, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-BackupWrite
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] nNumberOfBytesToWrite
      # @param [FFI::Pointer] lpNumberOfBytesWritten
      # @param [true, false] bAbort
      # @param [true, false] bProcessSecurity
      # @param [FFI::Pointer] lpContext
      # @return [true, false]
      def self.BackupWrite(hFile, lpBuffer, nNumberOfBytesToWrite, lpNumberOfBytesWritten, bAbort, bProcessSecurity,
          lpContext) end
      attach_function 'BackupWrite', [:handle, :pointer, :dword, :pointer, :bool, :bool, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-CreateTapePartition
      # @param [Integer] hDevice
      # @param [Integer] dwPartitionMethod
      # @param [Integer] dwCount
      # @param [Integer] dwSize
      # @return [Integer]
      def self.CreateTapePartition(hDevice, dwPartitionMethod, dwCount, dwSize) end
      attach_function 'CreateTapePartition', [:handle, :dword, :dword, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-EraseTape
      # @param [Integer] hDevice
      # @param [Integer] dwEraseType
      # @param [true, false] bImmediate
      # @return [Integer]
      def self.EraseTape(hDevice, dwEraseType, bImmediate) end
      attach_function 'EraseTape', [:handle, TapeEraseType, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetTapeParameters
      # @param [Integer] hDevice
      # @param [Integer] dwOperation
      # @param [FFI::Pointer] lpdwSize
      # @param [FFI::Pointer] lpTapeInformation
      # @return [Integer]
      def self.GetTapeParameters(hDevice, dwOperation, lpdwSize, lpTapeInformation) end
      attach_function 'GetTapeParameters', [:handle, :dword, :pointer, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetTapePosition
      # @param [Integer] hDevice
      # @param [Integer] dwPositionType
      # @param [FFI::Pointer] lpdwPartition
      # @param [FFI::Pointer] lpdwOffsetLow
      # @param [FFI::Pointer] lpdwOffsetHigh
      # @return [Integer]
      def self.GetTapePosition(hDevice, dwPositionType, lpdwPartition, lpdwOffsetLow, lpdwOffsetHigh) end
      attach_function 'GetTapePosition', [:handle, TapePositionFlag, :pointer, :pointer, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetTapeStatus
      # @param [Integer] hDevice
      # @return [Integer]
      def self.GetTapeStatus(hDevice) end
      attach_function 'GetTapeStatus', [:handle], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-PrepareTape
      # DWORD PrepareTape(_In_ HANDLE hDevice, _In_ DWORD  dwOperation, _In_ BOOL   bImmediate)
      # @param [Integer] hDevice
      # @param [Integer] dwOperation
      # @param [true, false] bImmediate
      # @return [Integer]
      def self.PrepareTape(hDevice, dwOperation, bImmediate) end
      attach_function 'PrepareTape', [:handle, :dword, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetTapeParameters
      # @param [Integer] hDevice
      # @param [Integer] dwOperation
      # @param [FFI::Pointer] lpTapeInformation
      # @return [Integer]
      def self.SetTapeParameters(hDevice, dwOperation, lpTapeInformation) end
      attach_function 'SetTapeParameters', [:handle, SetTapeParameter, :pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetTapePosition
      # @param [Integer] hDevice
      # @param [Integer] dwPositionMethod
      # @param [Integer] dwPartition
      # @param [Integer] dwOffsetLow
      # @param [Integer] dwOffsetHigh
      # @param [true, false] bImmediate
      # @return [Integer]
      def self.SetTapePosition(hDevice, dwPositionMethod, dwPartition, dwOffsetLow, dwOffsetHigh, bImmediate) end
      attach_function 'SetTapePosition', [:handle, SetTapePosition, :dword, :dword, :dword, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-WriteTapemark
      # @param [Integer] hDevice
      # @param [Integer] dwTapemarkType
      # @param [Integer] dwTapemarkCount
      # @param [true, false] bImmediate
      # @return [Integer]
      def self.WriteTapemark(hDevice, dwTapemarkType, dwTapemarkCount, bImmediate) end
      attach_function 'WriteTapemark', [:handle, TapemarkType, :dword, :bool], :dword
    end
  end
end
