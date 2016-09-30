require 'win-ffi/core/struct/security_attributes'

require 'win-ffi/kernel32/enum/pipe/named_pipe_wait'
require 'win-ffi/kernel32/struct/synchronization/overlapped'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365144(v=vs.85).aspx
    # BOOL WINAPI CallNamedPipe(
    #   _In_  LPCTSTR lpNamedPipeName,
    #   _In_  LPVOID  lpInBuffer,
    #   _In_  DWORD   nInBufferSize,
    #   _Out_ LPVOID  lpOutBuffer,
    #   _In_  DWORD   nOutBufferSize,
    #   _Out_ LPDWORD lpBytesRead,
    #   _In_  DWORD   nTimeOut)
    encoded_function 'CallNamedPipe', [:string, :pointer, :dword, :pointer, :dword, :pointer, NamedPipeWait], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365146(v=vs.85).aspx
    # BOOL WINAPI ConnectNamedPipe(
    #   _In_        HANDLE       hNamedPipe,
    #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
    attach_function 'ConnectNamedPipe', [:handle, OVERLAPPED.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365150(v=vs.85).aspx
    # HANDLE WINAPI CreateNamedPipe(
    #   _In_     LPCTSTR               lpName,
    #   _In_     DWORD                 dwOpenMode,
    #   _In_     DWORD                 dwPipeMode,
    #   _In_     DWORD                 nMaxInstances,
    #   _In_     DWORD                 nOutBufferSize,
    #   _In_     DWORD                 nInBufferSize,
    #   _In_     DWORD                 nDefaultTimeOut,
    #   _In_opt_ LPSECURITY_ATTRIBUTES lpSecurityAttributes)
    encoded_function 'CreateNamedPipe',
                     [:string, :dword, :dword, :dword, :dword, :dword, :dword, SECURITY_ATTRIBUTES.ptr(:in)], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365152(v=vs.85).aspx
    # BOOL WINAPI CreatePipe(
    #   _Out_    PHANDLE               hReadPipe,
    #   _Out_    PHANDLE               hWritePipe,
    #   _In_opt_ LPSECURITY_ATTRIBUTES lpPipeAttributes,
    #   _In_     DWORD                 nSize)
    attach_function 'CreatePipe', [:pointer, :pointer, SECURITY_ATTRIBUTES.ptr(:in), :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365166(v=vs.85).aspx
    # BOOL WINAPI DisconnectNamedPipe(_In_ HANDLE hNamedPipe)
    attach_function 'DisconnectNamedPipe', [:handle], :bool

    # BOOL WINAPI GetNamedPipeHandleState(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPDWORD lpState,
    #   _Out_opt_ LPDWORD lpCurInstances,
    #   _Out_opt_ LPDWORD lpMaxCollectionCount,
    #   _Out_opt_ LPDWORD lpCollectDataTimeout,
    #   _Out_opt_ LPTSTR  lpUserName,
    #   _In_      DWORD   nMaxUserNameSize)
    encoded_function 'GetNamedPipeHandleState',
                     [:handle, :pointer, :pointer, :pointer, :pointer, :string, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365445(v=vs.85).aspx
    # BOOL WINAPI GetNamedPipeInfo(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPDWORD lpFlags,
    #   _Out_opt_ LPDWORD lpOutBufferSize,
    #   _Out_opt_ LPDWORD lpInBufferSize,
    #   _Out_opt_ LPDWORD lpMaxInstances)
    attach_function 'GetNamedPipeInfo', [:handle, :pointer, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365779(v=vs.85).aspx
    # BOOL WINAPI PeekNamedPipe(
    #   _In_      HANDLE  hNamedPipe,
    #   _Out_opt_ LPVOID  lpBuffer,
    #   _In_      DWORD   nBufferSize,
    #   _Out_opt_ LPDWORD lpBytesRead,
    #   _Out_opt_ LPDWORD lpTotalBytesAvail,
    #   _Out_opt_ LPDWORD lpBytesLeftThisMessage)
    attach_function 'PeekNamedPipe', [:handle, :pointer, :dword, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365787(v=vs.85).aspx
    # BOOL WINAPI SetNamedPipeHandleState(
    #   _In_     HANDLE  hNamedPipe,
    #   _In_opt_ LPDWORD lpMode,
    #   _In_opt_ LPDWORD lpMaxCollectionCount,
    #   _In_opt_ LPDWORD lpCollectDataTimeout)
    attach_function 'SetNamedPipeHandleState', [:handle, :pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365790(v=vs.85).aspx
    # BOOL WINAPI TransactNamedPipe(
    #   _In_        HANDLE       hNamedPipe,
    #   _In_        LPVOID       lpInBuffer,
    #   _In_        DWORD        nInBufferSize,
    #   _Out_       LPVOID       lpOutBuffer,
    #   _In_        DWORD        nOutBufferSize,
    #   _Out_       LPDWORD      lpBytesRead,
    #   _Inout_opt_ LPOVERLAPPED lpOverlapped)
    attach_function 'TransactNamedPipe', [:handle, :pointer, :dword, :pointer, :dword, :pointer, OVERLAPPED.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365800(v=vs.85).aspx
    # BOOL WINAPI WaitNamedPipe(_In_ LPCTSTR lpNamedPipeName, _In_ DWORD   nTimeOut)
    encoded_function 'WaitNamedPipe', [:string, :dword], :bool

    if WindowsVersion >= :vista
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365437(v=vs.85).aspx
      # BOOL WINAPI GetNamedPipeClientComputerName(
      #   _In_  HANDLE Pipe,
      #   _Out_ LPTSTR ClientComputerName,
      #   _In_  ULONG  ClientComputerNameLength)
      encoded_function 'GetNamedPipeClientComputerName', [:handle, :string, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365440(v=vs.85).aspx
      # BOOL WINAPI GetNamedPipeClientProcessId(_In_  HANDLE Pipe, _Out_ PULONG ClientProcessId)
      attach_function 'GetNamedPipeClientProcessId', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365442(v=vs.85).aspx
      # BOOL WINAPI GetNamedPipeClientSessionId(_In_  HANDLE Pipe, _Out_ PULONG ClientSessionId)
      attach_function 'GetNamedPipeClientSessionId', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365446(v=vs.85).aspx
      # BOOL WINAPI GetNamedPipeServerProcessId(_In_  HANDLE Pipe, _Out_ PULONG ServerProcessId)
      attach_function 'GetNamedPipeServerProcessId', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365569(v=vs.85).aspx
      # BOOL WINAPI GetNamedPipeServerSessionId(_In_  HANDLE Pipe, _Out_ PULONG ServerSessionId)
      attach_function 'GetNamedPipeServerSessionId', [:handle, :pointer], :bool
    end
  end
end