require 'win-ffi/core/struct/security_attributes'

require_relative '../enum/thread/information_class'
require_relative '../enum/process/creation_mitigation_policy'
require_relative '../enum/process/creation_flag'

require_relative '../struct/processor/processor_number'
require_relative '../struct/processor/group_affinity'
require_relative '../struct/time/file_time'
require_relative '../struct/thread/thread_pool_stack_information'

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


    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpinitializecallbackenviron
    # VOID TpInitializeCallbackEnviron(_Out_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # def self.TpInitializeCallbackEnviron(callbackEnviron) end
    # attach_function 'TpInitializeCallbackEnviron', [:pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpdestroycallbackenviron
    # VOID TpDestroyCallbackEnviron(_In_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # def self.TpDestroyCallbackEnviron(callbackEnviron) end
    # attach_function 'TpDestroyCallbackEnviron', [:pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackactivationcontext
    # VOID TpSetCallbackActivationContext(
    #   _Inout_  PTP_CALLBACK_ENVIRON       CallbackEnviron,
    #   _In_opt_ struct _ACTIVATION_CONTEXT *ActivationContext)
    # def self.TpSetCallbackActivationContext(callbackEnviron, activationContext) end
    # attach_function 'TpSetCallbackActivationContext', [:pointer, :pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackcleanupgroup
    # VOID TpSetCallbackCleanupGroup(
    #   _Inout_  PTP_CALLBACK_ENVIRON              CallbackEnviron,
    #   _In_     PTP_CLEANUP_GROUP                 CleanupGroup,
    #   _In_opt_ PTP_CLEANUP_GROUP_CANCEL_CALLBACK CleanupGroupCancelCallback)
    # def self.TpSetCallbackCleanupGroup(callbackEnviron, cleanupGroup, cleanupGroupCancelCallback) end
    # attach_function 'TpSetCallbackCleanupGroup', [:pointer, :pointer, :pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackfinalizationcallback
    # VOID TpSetCallbackFinalizationCallback(
    #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
    #   _In_    PTP_SIMPLE_CALLBACK  FinalizationCallback)
    # def self.TpSetCallbackFinalizationCallback(callbackEnviron, finalizationCallback) end
    # attach_function 'TpSetCallbackFinalizationCallback', [:pointer, :pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbacklongfunction
    # VOID TpSetCallbackLongFunction(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # def self.TpSetCallbackLongFunction(callbackEnviron) end
    # attach_function 'TpSetCallbackLongFunction', [:pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbacknoactivationcontext
    # VOID TpSetCallbackNoActivationContext(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # def self.TpSetCallbackNoActivationContext(callbackEnviron) end
    # attach_function 'TpSetCallbackNoActivationContext', [:pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackpersistent
    # VOID TpSetCallbackPersistent(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron)
    # def self.TpSetCallbackPersistent(callbackEnviron) end
    # attach_function 'TpSetCallbackPersistent', [:pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackracewithdll
    # VOID TpSetCallbackRaceWithDll(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron, _In_ PVOID DllHandle)
    # def self.TpSetCallbackRaceWithDll(callbackEnviron, dllHandle) end
    # attach_function 'TpSetCallbackRaceWithDll', [:pointer, :pointer], :void

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackthreadpool
    # VOID TpSetCallbackThreadpool(_Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron, _In_ PTP_POOL Pool)
    # def self.TpSetCallbackThreadpool(callbackEnviron, pool) end
    # attach_function 'TpSetCallbackThreadpool', [:pointer, :pointer], :void

    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682660
      # VOID CALLBACK FiberProc(_In_ PVOID lpParameter)
      FiberProc = callback 'FiberProc', [:pointer], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nc-winnt-pfls_callback_function
      # VOID FlsCallback(_In_ PVOID lpFlsData)
      FlsCallback = callback 'FlsCallback', [:void], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686736
      # DWORD ThreadProc(_In_ LPVOID lpParameter)
      ThreadProc = callback 'ThreadProc', [:pointer], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-bindiocompletioncallback
      # BOOL BindIoCompletionCallback(
      #   _In_ HANDLE                          FileHandle,
      #   _In_ LPOVERLAPPED_COMPLETION_ROUTINE Function,
      #   _In_ ULONG                           Flags)
      def self.BindIoCompletionCallback(fileHandle, function, flags) end
      attach_function 'BindIoCompletionCallback', [:handle, :pointer, :ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-convertfibertothread
      # BOOL ConvertFiberToThread(void)
      def self.ConvertFiberToThread; end
      attach_function 'ConvertFiberToThread', [], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-convertthreadtofiber
      # LPVOID ConvertThreadToFiber(_In_opt_ LPVOID lpParameter)
      def self.ConvertThreadToFiber(lpParameter) end
      attach_function 'ConvertThreadToFiber', [:pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createfiber
      # LPVOID CreateFiber(
      #   _In_     SIZE_T                dwStackSize,
      #   _In_     LPFIBER_START_ROUTINE lpStartAddress,
      #   _In_opt_ LPVOID                lpParameter)
      def self.CreateFiber(dwStackSize, lpStartAddress, lpParameter) end
      attach_function 'CreateFiber', [:size_t, FiberProc, :pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createfiberex
      # LPVOID CreateFiberEx(
      #   _In_     SIZE_T                dwStackCommitSize,
      #   _In_     SIZE_T                dwStackReserveSize,
      #   _In_     DWORD                 dwFlags,
      #   _In_     LPFIBER_START_ROUTINE lpStartAddress,
      #   _In_opt_ LPVOID                lpParameter)
      def self.CreateFiberEx(dwStackCommitSize, dwStackReserveSize, dwFlags, lpStartAddress, lpParameter) end
      attach_function 'CreateFiberEx', [:size_t, :size_t, :dword, FiberProc, :pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread
      # HANDLE CreateRemoteThread(
      #   _In_   HANDLE hProcess,
      #   _In_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #   _In_   SIZE_T dwStackSize,
      #   _In_   LPTHREAD_START_ROUTINE lpStartAddress,
      #   _In_   LPVOID lpParameter,
      #   _In_   DWORD dwCreationFlags,
      #   _Out_  LPDWORD lpThreadId )
      def self.CreateRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter,
          dwCreationFlags, lpThreadId) end
      attach_function 'CreateRemoteThread',
                      [:handle, SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, ProcessCreationFlag,
                       :pointer], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread
      # HANDLE CreateThread(
      #   _In_opt_   LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #   _In_       SIZE_T dwStackSize,
      #   _In_       LPTHREAD_START_ROUTINE lpStartAddress,
      #   _In_opt_   LPVOID lpParameter,
      #   _In_       DWORD dwCreationFlags,
      #   _Out_opt_  LPDWORD lpThreadId )
      def self.CreateThread(lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId)
      end
      attach_function 'CreateThread', [SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, :dword, :pointer], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deletefiber
      # VOID DeleteFiber(_In_ LPVOID lpFiber)
      def self.DeleteFiber(lpFiber) end
      attach_function 'DeleteFiber', [:pointer], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread
      # VOID ExitThread( _In_  DWORD dwExitCode )
      def self.ExitThread(dwExitCode) end
      attach_function 'ExitThread', [:dword], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread
      # HANDLE GetCurrentThread(void)
      def self.GetCurrentThread; end
      attach_function 'GetCurrentThread', [], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid
      # DWORD GetCurrentThreadId(void)
      def self.GetCurrentThreadId; end
      attach_function 'GetCurrentThreadId', [], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread
      # BOOL GetExitCodeThread( _In_   HANDLE hThread, _Out_  LPDWORD lpExitCode )
      def self.GetExitCodeThread(hThread, lpExitCode) end
      attach_function 'GetExitCodeThread', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadpriority
      # int GetThreadPriority( _In_  HANDLE hThread )
      def self.GetThreadPriority(hThread) end
      attach_function 'GetThreadPriority', [:handle], :int

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadpriority
      # BOOL GetThreadPriorityBoost( _In_   HANDLE hThread, _Out_  PBOOL pDisablePriorityBoost )
      def self.GetThreadPriorityBoost(hThread, pDisablePriorityBoost) end
      attach_function 'GetThreadPriorityBoost', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadtimes
      # BOOL GetThreadTimes(
      #   _In_   HANDLE hThread,
      #   _Out_  LPFILETIME lpCreationTime,
      #   _Out_  LPFILETIME lpExitTime,
      #   _Out_  LPFILETIME lpKernelTime,
      #   _Out_  LPFILETIME lpUserTime )
      def self.GetThreadTimes(hThread, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime) end
      attach_function 'GetThreadTimes',
                      [:handle, FILETIME.ptr(:out), FILETIME.ptr(:out), FILETIME.ptr(:out), FILETIME.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread
      # HANDLE OpenThread( _In_  DWORD dwDesiredAccess, _In_  BOOL bInheritHandle, _In_  DWORD dwThreadId )
      def self.OpenThread(dwDesiredAccess, bInheritHandle, dwThreadId) end
      attach_function 'OpenThread', [:dword, :bool, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684957
      # BOOL QueueUserWorkItem(
      #   _In_     LPTHREAD_START_ROUTINE Function,
      #   _In_opt_ PVOID                  Context,
      #   _In_     ULONG                  Flags)
      def self.QueueUserWorkItem(function, context, flags) end
      attach_function 'QueueUserWorkItem', [ThreadProc, :pointer, :ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-resumethread
      # DWORD ResumeThread( _In_  HANDLE hThread )
      def self.ResumeThread(hThread) end
      attach_function 'ResumeThread', [:handle], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadaffinitymask
      # DWORD_PTR SetThreadAffinityMask( _In_  HANDLE hThread, _In_  DWORD_PTR dwThreadAffinityMask )
      def self.SetThreadAffinityMask(hThread, dwThreadAffinityMask) end
      attach_function 'SetThreadAffinityMask', [:handle, :dword_ptr], :dword_ptr

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686253
      # DWORD SetThreadIdealProcessor( _In_  HANDLE hThread, _In_  DWORD dwIdealProcessor )
      def self.SetThreadIdealProcessor(hThread, dwIdealProcessor) end
      attach_function 'SetThreadIdealProcessor', [:handle, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority
      # BOOL SetThreadPriority( _In_  HANDLE hThread, _In_  int nPriority )
      def self.SetThreadPriority(hThread, nPriority) end
      attach_function 'SetThreadPriority', [:handle, :int], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriorityboost
      # BOOL SetThreadPriorityBoost( _In_  HANDLE hThread, _In_  BOOL DisablePriorityBoost )
      def self.SetThreadPriorityBoost(hThread, disablePriorityBoost) end
      attach_function 'SetThreadPriorityBoost', [:handle, :bool], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-sleep
      # VOID Sleep(_In_ DWORD dwMilliseconds)
      def self.Sleep(dwMilliseconds) end
      attach_function 'Sleep', [:dword], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-sleepex
      # DWORD SleepEx( _In_ DWORD dwMilliseconds, _In_ BOOL  bAlertable)
      def self.SleepEx(dwMilliseconds, bAlertable) end
      attach_function 'SleepEx', [:dword, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-suspendthread
      # DWORD SuspendThread( _In_  HANDLE hThread )
      def self.SuspendThread(hThread) end
      attach_function 'SuspendThread', [:handle], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-switchtofiber
      # VOID SwitchToFiber(_In_ LPVOID lpFiber)
      def self.SwitchToFiber(lpFiber) end
      attach_function 'SwitchToFiber', [:pointer], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-switchtothread
      # BOOL SwitchToThread(void)
      def self.SwitchToThread; end
      attach_function 'SwitchToThread', [], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminatethread
      # BOOL TerminateThread( _Inout_  HANDLE hThread, _In_     DWORD dwExitCode )
      def self.TerminateThread(hThread, dwExitCode) end
      attach_function 'TerminateThread', [:handle, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsalloc
      # DWORD TlsAlloc(void)
      def self.TlsAlloc; end
      attach_function 'TlsAlloc', [], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsfree
      # BOOL TlsFree( _In_  DWORD dwTlsIndex )
      def self.TlsFree(dwTlsIndex) end
      attach_function 'TlsFree', [:dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsgetvalue
      # LPVOID TlsGetValue( _In_  DWORD dwTlsIndex )
      def self.TlsGetValue(dwTlsIndex) end
      attach_function 'TlsGetValue', [:dword], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlssetvalue
      # BOOL TlsSetValue( _In_      DWORD dwTlsIndex, _In_opt_  LPVOID lpTlsValue )
      def self.TlsSetValue(dwTlsIndex, lpTlsValue) end
      attach_function 'TlsSetValue', [:dword, :pointer], :bool

      if WinFFI.x64?
        # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadstackguarantee
        # BOOL SetThreadStackGuarantee(_Inout_ PULONG StackSizeInBytes)
        def self.SetThreadStackGuarantee(stackSizeInBytes) end
        attach_function 'SetThreadStackGuarantee', [:pointer], :bool
      end

      if WINDOWS_VERSION >= :server2003 || (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 1)
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683234
        # BOOL GetThreadIOPendingFlag( _In_     HANDLE hThread, _Inout_  PBOOL lpIOIsPending )
        def self.GetThreadIOPendingFlag(hThread, lpIOIsPending) end
        attach_function 'GetThreadIOPendingFlag', [:ulong, :pointer], :bool

        if WINDOWS_VERSION >= :server2003
          # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadid
          # DWORD GetThreadId(_In_ HANDLE Thread)
          def self.GetThreadId(thread) end
          attach_function 'GetThreadId', [:handle], :dword

          if WINDOWS_VERSION >= :vista

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682018
            # VOID CALLBACK CleanupGroupCancelCallback(
            #   _Inout_opt_ PVOID ObjectContext,
            #   _Inout_opt_ PVOID CleanupContext)
            CleanupGroupCancelCallback = callback 'CleanupGroupCancelCallback', [:pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684124
            # VOID CALLBACK IoCompletionCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context,
            #   _Inout_opt_ PVOID                 Overlapped,
            #   _In_        ULONG                 IoResult,
            #   _In_        ULONG_PTR             NumberOfBytesTransferred,
            #   _Inout_     PTP_IO                Io)
            IoCompletionCallback = callback 'IoCompletionCallback',
                                            [:pointer, :pointer, :pointer, :ulong, :ulong_ptr, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686295
            # VOID CALLBACK SimpleCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context)
            SimpleCallback = callback 'SimpleCallback', [:pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686790
            # VOID CALLBACK TimerCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context,
            #   _Inout_     PTP_TIMER             Timer)
            TimerCallback = callback 'TimerCallback', [:pointer, :pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687017
            # VOID CALLBACK WaitCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context,
            #   _Inout_     PTP_WAIT              Wait,
            #   _In_        TP_WAIT_RESULT        WaitResult)
            WaitCallback = callback 'WaitCallback', [:pointer, :pointer, :pointer, :pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687396
            # VOID CALLBACK WorkCallback(
            #   _Inout_     PTP_CALLBACK_INSTANCE Instance,
            #   _Inout_opt_ PVOID                 Context,
            #   _Inout_     PTP_WORK              Work)
            WorkCallback = callback 'WorkCallback', [:pointer, :pointer, :pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-callbackmayrunlong
            # BOOL CallbackMayRunLong(_Inout_ PTP_CALLBACK_INSTANCE pci)
            def self.CallbackMayRunLong(pci) end
            attach_function 'CallbackMayRunLong', [:pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio
            # VOID CancelThreadpoolIo(_Inout_ PTP_IO pio)
            def self.CancelThreadpoolIo(pio) end
            attach_function 'CancelThreadpoolIo', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpool
            # VOID CloseThreadpool(_Inout_ PTP_POOL ptpp)
            def self.CloseThreadpool(ptpp) end
            attach_function 'CloseThreadpool', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroup
            # VOID CloseThreadpoolCleanupGroup(_Inout_ PTP_CLEANUP_GROUP ptpcg)
            def self.CloseThreadpoolCleanupGroup(ptpcg) end
            attach_function 'CloseThreadpoolCleanupGroup', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers
            # VOID CloseThreadpoolCleanupGroupMembers(
            #   _Inout_     PTP_CLEANUP_GROUP ptpcg,
            #   _In_        BOOL              fCancelPendingCallbacks,
            #   _Inout_opt_ PVOID             pvCleanupContext)
            def self.CloseThreadpoolCleanupGroupMembers(ptpcg, fCancelPendingCallbacks, pvCleanupContext) end
            attach_function 'CloseThreadpoolCleanupGroupMembers', [:pointer, :bool, :pointer], :void


            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolio
            # VOID CloseThreadpoolIo(_Inout_ PTP_IO pio)
            def self.CloseThreadpoolIo(pio) end
            attach_function 'CloseThreadpoolIo', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpooltimer
            # VOID CloseThreadpoolTimer(_Inout_ PTP_TIMER pti)
            def self.CloseThreadpoolTimer(pti) end
            attach_function 'CloseThreadpoolTimer', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwait
            # VOID CloseThreadpoolWait(_Inout_ PTP_WAIT pwa)
            def self.CloseThreadpoolWait(pwa) end
            attach_function 'CloseThreadpoolWait', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwork
            # VOID CloseThreadpoolWork(_Inout_ PTP_WORK pwk)
            def self.CloseThreadpoolWork(pwk) end
            attach_function 'CloseThreadpoolWork', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-convertthreadtofiberex
            # LPVOID ConvertThreadToFiberEx( _In_opt_ LPVOID lpParameter, _In_     DWORD  dwFlags)
            def self.ConvertThreadToFiberEx(lpParameter, dwFlags) end
            attach_function 'ConvertThreadToFiberEx', [:pointer, :dword], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool
            # PTP_POOL CreateThreadpool(_Reserved_ PVOID reserved)
            def self.CreateThreadpool(reserved) end
            attach_function 'CreateThreadpool', [:pointer], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup
            # PTP_CLEANUP_GROUP CreateThreadpoolCleanupGroup(void)
            def self.CreateThreadpoolCleanupGroup; end
            attach_function 'CreateThreadpoolCleanupGroup', [], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio
            # PTP_IO CreateThreadpoolIo(
            #   _In_        HANDLE                fl,
            #   _In_        PTP_WIN32_IO_CALLBACK pfnio,
            #   _Inout_opt_ PVOID                 pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON  pcbe)
            def self.CreateThreadpoolIo(fl, pfnio, pv, pcbe) end
            attach_function 'CreateThreadpoolIo', [:handle, IoCompletionCallback, :pointer, :pointer], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer
            # PTP_TIMER CreateThreadpoolTimer(
            #   _In_        PTP_TIMER_CALLBACK   pfnti,
            #   _Inout_opt_ PVOID                pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
            def self.CreateThreadpoolTimer(pfnti, pv, pcbe) end
            attach_function 'CreateThreadpoolTimer', [TimerCallback, :void, :pointer], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait
            # PTP_WAIT CreateThreadpoolWait(
            #   _In_        PTP_WAIT_CALLBACK    pfnwa,
            #   _Inout_opt_ PVOID                pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
            def self.CreateThreadpoolWait(pfnwa, pv, pcbe) end
            attach_function 'CreateThreadpoolWait', [WaitCallback, :pointer, :pointer], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682478
            # PTP_WORK CreateThreadpoolWork(
            #   _In_        PTP_WORK_CALLBACK    pfnwk,
            #   _Inout_opt_ PVOID                pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
            def self.CreateThreadpoolWork(pfnwk, pv, pcbe) end
            attach_function 'CreateThreadpoolWork', [WorkCallback, :pointer, :pointer], :pointer

            # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-deleteprocthreadattributelist
            # VOID DeleteProcThreadAttributeList(_Inout_ LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList)
            def self.DeleteProcThreadAttributeList(lpAttributeList) end
            attach_function 'DeleteProcThreadAttributeList', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-destroythreadpoolenvironment
            # VOID DestroyThreadpoolEnvironment(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
            # def self.DestroyThreadpoolEnvironment(pcbe) end
            # attach_function 'DestroyThreadpoolEnvironment', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-disassociatecurrentthreadfromcallback
            # VOID DisassociateCurrentThreadFromCallback(_Inout_ PTP_CALLBACK_INSTANCE pci)
            def self.DisassociateCurrentThreadFromCallback(pci) end
            attach_function 'DisassociateCurrentThreadFromCallback', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682664
            # DWORD FlsAlloc(_In_ PFLS_CALLBACK_FUNCTION lpCallback)
            def self.FlsAlloc(lpCallback) end
            attach_function 'FlsAlloc', [FlsCallback], :dword

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682667
            # BOOL FlsFree(_In_ DWORD dwFlsIndex)
            def self.FlsFree(dwFlsIndex) end
            attach_function 'FlsFree', [:dword], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683141
            # PVOID FlsGetValue(_In_ DWORD dwFlsIndex)
            def self.FlsGetValue(dwFlsIndex) end
            attach_function 'FlsGetValue', [:dword], :pointer

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683146
            # BOOL FlsSetValue( _In_     DWORD dwFlsIndex, _In_opt_ PVOID lpFlsData)
            def self.FlsSetValue(dwFlsIndex, lpFlsData) end
            attach_function 'FlsSetValue', [:dword, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-freelibrarywhencallbackreturns
            # VOID FreeLibraryWhenCallbackReturns(_Inout_ PTP_CALLBACK_INSTANCE pci, _In_ HMODULE mod)
            def self.FreeLibraryWhenCallbackReturns(pci, mod) end
            attach_function 'FreeLibraryWhenCallbackReturns', [:pointer, :hmodule], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessidofthread
            # DWORD GetProcessIdOfThread(_In_ HANDLE Thread)
            def self.GetProcessIdOfThread(thread) end
            attach_function 'GetProcessIdOfThread', [:handle], :dword

            # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist
            # BOOL InitializeProcThreadAttributeList(
            #   _Out_opt_  LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
            #   _In_       DWORD                        dwAttributeCount,
            #   _Reserved_ DWORD                        dwFlags,
            #   _Inout_    PSIZE_T                      lpSize)
            def self.InitializeProcThreadAttributeList(lpAttributeList, dwAttributeCount, dwFlags, lpSize) end
            attach_function 'InitializeProcThreadAttributeList', [:pointer, :dword, :dword, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-initializethreadpoolenvironment
            # VOID InitializeThreadpoolEnvironment(_Out_ PTP_CALLBACK_ENVIRON pcbe)
            # def self.InitializeThreadpoolEnvironment(pcbe) end
            # attach_function 'InitializeThreadpoolEnvironment', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684131
            # BOOL IsThreadAFiber(void)
            def self.IsThreadAFiber; end
            attach_function 'IsThreadAFiber', [], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-isthreadpooltimerset
            # BOOL IsThreadpoolTimerSet(_Inout_ PTP_TIMER pti)
            def self.IsThreadpoolTimerSet(pti) end
            attach_function 'IsThreadpoolTimerSet', [:pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-leavecriticalsectionwhencallbackreturns
            # VOID LeaveCriticalSectionWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _Inout_ PCRITICAL_SECTION     pcs)
            def self.LeaveCriticalSectionWhenCallbackReturns(pci, pcs) end
            attach_function 'LeaveCriticalSectionWhenCallbackReturns', [:pointer, :pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-querythreadcycletime
            # BOOL QueryThreadCycleTime( _In_  HANDLE   ThreadHandle, _Out_ PULONG64 CycleTime)
            def self.QueryThreadCycleTime(threadHandle, cycleTime) end
            attach_function 'QueryThreadCycleTime', [:handle, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-releasemutexwhencallbackreturns
            # VOID ReleaseMutexWhenCallbackReturns( _Inout_ PTP_CALLBACK_INSTANCE pci, _In_ HANDLE mut)
            def self.ReleaseMutexWhenCallbackReturns(pci, mut) end
            attach_function 'ReleaseMutexWhenCallbackReturns', [:pointer, :handle], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-releasesemaphorewhencallbackreturns
            # VOID ReleaseSemaphoreWhenCallbackReturns(
            #   _Inout_ PTP_CALLBACK_INSTANCE pci,
            #   _In_    HANDLE                sem,
            #   _In_    DWORD                 crel)
            def self.ReleaseSemaphoreWhenCallbackReturns(pci, sem, crel) end
            attach_function 'ReleaseSemaphoreWhenCallbackReturns', [:pointer, :handle, :dword], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-seteventwhencallbackreturns
            # VOID SetEventWhenCallbackReturns(_Inout_ PTP_CALLBACK_INSTANCE pci, _In_ HANDLE evt)
            def self.SetEventWhenCallbackReturns(pci, evt) end
            attach_function 'SetEventWhenCallbackReturns', [:pointer, :handle], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackcleanupgroup
            # VOID SetThreadpoolCallbackCleanupGroup(
            #   _Inout_  PTP_CALLBACK_ENVIRON              pcbe,
            #   _In_     PTP_CLEANUP_GROUP                 ptpcg,
            #   _In_opt_ PTP_CLEANUP_GROUP_CANCEL_CALLBACK pfng)
            # def self.SetThreadpoolCallbackCleanupGroup(pcbe, ptpcg, pfng) end
            # attach_function 'SetThreadpoolCallbackCleanupGroup', [:pointer, :pointer, :pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbacklibrary
            # VOID SetThreadpoolCallbackLibrary( _Inout_ PTP_CALLBACK_ENVIRON pcbe, _In_ PVOID mod)
            # def self.SetThreadpoolCallbackLibrary(pcbe, mod) end
            # attach_function 'SetThreadpoolCallbackLibrary', [:pointer, :pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackpool
            # VOID SetThreadpoolCallbackPool(_Inout_ PTP_CALLBACK_ENVIRON pcbe, _In_ PTP_POOL ptpp)
            # def self.SetThreadpoolCallbackPool(pcbe, ptpp) end
            # attach_function 'SetThreadpoolCallbackPool', [:pointer, :pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackrunslong
            # VOID SetThreadpoolCallbackRunsLong(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
            # def self.SetThreadpoolCallbackRunsLong(pcbe) end
            # attach_function 'SetThreadpoolCallbackRunsLong',[:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686266
            # VOID SetThreadpoolThreadMaximum( _Inout_ PTP_POOL ptpp, _In_    DWORD    cthrdMost)
            def self.SetThreadpoolThreadMaximum(ptpp, cthrdMost) end
            attach_function 'SetThreadpoolThreadMaximum', [:pointer, :dword], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadminimum
            # BOOL SetThreadpoolThreadMinimum( _Inout_ PTP_POOL ptpp, _In_    DWORD    cthrdMic)
            def self.SetThreadpoolThreadMinimum(ptpp, cthrdMic) end
            attach_function 'SetThreadpoolThreadMinimum', [:pointer, :dword], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimer
            # VOID SetThreadpoolTimer(
            #   _Inout_  PTP_TIMER pti,
            #   _In_opt_ PFILETIME pftDueTime,
            #   _In_     DWORD     msPeriod,
            #   _In_opt_ DWORD     msWindowLength)
            def self.SetThreadpoolTimer(pti, pftDueTime, msPeriod, msWindowLength) end
            attach_function 'SetThreadpoolTimer', [:pointer, FILETIME.ptr, :dword, :dword], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimerex
            # BOOL SetThreadpoolTimerEx(
            #   _Inout_  PTP_TIMER pti,
            #   _In_opt_ PFILETIME pftDueTime,
            #   _In_     DWORD     msPeriod,
            #   _In_opt_ DWORD     msWindowLength)
            def self.SetThreadpoolTimerEx(pti, pftDueTime, msPeriod, msWindowLength) end
            attach_function 'SetThreadpoolTimerEx', [:pointer, FILETIME.ptr, :dword, :dword], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait
            # VOID SetThreadpoolWait(_Inout_ PTP_WAIT pwa, _In_opt_ HANDLE h, _In_opt_ PFILETIME pftTimeout)
            def self.SetThreadpoolWait(pwa, h, pftTimeout) end
            attach_function 'SetThreadpoolWait', [:pointer, :handle, FILETIME.ptr], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-startthreadpoolio
            # VOID StartThreadpoolIo(_Inout_ PTP_IO pio)
            def self.StartThreadpoolIo(pio) end
            attach_function 'StartThreadpoolIo', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-submitthreadpoolwork
            # VOID SubmitThreadpoolWork(_Inout_ PTP_WORK pwk)
            def self.SubmitThreadpoolWork(pwk) end
            attach_function 'SubmitThreadpoolWork', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-trysubmitthreadpoolcallback
            # BOOL TrySubmitThreadpoolCallback(
            #   _In_        PTP_SIMPLE_CALLBACK  pfns,
            #   _Inout_opt_ PVOID                pv,
            #   _In_opt_    PTP_CALLBACK_ENVIRON pcbe)
            def self.TrySubmitThreadpoolCallback(pfns, pv, pcbe) end
            attach_function 'TrySubmitThreadpoolCallback', [SimpleCallback, :pointer, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-updateprocthreadattribute
            # BOOL UpdateProcThreadAttribute(
            #   _Inout_   LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
            #   _In_      DWORD                        dwFlags,
            #   _In_      DWORD_PTR                    Attribute,
            #   _In_      PVOID                        lpValue,
            #   _In_      SIZE_T                       cbSize,
            #   _Out_opt_ PVOID                        lpPreviousValue,
            #   _In_opt_  PSIZE_T                      lpReturnSize)
            def self.UpdateProcThreadAttribute(lpAttributeList, dwFlags, attribute, lpValue, cbSize, lpPreviousValue,
                lpReturnSize) end
            attach_function 'UpdateProcThreadAttribute',
                            [:pointer, :dword, ProcessCreationMitigationPolicy, :pointer, :size_t, :pointer, :pointer],
                            :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooliocallbacks
            # VOID WaitForThreadpoolIoCallbacks( _Inout_ PTP_IO pio, _In_    BOOL   fCancelPendingCallbacks)
            def self.WaitForThreadpoolIoCallbacks(pio, fCancelPendingCallbacks) end
            attach_function 'WaitForThreadpoolIoCallbacks', [:pointer, :bool], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooltimercallbacks
            # VOID WaitForThreadpoolTimerCallbacks(_Inout_ PTP_TIMER pti, _In_ BOOL fCancelPendingCallbacks)
            def self.WaitForThreadpoolTimerCallbacks(pti, fCancelPendingCallbacks) end
            attach_function 'WaitForThreadpoolTimerCallbacks', [:pointer, :bool], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolwaitcallbacks
            # VOID WaitForThreadpoolWaitCallbacks(_Inout_ PTP_WAIT pwa, _In_ BOOL fCancelPendingCallbacks)
            def self.WaitForThreadpoolWaitCallbacks(pwa, fCancelPendingCallbacks) end
            attach_function 'WaitForThreadpoolWaitCallbacks', [:pointer, :bool], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolworkcallbacks
            # VOID WaitForThreadpoolWorkCallbacks( _Inout_ PTP_WORK pwk, _In_ BOOL fCancelPendingCallbacks)
            def self.WaitForThreadpoolWorkCallbacks(pwk, fCancelPendingCallbacks) end
            attach_function 'WaitForThreadpoolWorkCallbacks', [:pointer, :bool], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-wow64suspendthread
            # DWORD Wow64SuspendThread(_In_ HANDLE hThread)
            def self.Wow64SuspendThread(hThread) end
            attach_function 'Wow64SuspendThread', [:handle], :dword

            if WINDOWS_VERSION >= 7
              # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethreadex
              # HANDLE CreateRemoteThreadEx(
              #   _In_      HANDLE                       hProcess,
              #   _In_opt_  LPSECURITY_ATTRIBUTES        lpThreadAttributes,
              #   _In_      SIZE_T                       dwStackSize,
              #   _In_      LPTHREAD_START_ROUTINE       lpStartAddress,
              #   _In_opt_  LPVOID                       lpParameter,
              #   _In_      DWORD                        dwCreationFlags,
              #   _In_opt_  LPPROC_THREAD_ATTRIBUTE_LIST lpAttributeList,
              #   _Out_opt_ LPDWORD                      lpThreadId)
              def self.CreateRemoteThreadEx(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter,
                  dwCreationFlags, lpAttributeList, lpThreadId) end
              attach_function 'CreateRemoteThreadEx',
                              [:handle, SECURITY_ATTRIBUTES.ptr(:in), :size_t, ThreadProc, :pointer, ProcessCreationFlag,
                               :pointer, :pointer], :handle

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd796392
              # DWORD DisableThreadProfiling(_In_ HANDLE PerformanceDataHandle)
              def self.DisableThreadProfiling(performanceDataHandle) end
              attach_function 'DisableThreadProfiling', [:handle], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd796393
              # DWORD EnableThreadProfiling(
              #   _In_  HANDLE  ThreadHandle,
              #   _In_  DWORD   Flags,
              #   _In_  DWORD64 HardwareCounters,
              #   _Out_ HANDLE  PerformanceDataHandle)
              def self.EnableThreadProfiling(threadHandle, flags, hardwareCounters, performanceDataHandle) end
              attach_function 'EnableThreadProfiling', [:handle, :dword, :dword64, :handle], :dword

              # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405498
              # BOOL GetThreadGroupAffinity( _In_  HANDLE          hThread, _Out_ PGROUP_AFFINITY GroupAffinity)
              def self.GetThreadGroupAffinity(hThread, groupAffinity) end
              attach_function 'GetThreadGroupAffinity', [:handle, GROUP_AFFINITY.ptr(:out)], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadidealprocessorex
              # BOOL GetThreadIdealProcessorEx( _In_  HANDLE hThread, _Out_ PPROCESSOR_NUMBER lpIdealProcessor)
              def self.GetThreadIdealProcessorEx(hThread, lpIdealProcessor) end
              attach_function 'GetThreadIdealProcessorEx', [:handle, PROCESSOR_NUMBER.ptr(:out)], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-querythreadpoolstackinformation
              # BOOL QueryThreadpoolStackInformation( _In_  PTP_POOL ptpp, _Out_ PTP_POOL_STACK_INFORMATION ptpsi)
              def self.QueryThreadpoolStackInformation(ptpp, ptpsi) end
              attach_function 'QueryThreadpoolStackInformation', [:pointer, TP_POOL_STACK_INFORMATION.ptr(:out)], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadidealprocessorex
              # BOOL SetThreadIdealProcessorEx(
              #   _In_      HANDLE            hThread,
              #   _In_      PPROCESSOR_NUMBER lpIdealProcessor,
              #   _Out_opt_ PPROCESSOR_NUMBER lpPreviousIdealProcessor)
              def self.SetThreadIdealProcessorEx(hThread, lpIdealProcessor, lpPreviousIdealProcessor) end
              attach_function 'SetThreadIdealProcessorEx', [:handle, PROCESSOR_NUMBER.ptr(:in), PROCESSOR_NUMBER.ptr], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackpersistent
              # VOID SetThreadpoolCallbackPersistent(_Inout_ PTP_CALLBACK_ENVIRON pcbe)
              # def self.SetThreadpoolCallbackPersistent(pcbe) end
              # attach_function 'SetThreadpoolCallbackPersistent', [:pointer], :void

              # require_relative '../enum/thread/pool_callback_priority'
              # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setthreadpoolcallbackpriority
              # VOID SetThreadpoolCallbackPriority( _Inout_ PTP_CALLBACK_ENVIRON pcbe, _In_ TP_CALLBACK_PRIORITY Priority)
              # def self.SetThreadpoolCallbackPriority(pcbe, priority) end
              # attach_function 'SetThreadpoolCallbackPriority', [:pointer, ThreadPoolCallbackPriority], :void

              # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolstackinformation
              # BOOL SetThreadpoolStackInformation( _Inout_ PTP_POOL ptpp, _In_ PTP_POOL_STACK_INFORMATION ptpsi)
              def self.SetThreadpoolStackInformation(ptpp, ptpsi) end
              attach_function 'SetThreadpoolStackInformation', [:pointer, TP_POOL_STACK_INFORMATION.ptr(:in)], :bool

              # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-tpsetcallbackpriority
              # VOID TpSetCallbackPriority(
              #   _Inout_ PTP_CALLBACK_ENVIRON CallbackEnviron,
              #   _In_    TP_CALLBACK_PRIORITY Priority)
              # def self.TpSetCallbackPriority(callbackEnviron, priority) end
              # attach_function 'TpSetCallbackPriority', [:pointer, ThreadPoolCallbackPriority], :void

              if WINDOWS_VERSION >= 8
                # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadstacklimits
                # VOID GetCurrentThreadStackLimits( _Out_ PULONG_PTR LowLimit, _Out_ PULONG_PTR HighLimit)
                def self.GetCurrentThreadStackLimits(lowLimit, highLimit) end
                attach_function 'GetCurrentThreadStackLimits', [:pointer, :pointer], :void

                # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448382
                # BOOL  GetThreadInformation(
                #   _In_ HANDLE                   hThread,
                #   _In_ THREAD_INFORMATION_CLASS ThreadInformationClass,
                #   _Out_writes_bytes_       ThreadInformation,
                #   _In_ DWORD                    ThreadInformationSize)
                def self.GetThreadInformation(hThread, threadInformationClass, threadInformation, threadInformationSize)
                end
                attach_function 'GetThreadInformation', [:handle, ThreadInformationClass, :pointer, :dword], :bool

                # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448390
                # BOOL  SetThreadInformation(
                #   _In_ HANDLE                   hThread,
                #   _In_ THREAD_INFORMATION_CLASS ThreadInformationClass,
                #   _In_reads_bytes_         ThreadInformation,
                #   _In_ DWORD                    ThreadInformationSize)
                def self.SetThreadInformation(hThread, threadInformationClass, threadInformation, threadInformationSize)
                end
                attach_function 'SetThreadInformation', [:handle, ThreadInformationClass, :pointer, :dword], :bool

                if WINDOWS_VERSION >= 10
                  # https://docs.microsoft.com/en-us/windows/desktop/ProcThread/getthreadselectedcpusets
                  # BOOL GetThreadSelectedCpuSets(
                  #   _In_      HANDLE Thread,
                  #   _Out_opt_ PULONG CpuSetIds,
                  #   _In_      ULONG  CpuSetIdCount,
                  #   _Out_     PULONG RequiredIdCount)
                  def self.GetThreadSelectedCpuSets(thread, cpuSetIds, cpuSetIdCount, requiredIdCount) end
                  attach_function 'GetThreadSelectedCpuSets', [:handle, :pointer, :ulong, :pointer], :bool

                  # https://docs.microsoft.com/en-us/windows/desktop/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwaitex
                  # BOOL SetThreadpoolWaitEx(
                  #   _Inout_    PTP_WAIT  pwa,
                  #   _In_opt_   HANDLE    h,
                  #   _In_opt_   PFILETIME pftTimeout,
                  #   _Reserved_ PVOID     Reserved)
                  def self.SetThreadpoolWaitEx(pwa, h, pftTimeout, reserved) end
                  attach_function 'SetThreadpoolWaitEx', [:pointer, :handle, FILETIME.ptr, :pointer], :bool

                  # https://docs.microsoft.com/en-us/windows/desktop/ProcThread/setthreadselectedcpusets
                  # BOOL SetThreadSelectedCpuSets(
                  #   _In_       HANDLE Thread,
                  #   _In_ const ULONG  *CpuSetIds,
                  #   _In_       ULONG  CpuSetIdCount)
                  def self.SetThreadSelectedCpuSets(thread, cpuSetIds, cpuSetIdCount) end
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