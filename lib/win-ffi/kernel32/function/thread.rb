require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/thread/thread_information_class'
require 'win-ffi/kernel32/enum/process/process_creation_mitigation_policy'

require 'win-ffi/core/struct/security_attributes'
require 'win-ffi/kernel32/enum/process/process_creation_flag'
require 'win-ffi/kernel32/struct/processor/processor_number'
require 'win-ffi/kernel32/struct/processor/group_affinity'
require 'win-ffi/kernel32/struct/time/file_time'
require 'win-ffi/kernel32/struct/thread/thread_pool_stack_information'

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

    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655022(v=vs.85).aspx
    # VOID FORCEINLINE TpInitializeCallbackEnviron(_Out_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # attach_function 'TpInitializeCallbackEnviron', [:pointer], :void

    # For the current version of the callback environment, no actions
    # need to be taken to tear down an initialized structure.  This
    # may change in a future release.
    # UNREFERENCED_PARAMETER(CallbackEnviron);
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655021(v=vs.85).aspx
    # VOID FORCEINLINE TpDestroyCallbackEnviron(_In_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # attach_function 'TpDestroyCallbackEnviron', [:pointer], :void

    # CallbackEnviron->ActivationContext = ActivationContext;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655023(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackActivationContext(
    #   _Inout_  PTP_CALLBACK_ENVIRON       CallbackEnviron,
    #   _In_opt_ struct _ACTIVATION_CONTEXT *ActivationContext)
    # attach_function 'TpSetCallbackActivationContext', [:pointer, :pointer], :void

    # CallbackEnviron->CleanupGroup = CleanupGroup;
    # CallbackEnviron->CleanupGroupCancelCallback = CleanupGroupCancelCallback;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655024(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackCleanupGroup(
    #   _Inout_  PTP_CALLBACK_ENVIRON              CallbackEnviron,
    #   _In_     PTP_CLEANUP_GROUP                 CleanupGroup,
    #   _In_opt_ PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback)
    # attach_function 'TpSetCallbackCleanupGroup', [:pointer, :pointer, :pointer], :void

    # CallbackEnviron->FinalizationCallback = FinalizationCallback;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655025(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackFinalizationCallback(
    #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
    #   _In_    PTP_SIMPLE_CALLBACK  FinalizationCallback)
    # attach_function 'TpSetCallbackFinalizationCallback', [:pointer, :pointer], :void

    # CallbackEnviron->u.s.LongFunction = 1;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj655026(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackLongFunction(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # attach_function 'TpSetCallbackLongFunction', [:pointer], :void

    # CallbackEnviron->ActivationContext = (struct _ACTIVATION_CONTEXT *)(LONG_PTR) -1; // INVALID_ACTIVATION_CONTEXT
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613843(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackNoActivationContext(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # attach_function 'TpSetCallbackNoActivationContext', [:pointer], :void

    # CallbackEnviron->u.s.Persistent = 1;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613844(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackPersistent(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # attach_function 'TpSetCallbackPersistent', [:pointer], :void

    # CallbackEnviron->RaceDll = DllHandle;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613846(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackRaceWithDll(
    #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
    #   _In_    PVOID                DllHandle)
    # attach_function 'TpSetCallbackRaceWithDll', [:pointer, :pointer], :void

    # CallbackEnviron->Pool = Pool;
    # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613847(v=vs.85).aspx
    # VOID FORCEINLINE TpSetCallbackThreadpool(
    #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
    #   _In_    PTP_POOL             Pool)
    # attach_function 'TpSetCallbackThreadpool', [:pointer, :pointer], :void

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

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683235(v=vs.85).aspx
      # int WINAPI GetThreadPriority( _In_  HANDLE hThread )
      attach_function 'GetThreadPriority', [:handle], :int

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683236(v=vs.85).aspx
      # BOOL WINAPI GetThreadPriorityBoost(
      #   _In_   HANDLE hThread,
      #   _Out_  PBOOL pDisablePriorityBoost )
      attach_function 'GetThreadPriorityBoost', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683237(v=vs.85).aspx
      # BOOL WINAPI GetThreadTimes(
      #   _In_   HANDLE hThread,
      #   _Out_  LPFILETIME lpCreationTime,
      #   _Out_  LPFILETIME lpExitTime,
      #   _Out_  LPFILETIME lpKernelTime,
      #   _Out_  LPFILETIME lpUserTime )
      attach_function 'GetThreadTimes',
                      [:handle, FILETIME.ptr(:out), FILETIME.ptr(:out), FILETIME.ptr(:out), FILETIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684335(v=vs.85).aspx
      # HANDLE WINAPI OpenThread(
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  BOOL bInheritHandle,
      #   _In_  DWORD dwThreadId )
      attach_function 'OpenThread', [:dword, :bool, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684957(v=vs.85).aspx
      # BOOL WINAPI QueueUserWorkItem(
      #   _In_     LPTHREAD_START_ROUTINE Function,
      #   _In_opt_ PVOID                  Context,
      #   _In_     ULONG                  Flags)
      attach_function 'QueueUserWorkItem', [ThreadProc, :pointer, :ulong], :bool

      # DWORD WINAPI ResumeThread( _In_  HANDLE hThread )
      attach_function 'ResumeThread', [:handle], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686247(v=vs.85).aspx
      # DWORD_PTR WINAPI SetThreadAffinityMask(
      #   _In_  HANDLE hThread,
      #   _In_  DWORD_PTR dwThreadAffinityMask )
      attach_function 'SetThreadAffinityMask', [:handle, :dword], :ulong

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686253(v=vs.85).aspx
      # DWORD WINAPI SetThreadIdealProcessor(
      #   _In_  HANDLE hThread,
      #   _In_  DWORD dwIdealProcessor )
      attach_function 'SetThreadIdealProcessor', [:handle, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686277(v=vs.85).aspx
      # BOOL WINAPI SetThreadPriority(
      #   _In_  HANDLE hThread,
      #   _In_  int nPriority )
      attach_function 'SetThreadPriority', [:handle, :int], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686280(v=vs.85).aspx
      # BOOL WINAPI SetThreadPriorityBoost(
      #   _In_  HANDLE hThread,
      #   _In_  BOOL DisablePriorityBoost )
      attach_function 'SetThreadPriorityBoost', [:handle, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686298(v=vs.85).aspx
      # VOID WINAPI Sleep(_In_ DWORD dwMilliseconds)
      attach_function 'Sleep', [:dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686307(v=vs.85).aspx
      # DWORD WINAPI SleepEx(
      #   _In_ DWORD dwMilliseconds,
      #   _In_ BOOL  bAlertable)
      attach_function 'SleepEx', [:dword, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686345(v=vs.85).aspx
      # DWORD WINAPI SuspendThread( _In_  HANDLE hThread )
      attach_function 'SuspendThread', [:handle], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686350(v=vs.85).aspx
      # VOID WINAPI SwitchToFiber(_In_ LPVOID lpFiber)
      attach_function 'SwitchToFiber', [:pointer], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686352(v=vs.85).aspx
      # BOOL WINAPI SwitchToThread(void)
      attach_function 'SwitchToThread', [], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686717(v=vs.85).aspx
      # BOOL WINAPI TerminateThread(
      #   _Inout_  HANDLE hThread,
      #   _In_     DWORD dwExitCode )
      attach_function 'TerminateThread', [:handle, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686801(v=vs.85).aspx
      # DWORD WINAPI TlsAlloc(void)
      attach_function 'TlsAlloc', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686804(v=vs.85).aspx
      # BOOL WINAPI TlsFree( _In_  DWORD dwTlsIndex )
      attach_function 'TlsFree', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686812(v=vs.85).aspx
      # LPVOID WINAPI TlsGetValue( _In_  DWORD dwTlsIndex )
      attach_function 'TlsGetValue', [:dword], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686818(v=vs.85).aspx
      # BOOL WINAPI TlsSetValue(
      #   _In_      DWORD dwTlsIndex,
      #   _In_opt_  LPVOID lpTlsValue )
      attach_function 'TlsSetValue', [:dword, :pointer], :bool

      if Architecture == 'x64-mingw32'
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686283(v=vs.85).aspx
        # BOOL WINAPI SetThreadStackGuarantee(_Inout_ PULONG StackSizeInBytes)
        attach_function 'SetThreadStackGuarantee', [:pointer], :bool
      end

      if WindowsVersion >= :server2003 || (WindowsVersion == :xp && WindowsVersion.sp >= 1)

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683234(v=vs.85).aspx
        # BOOL WINAPI GetThreadIOPendingFlag(
        #   _In_     HANDLE hThread,
        #   _Inout_  PBOOL lpIOIsPending )
        attach_function 'GetThreadIOPendingFlag', [:ulong, :pointer], :bool

        if WindowsVersion >= :server2003

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683233(v=vs.85).aspx
          # DWORD WINAPI GetThreadId(_In_ HANDLE Thread)
          attach_function 'GetThreadId', [:handle], :dword

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
            IoCompletionCallback = callback 'IoCompletionCallback',
                                            [:pointer, :pointer, :pointer, :ulong, :ulong, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686295(v=vs.85).aspx
            # VOID CALLBACK SimpleCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context)
            SimpleCallback = callback 'SimpleCallback', [:pointer, :pointer], :void

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

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683216(v=vs.85).aspx
            # DWORD WINAPI GetProcessIdOfThread(_In_ HANDLE Thread)
            attach_function 'GetProcessIdOfThread', [:handle], :dword

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683481(v=vs.85).aspx
            # BOOL WINAPI InitializeProcThreadAttributeList(
            #   _Out_opt_  LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
            #   _In_       DWORD                        dwAttributeCount,
            #   _Reserved_ DWORD                        dwFlags,
            #   _Inout_    PSIZE_T                      lpSize)
            attach_function 'InitializeProcThreadAttributeList', [:pointer, :dword, :dword, :pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683486(v=vs.85).aspx
            # VOID InitializeThreadpoolEnvironment(_Out_ PTP_CALLBACK_ENVIRON pcbe)
            # attach_function 'InitializeThreadpoolEnvironment', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684131(v=vs.85).aspx
            # BOOL WINAPI IsThreadAFiber(void)
            attach_function 'IsThreadAFiber', [], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684133(v=vs.85).aspx
            # BOOL WINAPI IsThreadpoolTimerSet(_Inout_ PTP_TIMER pti)
            attach_function 'IsThreadpoolTimerSet', [:pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684171(v=vs.85).aspx
            # VOID WINAPI LeaveCriticalSectionWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _Inout_ PCRITICAL_SECTION     pcs)
            attach_function 'LeaveCriticalSectionWhenCallbackReturns', [:pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684943(v=vs.85).aspx
            # BOOL WINAPI QueryThreadCycleTime(
            #   _In_  HANDLE   ThreadHandle,
            #   _Out_ PULONG64 CycleTime)
            attach_function 'QueryThreadCycleTime', [:handle, :pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685070(v=vs.85).aspx
            # VOID WINAPI ReleaseMutexWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _In_    HANDLE                mut)
            attach_function 'ReleaseMutexWhenCallbackReturns', [:pointer, :handle], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685073(v=vs.85).aspx
            # VOID WINAPI ReleaseSemaphoreWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _In_    HANDLE                sem,
            #   _In_    DWORD                 crel)
            attach_function 'ReleaseSemaphoreWhenCallbackReturns', [:pointer, :handle, :dword], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686214(v=vs.85).aspx
            # VOID WINAPI SetEventWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _In_    HANDLE                evt)
            attach_function 'SetEventWhenCallbackReturns', [:pointer, :handle], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686255(v=vs.85).aspx
            # VOID SetThreadpoolCallbackCleanupGroup(
            #   _Inout_  PTP_CALLBACK_ENVIRON              pcbe,
            #   _In_     PTP_CLEANUP_GROUP                 ptpcg,
            #   _In_opt_ PTP_CLEANUP_GROUP_CANCEL_CALLBACK pfng)
            # attach_function 'SetThreadpoolCallbackCleanupGroup', [:pointer, :pointer, :pointer], :void

            # TODO
            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686258(v=vs.85).aspx
            # VOID SetThreadpoolCallbackLibrary(
            #   _Inout_ PTP_CALLBACK_ENVIRON pcbe,
            #   _In_    PVOID                mod)
            # attach_function 'SetThreadpoolCallbackLibrary', [:pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686261(v=vs.85).aspx
            # VOID SetThreadpoolCallbackPool(
            #   _Inout_ PTP_CALLBACK_ENVIRON pcbe,
            #   _In_    PTP_POOL             ptpp)
            # attach_function 'SetThreadpoolCallbackPool', [:pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686263(v=vs.85).aspx
            # VOID SetThreadpoolCallbackRunsLong(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
            # attach_function 'SetThreadpoolCallbackRunsLong',[:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686266(v=vs.85).aspx
            # VOID WINAPI SetThreadpoolThreadMaximum(
            #   _Inout_ PTP_POOL ptpp,
            #   _In_    DWORD    cthrdMost)
            attach_function 'SetThreadpoolThreadMaximum', [:pointer, :dword], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686268(v=vs.85).aspx
            # BOOL WINAPI SetThreadpoolThreadMinimum(
            #   _Inout_ PTP_POOL ptpp,
            #   _In_    DWORD    cthrdMic)
            attach_function 'SetThreadpoolThreadMinimum', [:pointer, :dword], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686271(v=vs.85).aspx
            # VOID WINAPI SetThreadpoolTimer(
            #   _Inout_  PTP_TIMER pti,
            #   _In_opt_ PFILETIME pftDueTime,
            #   _In_     DWORD     msPeriod,
            #   _In_opt_ DWORD     msWindowLength)
            attach_function 'SetThreadpoolTimer', [:pointer, FILETIME.ptr, :dword, :dword], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/dn894018(v=vs.85).aspx
            # BOOL WINAPI SetThreadpoolTimerEx(
            #   _Inout_  PTP_TIMER pti,
            #   _In_opt_ PFILETIME pftDueTime,
            #   _In_     DWORD     msPeriod,
            #   _In_opt_ DWORD     msWindowLength)
            attach_function 'SetThreadpoolTimerEx', [:pointer, FILETIME.ptr, :dword, :dword], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686273(v=vs.85).aspx
            # VOID WINAPI SetThreadpoolWait(
            #   _Inout_  PTP_WAIT  pwa,
            #   _In_opt_ HANDLE    h,
            #   _In_opt_ PFILETIME pftTimeout)
            attach_function 'SetThreadpoolWait', [:pointer, :handle, FILETIME.ptr], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686326(v=vs.85).aspx
            # VOID WINAPI StartThreadpoolIo(_Inout_ PTP_IO pio)
            attach_function 'StartThreadpoolIo', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686338(v=vs.85).aspx
            # VOID WINAPI SubmitThreadpoolWork(_Inout_ PTP_WORK pwk)
            attach_function 'SubmitThreadpoolWork', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686862(v=vs.85).aspx
            # BOOL WINAPI TrySubmitThreadpoolCallback(
            #   _In_        PTP_SIMPLE_CALLBACK  pfns,
            #   _Inout_opt_ PVOID                pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
            attach_function 'TrySubmitThreadpoolCallback', [SimpleCallback, :pointer, :pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686880(v=vs.85).aspx
            # BOOL WINAPI UpdateProcThreadAttribute(
            #   _Inout_   LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
            #   _In_      DWORD                        dwFlags,
            #   _In_      DWORD_PTR                    Attribute,
            #   _In_      PVOID                        lpValue,
            #   _In_      SIZE_T                       cbSize,
            #   _Out_opt_ PVOID                        lpPreviousValue,
            #   _In_opt_  PSIZE_T                      lpReturnSize)
            attach_function 'UpdateProcThreadAttribute',
                            [:pointer, :dword, ProcessCreationMitigationPolicy, :pointer, :size_t, :pointer, :pointer],
                            :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687038(v=vs.85).aspx
            # VOID WINAPI WaitForThreadpoolIoCallbacks(
            #   _Inout_ PTP_IO pio,
            #   _In_    BOOL   fCancelPendingCallbacks)
            attach_function 'WaitForThreadpoolIoCallbacks', [:pointer, :bool], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687042(v=vs.85).aspx
            # VOID WINAPI WaitForThreadpoolTimerCallbacks(
            #   _Inout_ PTP_TIMER pti,
            #   _In_    BOOL      fCancelPendingCallbacks)
            attach_function 'WaitForThreadpoolTimerCallbacks', [:pointer, :bool], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687047(v=vs.85).aspx
            # VOID WINAPI WaitForThreadpoolWaitCallbacks(
            #   _Inout_ PTP_WAIT pwa,
            #   _In_    BOOL     fCancelPendingCallbacks)
            attach_function 'WaitForThreadpoolWaitCallbacks', [:pointer, :bool], :void

            # VOID WINAPI WaitForThreadpoolWorkCallbacks(
            #   _Inout_ PTP_WORK pwk,
            #   _In_    BOOL     fCancelPendingCallbacks)
            attach_function 'WaitForThreadpoolWorkCallbacks', [:pointer, :bool], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687400(v=vs.85).aspx
            # DWORD WINAPI Wow64SuspendThread(_In_ HANDLE hThread)
            attach_function 'Wow64SuspendThread', [:handle], :dword

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

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd796392%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
              # DWORD APIENTRY DisableThreadProfiling(_In_ HANDLE PerformanceDataHandle)
              attach_function 'DisableThreadProfiling', [:handle], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd796393%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
              # DWORD APIENTRY EnableThreadProfiling(
              #   _In_  HANDLE  ThreadHandle,
              #   _In_  DWORD   Flags,
              #   _In_  DWORD64 HardwareCounters,
              #   _Out_ HANDLE  PerformanceDataHandle)
              attach_function 'EnableThreadProfiling', [:handle, :dword, :dword64, :handle], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405498(v=vs.85).aspx
              # BOOL GetThreadGroupAffinity(
              #   _In_  HANDLE          hThread,
              #   _Out_ PGROUP_AFFINITY GroupAffinity)
              attach_function 'GetThreadGroupAffinity', [:handle, GROUP_AFFINITY.ptr(:out)], :bool

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405499(v=vs.85).aspx
              # BOOL GetThreadIdealProcessorEx(
              #   _In_  HANDLE            hThread,
              #   _Out_ PPROCESSOR_NUMBER lpIdealProcessor)
              attach_function 'GetThreadIdealProcessorEx', [:handle, PROCESSOR_NUMBER.ptr(:out)], :bool

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405508(v=vs.85).aspx
              # BOOL QueryThreadpoolStackInformation(
              #   _In_  PTP_POOL                   ptpp,
              #   _Out_ PTP_POOL_STACK_INFORMATION ptpsi)
              attach_function 'QueryThreadpoolStackInformation', [:pointer, TP_POOL_STACK_INFORMATION], :bool

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405517(v=vs.85).aspx
              # BOOL SetThreadIdealProcessorEx(
              #   _In_      HANDLE            hThread,
              #   _In_      PPROCESSOR_NUMBER lpIdealProcessor,
              #   _Out_opt_ PPROCESSOR_NUMBER lpPreviousIdealProcessor)
              attach_function 'SetThreadIdealProcessorEx', [:handle, PROCESSOR_NUMBER.ptr(:in), PROCESSOR_NUMBER.ptr], :bool

              # TODO
              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405518(v=vs.85).aspx
              # VOID SetThreadpoolCallbackPersistent(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
              # attach_function 'SetThreadpoolCallbackPersistent', [:pointer], :void

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405519(v=vs.85).aspx
              # VOID SetThreadpoolCallbackPriority(
              #   _Inout_ PTP_CALLBACK_ENVIRON pcbe,
              #   _In_    TP_CALLBACK_PRIORITY Priority)
              # attach_function 'SetThreadpoolCallbackPriority', [:pointer, ThreadPoolCallbackPriority], :void

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405520(v=vs.85).aspx
              # BOOL SetThreadpoolStackInformation(
              #   _Inout_ PTP_POOL                   ptpp,
              #   _In_    PTP_POOL_STACK_INFORMATION ptpsi)
              attach_function 'SetThreadpoolStackInformation', [:pointer, TP_POOL_STACK_INFORMATION.ptr(:in)], :bool

              # TODO
              # CallbackEnviron->CallbackPriority = Priority;
              # https://msdn.microsoft.com/en-us/library/windows/desktop/jj613845(v=vs.85).aspx
              # VOID FORCEINLINE TpSetCallbackPriority(
              #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
              #   _In_    TP_CALLBACK_PRIORITY Priority)
              # attach_function 'TpSetCallbackPriority', [:pointer, ThreadPoolCallbackPriority], :void

              if WindowsVersion >= 8

                # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706789(v=vs.85).aspx
                # VOID WINAPI GetCurrentThreadStackLimits(
                #   _Out_ PULONG_PTR LowLimit,
                #   _Out_ PULONG_PTR HighLimit)
                attach_function 'GetCurrentThreadStackLimits', [:pointer, :pointer], :void

                # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448382(v=vs.85).aspx
                # BOOL  GetThreadInformation(
                #   _In_ HANDLE                   hThread,
                #   _In_ THREAD_INFORMATION_CLASS ThreadInformationClass,
                #   _Out_writes_bytes_       ThreadInformation,
                #   _In_ DWORD                    ThreadInformationSize)
                attach_function 'GetThreadInformation', [:handle, ThreadInformationClass, :pointer, :dword], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448390(v=vs.85).aspx
                # BOOL  SetThreadInformation(
                #   _In_ HANDLE                   hThread,
                #   _In_ THREAD_INFORMATION_CLASS ThreadInformationClass,
                #   _In_reads_bytes_         ThreadInformation,
                #   _In_ DWORD                    ThreadInformationSize)
                attach_function 'SetThreadInformation', [:handle, ThreadInformationClass, :pointer, :dword], :bool

                if WindowsVersion >= 10

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186426(v=vs.85).aspx
                  # BOOL WINAPI GetThreadSelectedCpuSets(
                  #   _In_      HANDLE Thread,
                  #   _Out_opt_ PULONG CpuSetIds,
                  #   _In_      ULONG  CpuSetIdCount,
                  #   _Out_     PULONG RequiredIdCount)
                  attach_function 'GetThreadSelectedCpuSets', [:handle, :pointer, :ulong, :pointer], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186618(v=vs.85).aspx
                  # BOOL WINAPI SetThreadpoolWaitEx(
                  #   _Inout_    PTP_WAIT  pwa,
                  #   _In_opt_   HANDLE    h,
                  #   _In_opt_   PFILETIME pftTimeout,
                  #   _Reserved_ PVOID     Reserved)
                  attach_function 'SetThreadpoolWaitEx', [:pointer, :handle, FILETIME.ptr, :pointer], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186428(v=vs.85).aspx
                  # BOOL WINAPI SetThreadSelectedCpuSets(
                  #   _In_       HANDLE Thread,
                  #   _In_ const ULONG  *CpuSetIds,
                  #   _In_       ULONG  CpuSetIdCount)
                  attach_function 'SetThreadSelectedCpuSets', [:handle, :pointer, :ulong], :bool
                end
              end
            end
          end
        end
      end
    end
  end
end