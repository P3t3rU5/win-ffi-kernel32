require 'win-ffi/core/struct/security_attributes'

require_relative '../enum/pipe/named_pipe_wait'
require_relative '../struct/synchronization/overlapped'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-callnamedpipea
    # BOOL CallNamedPipe(
    #   _In_  LPCTSTR lpNamedPipeName,
    #   _In_  LPVOID  lpInBuffer,
    #   _In_  DWORD   nInBufferSize,
    #   _Out_ LPVOID  lpOutBuffer,
    #   _In_  DWORD   nOutBufferSize,
    #   _Out_ LPDWORD lpBytesRead,
    #   _In_  DWORD   nTimeOut)
    def self.CallNamedPipe(lpNamedPipeName, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead,
        nTimeOut) end
    encoded_function 'CallNamedPipe', [:string, :pointer, :dword, :pointer, :dword, :pointer, NamedPipeWait], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365146
    # BOOL ConnectNamedPipe( _In_        HANDLE       hNamedPipe, _Inout_opt_ LPOVERLAPPED lpOverlapped)
    def self.ConnectNamedPipe(hNamedPipe, lpOverlapped) end
    attach_function 'ConnectNamedPipe', [:handle, OVERLAPPED.ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createnamedpipea
    # HANDLE CreateNamedPipe(
    #   _In_     LPCTSTR               lpName,
    #   _In_     DWORD                 dwOpenMode,
    #   _In_     DWORD                 dwPipeMode,
    #   _In_     DWORD                 nMaxInstances,
    #   _In_     DWORD                 nOutBufferSize,
    #   _In_     DWORD                 nInBufferSize,
    #   _In_     DWORD                 nDefaultTimeOut,
    #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
    def self.CreateNamedPipe(lpName, dwOpenMode, dwPipeMode, nMaxInstances, nOutBufferSize, nInBufferSize,
        nDefaultTimeOut, lpSecurityAttributes) end
    encoded_function 'CreateNamedPipe',
                     [:string, :dword, :dword, :dword, :dword, :dword, :dword, SECURITY_ATTRIBUTES.ptr(:in)], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365152
    # BOOL CreatePipe(
    #   _Out_    PHANDLE               hReadPipe,
    #   _Out_    PHANDLE               hWritePipe,
    #   _In_opt_ LPSECURITY_ATTRIBUTES lpPipeAttributes,
    #   _In_     DWORD                 nSize)
    def self.CreatePipe(hReadPipe, hWritePipe, lpPipeAttributes, nSize) end
    attach_function 'CreatePipe', [:pointer, :pointer, SECURITY_ATTRIBUTES.ptr(:in), :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365166
    # BOOL DisconnectNamedPipe(_In_ HANDLE hNamedPipe)
    def self.DisconnectNamedPipe(hNamedPipe) end
    attach_function 'DisconnectNamedPipe', [:handle], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipehandlestatea
    # BOOL GetNamedPipeHandleState(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPDWORD lpState,
    #   _Out_opt_ LPDWORD lpCurInstances,
    #   _Out_opt_ LPDWORD lpMaxCollectionCount,
    #   _Out_opt_ LPDWORD lpCollectDataTimeout,
    #   _Out_opt_ LPTSTR  lpUserName,
    #   _In_      DWORD   nMaxUserNameSize)
    def self.GetNamedPipeHandleState(hNamedPipe, lpState, lpCurInstances, lpMaxCollectionCount, lpCollectDataTimeout,
        lpUserName, nMaxUserNameSize) end
    encoded_function 'GetNamedPipeHandleState',
                     [:handle, :pointer, :pointer, :pointer, :pointer, :string, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365445
    # BOOL GetNamedPipeInfo(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPDWORD lpFlags,
    #   _Out_opt_ LPDWORD lpOutBufferSize,
    #   _Out_opt_ LPDWORD lpInBufferSize,
    #   _Out_opt_ LPDWORD lpMaxInstances)
    def self.GetNamedPipeInfo(hNamedPipe, lpFlags, lpOutBufferSize, lpInBufferSize, lpMaxInstances) end
    attach_function 'GetNamedPipeInfo', [:handle, :pointer, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365779
    # BOOL PeekNamedPipe(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPVOID  lpBuffer,
    #   _In_      DWORD   nBufferSize,
    #   _Out_opt_ LPDWORD lpBytesRead,
    #   _Out_opt_ LPDWORD lpTotalBytesAvail,
    #   _Out_opt_ LPDWORD lpBytesLeftThisMessage)
    def self.PeekNamedPipe(hNamedPipe, lpBuffer, nBufferSize, lpBytesRead, lpTotalBytesAvail, lpBytesLeftThisMessage)
    end
    attach_function 'PeekNamedPipe', [:handle, :pointer, :dword, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365787
    # BOOL SetNamedPipeHandleState(
    #   _In_     HANDLE  hNamedPipe,
    #   _In_opt_ LPDWORD lpMode,
    #   _In_opt_ LPDWORD lpMaxCollectionCount,
    #   _In_opt_ LPDWORD lpCollectDataTimeout)
    def self.SetNamedPipeHandleState(hNamedPipe, lpMode, lpMaxCollectionCount, lpCollectDataTimeout) end
    attach_function 'SetNamedPipeHandleState', [:handle, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365790
    # BOOL TransactNamedPipe(
    #   _In_        HANDLE       hNamedPipe,
    #   _In_        LPVOID       lpInBuffer,
    #   _In_        DWORD        nInBufferSize,
    #   _Out_       LPVOID       lpOutBuffer,
    #   _In_        DWORD        nOutBufferSize,
    #   _Out_       LPDWORD      lpBytesRead,
    #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
    def self.TransactNamedPipe(hNamedPipe, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesRead,
        lpOverlapped) end
    attach_function 'TransactNamedPipe', [:handle, :pointer, :dword, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-waitnamedpipea
    # BOOL WaitNamedPipe(_In_ LPCTSTR lpNamedPipeName, _In_ DWORD   nTimeOut)
    def self.WaitNamedPipe(lpNamedPipeName, nTimeOut) end
    encoded_function 'WaitNamedPipe', [:string, :dword], :bool

    if WINDOWS_VERSION >= :vista
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipeclientcomputernamea
      # BOOL GetNamedPipeClientComputerName(
      #   _In_  HANDLE Pipe,
      #   _Out_ LPTSTR ClientComputerName,
      #   _In_  ULONG  ClientComputerNameLength)
      def self.GetNamedPipeClientComputerName(pipe, clientComputerName, clientComputerNameLength) end
      encoded_function 'GetNamedPipeClientComputerName', [:handle, :string, :ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipeclientprocessid
      # BOOL GetNamedPipeClientProcessId(_In_  HANDLE Pipe, _Out_ PULONG ClientProcessId)
      def self.GetNamedPipeClientProcessId(pipe, clientProcessId) end
      attach_function 'GetNamedPipeClientProcessId', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipeclientsessionid
      # BOOL GetNamedPipeClientSessionId(_In_  HANDLE Pipe, _Out_ PULONG ClientSessionId)
      def self.GetNamedPipeClientSessionId(pipe, clientSessionId) end
      attach_function 'GetNamedPipeClientSessionId', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipeserverprocessid
      # BOOL GetNamedPipeServerProcessId(_In_  HANDLE Pipe, _Out_ PULONG ServerProcessId)
      def self.GetNamedPipeServerProcessId(pipe, serverProcessId) end
      attach_function 'GetNamedPipeServerProcessId', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnamedpipeserversessionid
      # BOOL GetNamedPipeServerSessionId(_In_  HANDLE Pipe, _Out_ PULONG ServerSessionId)
      def self.GetNamedPipeServerSessionId(pipe, serverSessionId) end
      attach_function 'GetNamedPipeServerSessionId', [:handle, :pointer], :bool
    end
  end
end