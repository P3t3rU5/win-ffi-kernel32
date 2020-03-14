module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../struct/communication/dcb'
    require_relative '../struct/communication/comstat'
    require_relative '../struct/communication/commtimeouts'
    require_relative '../struct/communication/commconfig'
    require_relative '../struct/communication/commprop'

    require_relative '../struct/synchronization/overlapped'

    require_relative '../enum/communication/event'
    require_relative '../enum/communication/purge_flag'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-buildcommdcba
      # @param [String] lpDef
      # @param [FFI::Pointer] lpDCB
      # @return [true, false]
      def self.BuildCommDCB(lpDef, lpDCB) end
      encoded_function 'BuildCommDCB', [:string, DCB.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-BuildCommDCBAndTimeouts
      # @param [String] lpDef
      # @param [FFI::Pointer] lpDCB
      # @param [FFI::Pointer] lpCommTimeouts
      # @return [true, false]
      def self.BuildCommDCBAndTimeouts(lpDef, lpDCB, lpCommTimeouts) end
      encoded_function 'BuildCommDCBAndTimeouts', [:string, DCB.ptr(:out), COMMTIMEOUTS.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-ClearCommBreak
      # @param [Integer] hFile
      # @return [true, false]
      def self.ClearCommBreak(hFile) end
      attach_function 'ClearCommBreak', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-ClearCommError
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpErrors
      # @param [FFI::Pointer] lpStat
      # @return [true, false]
      def self.ClearCommError(hFile, lpErrors, lpStat) end
      attach_function 'ClearCommError', [:handle, :pointer, COMSTAT.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-CommConfigDialog
      # @param [String] lpszName
      # @param [Integer] hWnd
      # @param [FFI::Pointer] lpCC
      # @return [true, false]
      def self.CommConfigDialog(lpszName, hWnd, lpCC) end
      encoded_function 'CommConfigDialog', [:string, :hwnd, COMMCONFIG.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-EscapeCommFunction
      # @param [Integer] hFile
      # @param [Integer] dwFunc
      # @return [true, false]
      def self.EscapeCommFunction(hFile, dwFunc) end
      attach_function 'EscapeCommFunction', [:handle, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommConfig
      # @param [Integer] hCommDev
      # @param [FFI::Pointer] lpCC
      # @param [FFI::Pointer] lpdwSize
      # @return [true, false]
      def self.GetCommConfig(hCommDev, lpCC, lpdwSize) end
      attach_function 'GetCommConfig', [:handle, COMMCONFIG.ptr(:out), :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommMask
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpEvtMask
      # @return [true, false]
      def self.GetCommMask(hFile, lpEvtMask) end
      attach_function 'GetCommMask', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommModemStatus
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpModemStat
      # @return [true, false]
      def self.GetCommModemStatus(hFile, lpModemStat) end
      attach_function 'GetCommModemStatus', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommProperties
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpCommProp
      # @return [true, false]
      def self.GetCommProperties(hFile, lpCommProp) end
      attach_function 'GetCommProperties', [:handle, COMMPROP.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommState
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpDCB
      # @return [true, false]
      def self.GetCommState(hFile, lpDCB) end
      attach_function 'GetCommState', [:handle, DCB.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetCommTimeouts
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpCommTimeouts
      # @return [true, false]
      def self.GetCommTimeouts(hFile, lpCommTimeouts) end
      attach_function 'GetCommTimeouts', [:handle, COMMTIMEOUTS.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-GetDefaultCommConfig
      # @param [String] lpszName
      # @param [FFI::Pointer] lpCC
      # @param [FFI::Pointer] lpdwSize
      # @return [true, false]
      def self.GetDefaultCommConfig(lpszName, lpCC, lpdwSize) end
      encoded_function 'GetDefaultCommConfig', [:string, COMMCONFIG.ptr(:out), :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-PurgeComm
      # @param [Integer] hFile
      # @param [Integer] dwFlags
      # @return [true, false]
      def self.PurgeComm(hFile, dwFlags) end
      attach_function 'PurgeComm', [:handle, PurgeFlag], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetCommBreak
      # @param [Integer] hFile
      # @return [true, false]
      def self.SetCommBreak(hFile) end
      attach_function 'SetCommBreak', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetCommConfig
      # @param [Integer] hCommDev
      # @param [FFI::Pointer] lpCC
      # @param [Integer] dwSize
      # @return [true, false]
      def self.SetCommConfig(hCommDev, lpCC, dwSize) end
      attach_function 'SetCommConfig', [:handle, COMMCONFIG.ptr(:in), :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetCommMask
      # @param [Integer] hFile
      # @param [Integer] dwEvtMask
      # @return [true, false]
      def self.SetCommMask(hFile, dwEvtMask) end
      attach_function 'SetCommMask', [:handle, Event], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetCommState
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpDCB
      # @return [true, false]
      def self.SetCommState(hFile, lpDCB) end
      attach_function 'SetCommState', [:handle, DCB.ptr(:in)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetCommTimeouts
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpCommTimeouts
      # @return [true, false]
      def self.SetCommTimeouts(hFile, lpCommTimeouts) end
      attach_function 'SetCommTimeouts', [:handle, COMMTIMEOUTS.ptr(:in)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetDefaultCommConfig
      # @param [String] lpszName
      # @param [FFI::Pointer] lpCC
      # @param [Integer] dwSize
      # @return [true, false]
      def self.SetDefaultCommConfig(lpszName, lpCC, dwSize) end
      encoded_function 'SetDefaultCommConfig', [:string, COMMCONFIG.ptr(:in), :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetupComm
      # @param [Integer] hFile
      # @param [Integer] dwInQueue
      # @param [Integer] dwOutQueue
      # @return [true, false]
      def self.SetupComm(hFile, dwInQueue, dwOutQueue) end
      attach_function 'SetupComm', [:handle, :dword, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-TransmitCommChar
      # @param [Integer] hFile
      # @param [String] cChar
      # @return [true, false]
      def self.TransmitCommChar(hFile, cChar) end
      attach_function 'TransmitCommChar', [:handle, :char], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-WaitCommEvent
      # @param [Integer] hFile
      # @param [FFI::Pointer] lpEvtMask
      # @param [FFI::Pointer] lpOverlapped
      # @return [true, false]
      def self.WaitCommEvent(hFile, lpEvtMask, lpOverlapped) end
      attach_function 'WaitCommEvent', [:handle, :pointer, OVERLAPPED.ptr(:in)], :bool
    end
  end
end
