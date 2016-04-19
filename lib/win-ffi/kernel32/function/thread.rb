require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/process/process_creation_flag'
require 'win-ffi/core/struct/security_attributes'
require 'win-ffi/kernel32/struct/processor/processor_number'

module WinFFI
  module Kernel32

    #TODO

    SYNCHRONIZE                 = 0x00100000
    THREAD_ALL_ACCESS           = 0x1F03FF
    THREAD_DIRECT_IMPERSONATION = 0x0200
    THREAD_GET_CONTEXT          = 0x0008
    THREAD_IMPERSONATE          = 0x0100
    THREAD_QUERY_INFORMATION    = 0x0040
    THREAD_SET_CONTEXT          = 0x0010
    THREAD_SET_INFORMATION      = 0x0020
    THREAD_SET_THREAD_TOKEN     = 0x0080
    THREAD_SUSPEND_RESUME       = 0x0002
    THREAD_TERMINATE            = 0x0001

    THREAD_PRIORITY_ABOVE_NORMAL  = 1
    THREAD_PRIORITY_BELOW_NORMAL  = -1
    THREAD_PRIORITY_HIGHEST       = 2
    THREAD_PRIORITY_IDLE          = -15
    THREAD_PRIORITY_LOWEST        = -2
    THREAD_PRIORITY_NORMAL        = 0
    THREAD_PRIORITY_TIME_CRITICAL = 15

    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682660(v=vs.85).aspx
      # VOID CALLBACK FiberProc(_In_ PVOID lpParameter)
      FiberProc = callback 'FiberProc', [:pointer], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682665(v=vs.85).aspx
      # VOID WINAPI FlsCallback(_In_ PVOID lpFlsData)
      FlsCallback = callback 'FlsCallback', [:void], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686736(v=vs.85).aspx
      # DWORD WINAPI ThreadProc(_In_ LPVOID lpParameter)
      ThreadProc = callback 'ThreadProc', [:pointer], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa363484(v=vs.85).aspx
      # BOOL WINAPI BindIoCompletionCallback(
      #   _In_ HANDLE                          FileHandle,
      #   _In_ LPOVERLAPPED_COMPLETION_ROUTINE Function,
      #   _In_ ULONG                           Flags)
      attach_function 'BindIoCompletionCallback', [:handle, :pointer, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682112(v=vs.85).aspx
      # BOOL WINAPI ConvertFiberToThread(void)
      attach_function 'ConvertFiberToThread', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682115(v=vs.85).aspx
      # LPVOID WINAPI ConvertThreadToFiber(_In_opt_ LPVOID lpParameter)
      attach_function 'ConvertThreadToFiber', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682402(v=vs.85).aspx
      # LPVOID WINAPI CreateFiber(
      #   _In_     SIZE_T                dwStackSize,
      #   _In_     LPFIBER_START_ROUTINE lpStartAddress,
      #   _In_opt_ LPVOID                lpParameter)
      attach_function 'CreateFiber', [:size_t, FiberProc, :pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682406(v=vs.85).aspx
      # LPVOID WINAPI CreateFiberEx(
      #   _In_     SIZE_T                dwStackCommitSize,
      #   _In_     SIZE_T                dwStackReserveSize,
      #   _In_     DWORD                 dwFlags,
      #   _In_     LPFIBER_START_ROUTINE lpStartAddress,
      #   _In_opt_ LPVOID                lpParameter)
      attach_function 'CreateFiberEx', [:size_t, :size_t, :dword, FiberProc, :pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682437(v=vs.85).aspx
      # HANDLE WINAPI CreateRemoteThread(
      #   _In_   HANDLE hProcess,
      #   _In_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #   _In_   SIZE_T dwStackSize,
      #   _In_   LPTHREAD_START_ROUTINE lpStartAddress,
      #   _In_   LPVOID lpParameter,
      #   _In_   DWORD dwCreationFlags,
      #   _Out_  LPDWORD lpThreadId )
      attach_function 'CreateRemoteThread',
                      [:handle, SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, ProcessCreationFlag,
                       :pointer], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682453(v=vs.85).aspx
      # HANDLE WINAPI CreateThread(
      #   _In_opt_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #   _In_       SIZE_T dwStackSize,
      #   _In_       LPTHREAD_START_ROUTINE lpStartAddress,
      #   _In_opt_   LPVOID lpParameter,
      #   _In_       DWORD dwCreationFlags,
      #   _Out_opt_  LPDWORD lpThreadId )
      attach_function 'CreateThread', [SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, :dword, :pointer], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682556(v=vs.85).aspx
      # VOID WINAPI DeleteFiber(_In_ LPVOID lpFiber)
      attach_function 'DeleteFiber', [:pointer], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682659(v=vs.85).aspx
      # VOID WINAPI ExitThread( _In_  DWORD dwExitCode )
      attach_function 'ExitThread', [:dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683182(v=vs.85).aspx
      # HANDLE WINAPI GetCurrentThread(void)
      attach_function 'GetCurrentThread', [], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683183(v=vs.85).aspx
      # DWORD WINAPI GetCurrentThreadId(void)
      attach_function 'GetCurrentThreadId', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683190(v=vs.85).aspx
      # BOOL WINAPI GetExitCodeThread(
      #   _In_   HANDLE hThread,
      #   _Out_  LPDWORD lpExitCode )
      attach_function 'GetExitCodeThread', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683214(v=vs.85).aspx
      # BOOL WINAPI GetProcessHandleCount(
      #   _In_    HANDLE hProcess,
      #   _Inout_ PDWORD pdwHandleCount)
      attach_function 'GetProcessHandleCount', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683215(v=vs.85).aspx
      # DWORD WINAPI GetProcessId(_In_ HANDLE Process)

      if WindowsVersion >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682018(v=vs.85).aspx
        # VOID CALLBACK CleanupGroupCancelCallback(
        #   _Inout_opt_ PVOID ObjectContext,
        #   _Inout_opt_ PVOID CleanupContext)
        CleanupGroupCancelCallback = callback 'CleanupGroupCancelCallback', [:pointer, :pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684124(v=vs.85).aspx
        # VOID CALLBACK IoCompletionCallback(
        #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
        #   _Inout_opt_ PVOID                 Context,
        #   _Inout_opt_ PVOID                 Overlapped,
        #   _In_        ULONG                 IoResult,
        #   _In_        ULONG_PTR             NumberOfBytesTransferred,
        #   _Inout_     PTP_IO                Io)
        IoCompletionCallback = callback 'IoCompletionCallback', [:pointer, :pointer, :pointer, :ulong, :ulong, :pointer], :void

        # VOID CALLBACK TimerCallback(
        #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
        #   _Inout_opt_ PVOID                 Context,
        #   _Inout_     PTP_TIMER             Timer)
        TimerCallback = callback 'TimerCallback', [:pointer, :pointer, :pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687017(v=vs.85).aspx
        # VOID CALLBACK WaitCallback(
        #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
        #   _Inout_opt_ PVOID                 Context,
        #   _Inout_     PTP_WAIT              Wait,
        #   _In_        TP_WAIT_RESULT        WaitResult)
        WaitCallback = callback 'WaitCallback', [:pointer, :pointer, :pointer, :pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687396(v=vs.85).aspx
        # VOID CALLBACK WorkCallback(
        #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
        #   _Inout_opt_ PVOID                 Context,
        #   _Inout_     PTP_WORK              Work)
        WorkCallback = callback 'WorkCallback', [:pointer, :pointer, :pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681981(v=vs.85).aspx
        # BOOL WINAPI CallbackMayRunLong(_Inout_ PTP_CALLBACK_INSTANCE pci)
        attach_function 'CallbackMayRunLong', [:pointer], :bool

        # VOID WINAPI CancelThreadpoolIo(_Inout_ PTP_IO pio)
        attach_function 'CancelThreadpoolIo', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682030(v=vs.85).aspx
        # VOID WINAPI CloseThreadpool(_Inout_ PTP_POOL ptpp)
        attach_function 'CloseThreadpool', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682033(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolCleanupGroup(_Inout_ PTP_CLEANUP_GROUP ptpcg)
        attach_function 'CloseThreadpoolCleanupGroup', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682036(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolCleanupGroupMembers(
        #   _Inout_     PTP_CLEANUP_GROUP ptpcg,
        #   _In_        BOOL              fCancelPendingCallbacks,
        #   _Inout_opt_ PVOID             pvCleanupContext)
        attach_function 'CloseThreadpoolCleanupGroupMembers', [:pointer, :bool, :pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682038(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolIo(_Inout_ PTP_IO pio)
        attach_function 'CloseThreadpoolIo', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682040(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolTimer(_Inout_ PTP_TIMER pti)
        attach_function 'CloseThreadpoolTimer', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682042(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolWait(_Inout_ PTP_WAIT pwa)
        attach_function 'CloseThreadpoolWait', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682043(v=vs.85).aspx
        # VOID WINAPI CloseThreadpoolWork(_Inout_ PTP_WORK pwk)
        attach_function 'CloseThreadpoolWork', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682117(v=vs.85).aspx
        # LPVOID WINAPI ConvertThreadToFiberEx(
        #   _In_opt_ LPVOID lpParameter,
        #   _In_     DWORD  dwFlags)
        attach_function 'ConvertThreadToFiberEx', [:pointer, :dword], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682456(v=vs.85).aspx
        # PTP_POOL WINAPI CreateThreadpool(_Reserved_ PVOID reserved)
        attach_function 'CreateThreadpool', [:pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682462(v=vs.85).aspx
        # PTP_CLEANUP_GROUP WINAPI CreateThreadpoolCleanupGroup(void)
        attach_function 'CreateThreadpoolCleanupGroup', [], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682464(v=vs.85).aspx
        # PTP_IO WINAPI CreateThreadpoolIo(
        #   _In_        HANDLE                fl,
        #   _In_        PTP_WIN32_IO_CALLBACK pfnio,
        #   _Inout_opt_ PVOID                 pv,
        #   _In_opt_    PTP_CALLBACK_ENVIRON  pcbe)
        attach_function 'CreateThreadpoolIo', [:handle, IoCompletionCallback, :pointer, :pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682466(v=vs.85).aspx
        # PTP_TIMER WINAPI CreateThreadpoolTimer(
        #   _In_        PTP_TIMER_CALLBACK   pfnti,
        #   _Inout_opt_ PVOID                pv,
        #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
        attach_function 'CreateThreadpoolTimer', [TimerCallback, :void, :pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682474(v=vs.85).aspx
        # PTP_WAIT WINAPI CreateThreadpoolWait(
        #   _In_        PTP_WAIT_CALLBACK    pfnwa,
        #   _Inout_opt_ PVOID                pv,
        #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
        attach_function 'CreateThreadpoolWait', [WaitCallback, :pointer, :pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682478(v=vs.85).aspx
        # PTP_WORK WINAPI CreateThreadpoolWork(
        #   _In_        PTP_WORK_CALLBACK    pfnwk,
        #   _Inout_opt_ PVOID                pv,
        #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
        attach_function 'CreateThreadpoolWork', [WorkCallback, :pointer, :pointer], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682559(v=vs.85).aspx
        # VOID WINAPI DeleteProcThreadAttributeList(_Inout_ LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList)
        attach_function 'DeleteProcThreadAttributeList', [:pointer], :void

        # TODO not in kernel32
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682576(v=vs.85).aspx
        # VOID DestroyThreadpoolEnvironment(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
        # attach_function 'DestroyThreadpoolEnvironment', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682581(v=vs.85).aspx
        # VOID WINAPI DisassociateCurrentThreadFromCallback(_Inout_ PTP_CALLBACK_INSTANCE pci)
        attach_function 'DisassociateCurrentThreadFromCallback', [:pointer], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682664(v=vs.85).aspx
        # DWORD WINAPI FlsAlloc(_In_ PFLS_CALLBACK_FUNCTION lpCallback)
        attach_function 'FlsAlloc', [FlsCallback], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682667(v=vs.85).aspx
        # BOOL WINAPI FlsFree(_In_ DWORD dwFlsIndex)
        attach_function 'FlsFree', [:dword], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683141(v=vs.85).aspx
        # PVOID WINAPI FlsGetValue(_In_ DWORD dwFlsIndex)
        attach_function 'FlsGetValue', [:dword], :pointer

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683146(v=vs.85).aspx
        # BOOL WINAPI FlsSetValue(
        #   _In_     DWORD dwFlsIndex,
        #   _In_opt_ PVOID lpFlsData)
        attach_function 'FlsSetValue', [:dword, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683154(v=vs.85).aspx
        # VOID WINAPI FreeLibraryWhenCallbackReturns(
        #   _Inout_ PTP_CALLBACK_INSTANCE pci,
        #   _In_    HMODULE               mod)
        attach_function 'FreeLibraryWhenCallbackReturns', [:pointer, :hmodule], :void

        if WindowsVersion >= 7

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405484(v=vs.85).aspx
          # HANDLE CreateRemoteThreadEx(
          #   _In_      HANDLE                       hProcess,
          #   _In_opt_  LPSECURITY_ATTRIBUTES        lpThreadAttributes,
          #   _In_      SIZE_T                       dwStackSize,
          #   _In_      LPTHREAD_START_ROUTINE       lpStartAddress,
          #   _In_opt_  LPVOID                       lpParameter,
          #   _In_      DWORD                        dwCreationFlags,
          #   _In_opt_  LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
          #   _Out_opt_ LPDWORD                      lpThreadId)
          attach_function 'CreateRemoteThreadEx',
                         [:handle, SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, ProcessCreationFlag,
                          :pointer, :pointer], :handle

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405485(v=vs.85).aspx
          # DWORD GetActiveProcessorCount(_In_ WORD GroupNumber)
          attach_function 'GetActiveProcessorCount', [:word], :dword

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405486(v=vs.85).aspx
          # WORD GetActiveProcessorGroupCount(void)
          attach_function 'GetActiveProcessorGroupCount', [], :word

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405487(v=vs.85).aspx
          # VOID GetCurrentProcessorNumberEx(_Out_ PPROCESSOR_NUMBER ProcNumber)
          attach_function 'GetCurrentProcessorNumberEx', [PROCESSOR_NUMBER.ptr(:out)], :void

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405496(v=vs.85).aspx
          # BOOL GetProcessGroupAffinity(
          #   _In_    HANDLE  hProcess,
          #   _Inout_ PUSHORT GroupCount,
          #   _Out_   PUSHORT GroupArray)
          attach_function 'GetProcessGroupAffinity', [:handle, :pointer, :pointer], :bool


          if WindowsVersion >= 8
            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706789(v=vs.85).aspx
            # VOID WINAPI GetCurrentThreadStackLimits(
            #   _Out_ PULONG_PTR LowLimit,
            #   _Out_ PULONG_PTR HighLimit)
            attach_function 'GetCurrentThreadStackLimits', [:pointer, :pointer], :void

            if WindowsVersion >= 10

              # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186424(v=vs.85).aspx
              # BOOL WINAPI GetProcessDefaultCpuSets(
              #   _In_      HANDLE Process,
              #   _Out_opt_ PULONG CpuSetIds,
              #   _In_      ULONG  CpuSetIdCount,
              #   _Out_     PULONG RequiredIdCount)
              attach_function 'GetProcessDefaultCpuSets', [:handle, :pointer, :ulong, :pointer], :bool
            end
          end
        end
      end
    end

    #int WINAPI GetThreadPriority( _In_  HANDLE hThread )
    attach_function 'GetThreadPriority', [:handle], :int

    #BOOL WINAPI GetThreadPriorityBoost(
    #  _In_   HANDLE hThread,
    #  _Out_  PBOOL pDisablePriorityBoost )
    attach_function 'GetThreadPriorityBoost', [:pointer, :pointer], :bool

    #BOOL WINAPI GetThreadTimes(
    #  _In_   HANDLE hThread,
    #  _Out_  LPFILETIME lpCreationTime,
    #  _Out_  LPFILETIME lpExitTime,
    #  _Out_  LPFILETIME lpKernelTime,
    #  _Out_  LPFILETIME lpUserTime )
    attach_function 'GetThreadTimes', [:handle, :pointer, :pointer, :pointer, :pointer], :bool

    #HANDLE WINAPI OpenThread(
    #  _In_  DWORD dwDesiredAccess,
    #  _In_  BOOL bInheritHandle,
    #  _In_  DWORD dwThreadId )
    attach_function 'OpenThread', [:dword, :bool, :dword], :handle

    #DWORD WINAPI ResumeThread( _In_  HANDLE hThread )
    attach_function 'ResumeThread', [:handle], :dword

    #DWORD_PTR WINAPI SetThreadAffinityMask(
    #  _In_  HANDLE hThread,
    #  _In_  DWORD_PTR dwThreadAffinityMask )
    attach_function 'SetThreadAffinityMask', [:handle, :pointer], :ulong

    #DWORD WINAPI SetThreadIdealProcessor(
    #  _In_  HANDLE hThread,
    #  _In_  DWORD dwIdealProcessor )
    attach_function 'SetThreadIdealProcessor', [:handle, :dword], :dword

    #BOOL WINAPI SetThreadPriority(
    #  _In_  HANDLE hThread,
    #  _In_  int nPriority )
    attach_function 'SetThreadPriority', [:handle, :int], :bool

    #BOOL WINAPI SetThreadPriorityBoost(
    #  _In_  HANDLE hThread,
    #  _In_  BOOL DisablePriorityBoost )
    attach_function 'SetThreadPriorityBoost', [:handle, :bool], :bool

    #VOID WINAPI Sleep( _In_  DWORD dwMilliseconds )
    attach_function 'Sleep', [:dword], :void

    #DWORD WINAPI SleepEx(
    #  _In_  DWORD dwMilliseconds,
    #  _In_  BOOL bAlertable )
    attach_function 'SleepEx', [:dword, :bool], :dword

    #DWORD WINAPI SuspendThread( _In_  HANDLE hThread )
    attach_function 'SuspendThread', [:handle], :dword

    #BOOL WINAPI SwitchToThread(void)
    attach_function 'SwitchToThread', [], :bool

    #BOOL WINAPI TerminateThread(
    #  _Inout_  HANDLE hThread,
    #  _In_     DWORD dwExitCode )
    attach_function 'TerminateThread', [:handle, :dword], :bool

    #DWORD WINAPI TlsAlloc(void)
    attach_function 'TlsAlloc', [], :dword

    #BOOL WINAPI TlsFree( _In_  DWORD dwTlsIndex )
    attach_function 'TlsFree', [:dword], :bool

    #LPVOID WINAPI TlsGetValue( _In_  DWORD dwTlsIndex )
    attach_function 'TlsGetValue', [:dword], :pointer

    #BOOL WINAPI TlsSetValue(
    #  _In_      DWORD dwTlsIndex,
    #  _In_opt_  LPVOID lpTlsValue )
    attach_function 'TlsSetValue', [:dword, :pointer], :bool

    if WindowsVersion.sp >= 1

      #BOOL WINAPI GetThreadIOPendingFlag(
      #  _In_     HANDLE hThread,
      #  _Inout_  PBOOL lpIOIsPending )
      attach_function 'GetThreadIOPendingFlag', [:ulong, :pointer], :bool

      if WindowsVersion >= 7

        #HANDLE CreateRemoteThreadEx(
        #  _In_       HANDLE hProcess,
        #  _In_opt_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
        #  _In_       SIZE_T dwStackSize,
        #  _In_       LPTHREAD_START_ROUTINE lpStartAddress,
        #  _In_opt_   LPVOID lpParameter,
        #  _In_       DWORD dwCreationFlags,
        #  _In_opt_   LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
        #  _Out_opt_  LPDWORD lpThreadId )
        attach_function 'CreateRemoteThreadEx', [:handle, :pointer, :size_t, :pointer, :pointer, :dword, :pointer, :pointer], :bool
      end
    end
  end
end