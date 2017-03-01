require 'win-ffi/kernel32'

require 'win-ffi/core/struct/large_integer'
require 'win-ffi/core/struct/security_attributes'

require 'win-ffi/kernel32/macro/thread/worker_thread'

require 'win-ffi/kernel32/struct/synchronization/critical_section'
require 'win-ffi/kernel32/struct/synchronization/overlapped'
require 'win-ffi/kernel32/struct/synchronization/run_once'
require 'win-ffi/kernel32/struct/synchronization/srw_lock'
require 'win-ffi/kernel32/struct/synchronization/rtl_barrier'
require 'win-ffi/kernel32/struct/synchronization/condition_variable'
require 'win-ffi/kernel32/struct/power/reason_context'

require 'win-ffi/kernel32/enum/synchronization/critical_section_flag'
require 'win-ffi/kernel32/enum/synchronization/create_waitable_flag'
require 'win-ffi/kernel32/enum/synchronization/private_namespace_flag'
require 'win-ffi/kernel32/enum/synchronization/create_event_flag'
require 'win-ffi/kernel32/enum/synchronization/create_mutex_flag'
require 'win-ffi/kernel32/enum/synchronization/init_once_flag'
require 'win-ffi/kernel32/enum/synchronization/synchronization_barrier_flag'
require 'win-ffi/kernel32/enum/synchronization/condition_variable'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687066(v=vs.85).aspx
      # VOID CALLBACK WaitOrTimerCallback(_In_ PVOID   lpParameter, _In_ BOOLEAN TimerOrWaitFired)
      WaitOrTimerCallback = callback 'WaitOrTimerCallback', [:pointer, :bool], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686786(v=vs.85).aspx
      # VOID CALLBACK TimerAPCProc(
      #   _In_opt_ LPVOID lpArgToCompletionRoutine,
      #   _In_     DWORD  dwTimerLowValue,
      #   _In_     DWORD  dwTimerHighValue)
      TimerAPCProc = callback 'TimerAPCProc', [:pointer, :dword, :dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681947(v=vs.85).aspx
      # VOID CALLBACK APCProc(_In_ ULONG_PTR dwParam)
      APCProc = callback 'APCProc', [:ulong], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681985(v=vs.85).aspx
      # BOOL WINAPI CancelWaitableTimer(_In_ HANDLE hTimer)
      attach_function 'CancelWaitableTimer', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682004(v=vs.85).aspx
      # BOOL WINAPI ChangeTimerQueueTimer(
      #   _In_opt_ HANDLE TimerQueue,
      #   _Inout_  HANDLE Timer,
      #   _In_     ULONG  DueTime,
      #   _In_     ULONG  Period)
      attach_function 'ChangeTimerQueueTimer', [:handle, :handle, :ulong, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682396(v=vs.85).aspx
      # HANDLE WINAPI CreateEvent(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
      #   _In_     BOOL                  bManualReset,
      #   _In_     BOOL                  bInitialState,
      #   _In_opt_ LPCTSTR               lpName)
      encoded_function 'CreateEvent', [SECURITY_ATTRIBUTES, :bool, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682411(v=vs.85).aspx
      # HANDLE WINAPI CreateMutex(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpMutexAttributes,
      #   _In_     BOOL                  bInitialOwner,
      #   _In_opt_ LPCTSTR               lpName)
      encoded_function 'CreateMutex', [SECURITY_ATTRIBUTES, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682438(v=vs.85).aspx
      # HANDLE WINAPI CreateSemaphore(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
      #   _In_     LONG                  lInitialCount,
      #   _In_     LONG                  lMaximumCount,
      #   _In_opt_ LPCTSTR               lpName)
      encoded_function 'CreateSemaphore', [SECURITY_ATTRIBUTES, :long, :long, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682483(v=vs.85).aspx
      # HANDLE WINAPI CreateTimerQueue(void)
      attach_function 'CreateTimerQueue', [], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682485(v=vs.85).aspx
      # BOOL WINAPI CreateTimerQueueTimer(
      #   _Out_    PHANDLE             phNewTimer,
      #   _In_opt_ HANDLE              TimerQueue,
      #   _In_     WAITORTIMERCALLBACK Callback,
      #   _In_opt_ PVOID               Parameter,
      #   _In_     DWORD               DueTime,
      #   _In_     DWORD               Period,
      #   _In_     ULONG               Flags)
      attach_function 'CreateTimerQueueTimer',
                      [:pointer, :handle, WaitOrTimerCallback, :pointer, :dword, :dword, WorkerThread], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682492(v=vs.85).aspx
      # HANDLE WINAPI CreateWaitableTimer(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpTimerAttributes,
      #   _In_     BOOL                  bManualReset,
      #   _In_opt_ LPCTSTR               lpTimerName)
      encoded_function 'CreateWaitableTimer', [SECURITY_ATTRIBUTES, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682552(v=vs.85).aspx
      # void WINAPI DeleteCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      attach_function 'DeleteCriticalSection', [CRITICAL_SECTION.ptr], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682565(v=vs.85).aspx
      # BOOL WINAPI DeleteTimerQueue(_In_ HANDLE TimerQueue)
      attach_function 'DeleteTimerQueue', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682568(v=vs.85).aspx
      # BOOL WINAPI DeleteTimerQueueEx(_In_ HANDLE TimerQueue, _In_opt_ HANDLE CompletionEvent)
      attach_function 'DeleteTimerQueueEx', [:handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682569(v=vs.85).aspx
      # BOOL WINAPI DeleteTimerQueueTimer(
      #   _In_opt_ HANDLE TimerQueue,
      #   _In_     HANDLE Timer,
      #   _In_opt_ HANDLE CompletionEvent)
      attach_function 'DeleteTimerQueueTimer', [:handle, :handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682608(v=vs.85).aspx
      # void WINAPI EnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      attach_function 'EnterCriticalSection', [CRITICAL_SECTION.ptr], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683209(v=vs.85).aspx
      # BOOL WINAPI GetOverlappedResult(
      #   _In_  HANDLE       hFile,
      #   _In_  LPOVERLAPPED lpOverlapped,
      #   _Out_ LPDWORD      lpNumberOfBytesTransferred,
      #   _In_  BOOL         bWait)
      attach_function 'GetOverlappedResult', [:handle, OVERLAPPED, :pointer, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683472(v=vs.85).aspx
      # void WINAPI InitializeCriticalSection(_Out_ LPCRITICAL_SECTION lpCriticalSection)
      attach_function 'InitializeCriticalSection', [CRITICAL_SECTION.ptr(:out)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683476(v=vs.85).aspx
      # BOOL WINAPI InitializeCriticalSectionAndSpinCount(
      #   _Out_ LPCRITICAL_SECTION lpCriticalSection,
      #   _In_  DWORD              dwSpinCount)
      attach_function 'InitializeCriticalSectionAndSpinCount', [CRITICAL_SECTION.ptr(:out), :dword], :bool

      # TODO SLIST_HEADER
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683482(v=vs.85).aspx
      # void WINAPI InitializeSListHead(_Inout_ PSLIST_HEADER ListHead)
      attach_function 'InitializeSListHead', [:pointer], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683612(v=vs.85).aspx
      # PSLIST_ENTRY WINAPI InterlockedFlushSList(_Inout_ PSLIST_HEADER ListHead)
      attach_function 'InterlockedFlushSList', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683648(v=vs.85).aspx
      # PSLIST_ENTRY WINAPI InterlockedPopEntrySList(_Inout_ PSLIST_HEADER ListHead)
      attach_function 'InterlockedPopEntrySList', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684020(v=vs.85).aspx
      # PSLIST_ENTRY WINAPI InterlockedPushEntrySList(_Inout_ PSLIST_HEADER ListHead, _Inout_ PSLIST_ENTRY  ListEntry)
      attach_function 'InterlockedPushEntrySList', [:pointer, :pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448545(v=vs.85).aspx
      # PSLIST_ENTRY  FASTCALL InterlockedPushListSList(
      #   _Inout_ PSLIST_HEADER ListHead,
      #   _Inout_ PSLIST_ENTRY  List,
      #   _Inout_ PSLIST_ENTRY  ListEnd,
      #   _In_    ULONG         Count)
      attach_function 'InterlockedPushListSList', [:pointer, :pointer, :pointer, :ulong], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh972673(v=vs.85).aspx
      # PSLIST_ENTRY WINAPI InterlockedPushListSListEx(
      #   _Inout_ PSLIST_HEADER ListHead,
      #   _Inout_ PSLIST_ENTRY  List,
      #   _Inout_ PSLIST_ENTRY  ListEnd,
      #   _In_    ULONG         Count)
      attach_function 'InterlockedPushListSListEx', [:pointer, :pointer, :pointer, :ulong], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684169(v=vs.85).aspx
      # void WINAPI LeaveCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      attach_function 'LeaveCriticalSection', [CRITICAL_SECTION.ptr], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684305(v=vs.85).aspx
      # HANDLE WINAPI OpenEvent(
      #   _In_ DWORD   dwDesiredAccess,
      #   _In_ BOOL    bInheritHandle,
      #   _In_ LPCTSTR lpName)
      encoded_function 'OpenEvent', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684315(v=vs.85).aspx
      # HANDLE WINAPI OpenMutex(
      #   _In_ DWORD   dwDesiredAccess,
      #   _In_ BOOL    bInheritHandle,
      #   _In_ LPCTSTR lpName)
      encoded_function 'OpenMutex', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684326(v=vs.85).aspx
      # HANDLE WINAPI OpenSemaphore(
      #   _In_ DWORD   dwDesiredAccess,
      #   _In_ BOOL    bInheritHandle,
      #   _In_ LPCTSTR lpName)
      encoded_function 'OpenSemaphore', [:dword, :bool, :string], :handle

      # HANDLE WINAPI OpenWaitableTimer(
      #   _In_ DWORD   dwDesiredAccess,
      #   _In_ BOOL    bInheritHandle,
      #   _In_ LPCTSTR lpTimerName)
      encoded_function 'OpenWaitableTimer', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684914(v=vs.85).aspx
      # BOOL WINAPI PulseEvent(_In_ HANDLE hEvent)
      attach_function 'PulseEvent', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684916(v=vs.85).aspx
      # USHORT WINAPI QueryDepthSList(_In_ PSLIST_HEADER ListHead)
      attach_function 'QueryDepthSList', [:pointer], :ushort

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684954(v=vs.85).aspx
      # DWORD WINAPI QueueUserAPC(
      #   _In_ PAPCFUNC  pfnAPC,
      #   _In_ HANDLE    hThread,
      #   _In_ ULONG_PTR dwData)
      attach_function 'QueueUserAPC', [APCProc, :handle, :ulong], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685061(v=vs.85).aspx
      # BOOL WINAPI RegisterWaitForSingleObject(
      #   _Out_    PHANDLE             phNewWaitObject,
      #   _In_     HANDLE              hObject,
      #   _In_     WAITORTIMERCALLBACK Callback,
      #   _In_opt_ PVOID               Context,
      #   _In_     ULONG               dwMilliseconds,
      #   _In_     ULONG               dwFlags)
      attach_function 'RegisterWaitForSingleObject',
                      [:pointer, :handle, WaitOrTimerCallback, :pointer, :ulong, WorkerThread], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685066(v=vs.85).aspx
      # BOOL WINAPI ReleaseMutex(_In_ HANDLE hMutex)
      attach_function 'ReleaseMutex', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685071(v=vs.85).aspx
      # BOOL WINAPI ReleaseSemaphore(
      #   _In_      HANDLE hSemaphore,
      #   _In_      LONG   lReleaseCount,
      #   _Out_opt_ LPLONG lpPreviousCount)
      attach_function 'ReleaseSemaphore', [:handle, :long, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685081(v=vs.85).aspx
      # BOOL WINAPI ResetEvent(_In_ HANDLE hEvent)
      attach_function 'ResetEvent', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686197(v=vs.85).aspx
      # DWORD WINAPI SetCriticalSectionSpinCount(
      #   _Inout_ LPCRITICAL_SECTION lpCriticalSection,
      #   _In_    DWORD              dwSpinCount)
      attach_function 'SetCriticalSectionSpinCount', [CRITICAL_SECTION.ptr, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686211(v=vs.85).aspx
      # BOOL WINAPI SetEvent( _In_ HANDLE hEvent)
      attach_function 'SetEvent', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686289(v=vs.85).aspx
      # BOOL WINAPI SetWaitableTimer(
      #   _In_           HANDLE           hTimer,
      #   _In_     const LARGE_INTEGER    *pDueTime,
      #   _In_           LONG             lPeriod,
      #   _In_opt_       PTIMERAPCROUTINE pfnCompletionRoutine,
      #   _In_opt_       LPVOID           lpArgToCompletionRoutine,
      #   _In_           BOOL             fResume)
      attach_function 'SetWaitableTimer', [:handle, LARGE_INTEGER, :long, TimerAPCProc, :pointer, :bool], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686293(v=vs.85).aspx
      # DWORD WINAPI SignalObjectAndWait(
      #   _In_ HANDLE hObjectToSignal,
      #   _In_ HANDLE hObjectToWaitOn,
      #   _In_ DWORD  dwMilliseconds,
      #   _In_ BOOL   bAlertable)
      attach_function 'SignalObjectAndWait', [:handle, :handle, :dword, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686857(v=vs.85).aspx
      # BOOL WINAPI TryEnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      attach_function 'TryEnterCriticalSection', [CRITICAL_SECTION.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686870(v=vs.85).aspx
      # BOOL WINAPI UnregisterWait(_In_ HANDLE WaitHandle)
      attach_function 'UnregisterWait', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686876(v=vs.85).aspx
      # BOOL WINAPI UnregisterWaitEx(_In_     HANDLE WaitHandle, _In_opt_ HANDLE CompletionEvent)
      attach_function 'UnregisterWaitEx', [:handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687025(v=vs.85).aspx
      # DWORD WINAPI WaitForMultipleObjects(
      #   _In_       DWORD  nCount,
      #   _In_ const HANDLE *lpHandles,
      #   _In_       BOOL   bWaitAll,
      #   _In_       DWORD  dwMilliseconds)
      attach_function 'WaitForMultipleObjects', [:dword, :pointer, :bool, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687028(v=vs.85).aspx
      # DWORD WINAPI WaitForMultipleObjectsEx(
      #   _In_       DWORD  nCount,
      #   _In_ const HANDLE *lpHandles,
      #   _In_       BOOL   bWaitAll,
      #   _In_       DWORD  dwMilliseconds,
      #   _In_       BOOL   bAlertable)
      attach_function 'WaitForMultipleObjectsEx', [:dword, :pointer, :bool, :dword, :bool], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687032(v=vs.85).aspx
      # DWORD WINAPI WaitForSingleObject(_In_ HANDLE hHandle, _In_ DWORD  dwMilliseconds)
      attach_function 'WaitForSingleObject', [:handle, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687036(v=vs.85).aspx
      # DWORD WINAPI WaitForSingleObjectEx(
      #   _In_ HANDLE hHandle,
      #   _In_ DWORD  dwMilliseconds,
      #   _In_ BOOL   bAlertable)
      attach_function 'WaitForSingleObjectEx', [:handle, :dword, :bool], :dword

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683490(v=vs.85).aspx
        # BOOL CALLBACK InitOnceCallback(
        #   _Inout_     PINIT_ONCE InitOnce,
        #   _Inout_opt_ PVOID      Parameter,
        #   _Out_opt_   PVOID      *Context)
        InitOnceCallback = callback 'InitOnceCallback', [RUN_ONCE.ptr, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681930(v=vs.85).aspx
        # VOID WINAPI AcquireSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
        attach_function 'AcquireSRWLockExclusive', [SRWLOCK.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681934(v=vs.85).aspx
        # VOID WINAPI AcquireSRWLockShared(_Inout_ PSRWLOCK SRWLock)
        attach_function 'AcquireSRWLockShared', [SRWLOCK.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681937(v=vs.85).aspx
        # BOOL WINAPI AddSIDToBoundaryDescriptor(_Inout_ HANDLE *BoundaryDescriptor, _In_    PSID   RequiredSid)
        attach_function 'AddSIDToBoundaryDescriptor', [:handle, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682026(v=vs.85).aspx
        # BOOLEAN WINAPI ClosePrivateNamespace(_In_ HANDLE Handle, _In_ ULONG  Flags)
        attach_function 'ClosePrivateNamespace', [:handle, PrivateNamespaceFlag], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682121(v=vs.85).aspx
        # HANDLE WINAPI CreateBoundaryDescriptor(_In_ LPCTSTR Name, _In_ ULONG   Flags)
        encoded_function 'CreateBoundaryDescriptor', [:string, :ulong], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682400(v=vs.85).aspx
        # HANDLE WINAPI CreateEventEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
        #   _In_opt_ LPCTSTR               lpName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        encoded_function 'CreateEventEx', [SECURITY_ATTRIBUTES, CreateEventFlag, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682418(v=vs.85).aspx
        # HANDLE WINAPI CreateMutexEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpMutexAttributes,
        #   _In_opt_ LPCTSTR               lpName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        encoded_function 'CreateMutexEx', [SECURITY_ATTRIBUTES, :string, CreateMutexFlag, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682419(v=vs.85).aspx
        # HANDLE WINAPI CreatePrivateNamespace(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes,
        #   _In_     LPVOID                lpBoundaryDescriptor,
        #   _In_     LPCTSTR               lpAliasPrefix)
        encoded_function 'CreatePrivateNamespace', [SECURITY_ATTRIBUTES, :pointer, :string], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682446(v=vs.85).aspx
        # HANDLE WINAPI CreateSemaphoreEx(
        #   _In_opt_   LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
        #   _In_       LONG                  lInitialCount,
        #   _In_       LONG                  lMaximumCount,
        #   _In_opt_   LPCTSTR               lpName,
        #   _Reserved_ DWORD                 dwFlags,
        #   _In_       DWORD                 dwDesiredAccess)
        encoded_function 'CreateSemaphoreEx', [SECURITY_ATTRIBUTES, :long, :long, :string, :dword, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682494(v=vs.85).aspx
        # HANDLE WINAPI CreateWaitableTimerEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpTimerAttributes,
        #   _In_opt_ LPCTSTR               lpTimerName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        encoded_function 'CreateWaitableTimerEx', [SECURITY_ATTRIBUTES, :string, CreateWaitableFlag, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682549(v=vs.85).aspx
        # VOID WINAPI DeleteBoundaryDescriptor(_In_ HANDLE BoundaryDescriptor)
        attach_function 'DeleteBoundaryDescriptor', [:handle], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683469(v=vs.85).aspx
        # VOID WINAPI InitializeConditionVariable(_Out_ PCONDITION_VARIABLE ConditionVariable)
        attach_function 'InitializeConditionVariable', [CONDITION_VARIABLE.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683477(v=vs.85).aspx
        # BOOL WINAPI InitializeCriticalSectionEx(
        #   _Out_ LPCRITICAL_SECTION lpCriticalSection,
        #   _In_  DWORD              dwSpinCount,
        #   _In_  DWORD              Flags)
        attach_function 'InitializeCriticalSectionEx', [CRITICAL_SECTION.ptr(:out), :dword, CriticalSectionFlag], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683483(v=vs.85).aspx
        # VOID WINAPI InitializeSRWLock(_Out_ PSRWLOCK SRWLock)
        attach_function 'InitializeSRWLock', [SRWLOCK.ptr(:out)], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683487(v=vs.85).aspx
        # BOOL WINAPI InitOnceBeginInitialize(
        #   _Inout_   LPINIT_ONCE lpInitOnce,
        #   _In_      DWORD       dwFlags,
        #   _Out_     PBOOL       fPending,
        #   _Out_opt_ LPVOID      *lpContext)
        attach_function 'InitOnceBeginInitialize', [RUN_ONCE, InitOnceFlag, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683491(v=vs.85).aspx
        # BOOL WINAPI InitOnceComplete(
        #   _Inout_  LPINIT_ONCE lpInitOnce,
        #   _In_     DWORD       dwFlags,
        #   _In_opt_ LPVOID      lpContext)
        attach_function 'InitOnceComplete', [RUN_ONCE.ptr, InitOnceFlag, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683493(v=vs.85).aspx
        # BOOL WINAPI InitOnceExecuteOnce(
        #   _Inout_     PINIT_ONCE    InitOnce,
        #   _In_        PINIT_ONCE_FN InitFn,
        #   _Inout_opt_ PVOID         Parameter,
        #   _Out_opt_   LPVOID        *Context)
        attach_function 'InitOnceExecuteOnce', [RUN_ONCE.ptr, InitOnceCallback, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683495(v=vs.85).aspx
        # VOID WINAPI InitOnceInitialize(_Out_ PINIT_ONCE InitOnce)
        attach_function 'InitOnceInitialize', [RUN_ONCE.ptr(:out)], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684318(v=vs.85).aspx
        # HANDLE WINAPI OpenPrivateNamespace(_In_ LPVOID  lpBoundaryDescriptor, _In_ LPCTSTR lpAliasPrefix)
        encoded_function 'OpenPrivateNamespace', [:pointer, :string], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685076(v=vs.85).aspx
        # VOID WINAPI ReleaseSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
        attach_function 'ReleaseSRWLockExclusive', [SRWLOCK.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685080(v=vs.85).aspx
        # VOID WINAPI ReleaseSRWLockShared(_Inout_ PSRWLOCK SRWLock)
        attach_function 'ReleaseSRWLockShared', [SRWLOCK.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686301(v=vs.85).aspx
        # BOOL WINAPI SleepConditionVariableCS(
        #   _Inout_ PCONDITION_VARIABLE ConditionVariable,
        #   _Inout_ PCRITICAL_SECTION   CriticalSection,
        #   _In_    DWORD               dwMilliseconds)
        attach_function 'SleepConditionVariableCS', [CONDITION_VARIABLE.ptr, CRITICAL_SECTION.ptr, :dword], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686304(v=vs.85).aspx
        # BOOL WINAPI SleepConditionVariableSRW(
        #   _Inout_ PCONDITION_VARIABLE ConditionVariable,
        #   _Inout_ PSRWLOCK            SRWLock,
        #   _In_    DWORD               dwMilliseconds,
        #   _In_    ULONG               Flags)
        attach_function 'SleepConditionVariableSRW',
                        [CONDITION_VARIABLE.ptr, SRWLOCK.ptr, :dword, ConditionVariable], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687076(v=vs.85).aspx
        # VOID WINAPI WakeAllConditionVariable(_Inout_ PCONDITION_VARIABLE ConditionVariable)
        attach_function 'WakeAllConditionVariable', [CONDITION_VARIABLE.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687080(v=vs.85).aspx
        # VOID WINAPI WakeConditionVariable(_Inout_ PCONDITION_VARIABLE ConditionVariable)
        attach_function 'WakeConditionVariable', [CONDITION_VARIABLE.ptr], :void

        if WINDOWS_VERSION >= 7
          # https://msdn.microsoft.com/en-us/library/windows/desktop/ee175818(v=vs.85).aspx
          # BOOL WINAPI AddIntegrityLabelToBoundaryDescriptor(
          #   _Inout_ HANDLE *BoundaryDescriptor,
          #   _In_    PSID   IntegrityLabel)
          attach_function 'AddIntegrityLabelToBoundaryDescriptor', [:handle, :pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405521(v=vs.85).aspx
          # BOOL WINAPI SetWaitableTimerEx(
          #   _In_       HANDLE           hTimer,
          #   _In_ const LARGE_INTEGER    *lpDueTime,
          #   _In_       LONG             lPeriod,
          #   _In_       PTIMERAPCROUTINE pfnCompletionRoutine,
          #   _In_       LPVOID           lpArgToCompletionRoutine,
          #   _In_       PREASON_CONTEXT  WakeContext,
          #   _In_       ULONG            TolerableDelay)
          attach_function 'SetWaitableTimerEx',
                          [:handle, LARGE_INTEGER, :long, TimerAPCProc, :pointer, REASON_CONTEXT.ptr(:in), :ulong],
                          :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405523(v=vs.85).aspx
          # BOOLEAN WINAPI TryAcquireSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
          attach_function 'TryAcquireSRWLockExclusive', [SRWLOCK.ptr], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405524(v=vs.85).aspx
          # BOOLEAN WINAPI TryAcquireSRWLockShared(_Inout_ PSRWLOCK SRWLock)
          attach_function 'TryAcquireSRWLockShared', [SRWLOCK.ptr], :bool

          if WINDOWS_VERSION >= 8
            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706887(v=vs.85).aspx
            # BOOL  WINAPI DeleteSynchronizationBarrier(_Inout_ LPSYNCHRONIZATION_BARRIER lpBarrier)
            attach_function 'DeleteSynchronizationBarrier', [:pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706889(v=vs.85).aspx
            # BOOL  WINAPI EnterSynchronizationBarrier(
            #   _Inout_ LPSYNCHRONIZATION_BARRIER lpBarrier,
            #   _In_    DWORD                     dwFlags)
            attach_function 'EnterSynchronizationBarrier', [:pointer, SynchronizationBarrierFlag], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448542(v=vs.85).aspx
            # WINBASEAPI BOOL WINAPI GetOverlappedResultEx(
            #   _In_  HANDLE       hFile,
            #   _In_  LPOVERLAPPED lpOverlapped,
            #   _Out_ LPDWORD      lpNumberOfBytesTransferred,
            #   _In_  DWORD        dwMilliseconds,
            #   _In_  BOOL         bAlertable)
            attach_function 'GetOverlappedResultEx', [:handle, OVERLAPPED, :pointer, :dword, :bool], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706890(v=vs.85).aspx
            # BOOL WINAPI InitializeSynchronizationBarrier(
            #   _Out_ LPSYNCHRONIZATION_BARRIER lpBarrier,
            #   _In_  LONG                      lTotalThreads,
            #   _In_  LONG                      lSpinCount)
            attach_function 'InitializeSynchronizationBarrier', [RTL_BARRIER.ptr(:out), :long, :long], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706898(v=vs.85).aspx
            # BOOL  WINAPI WaitOnAddress(
            #   _In_     VOID   volatile *Address,
            #   _In_     PVOID           CompareAddress,
            #   _In_     SIZE_T          AddressSize,
            #   _In_opt_ DWORD           dwMilliseconds)
            attach_function 'WaitOnAddress', [:pointer, :pointer, :size_t, :dword], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706899(v=vs.85).aspx
            # VOID  WINAPI WakeByAddressAll(_In_ PVOID Address)
            attach_function 'WakeByAddressAll', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706900(v=vs.85).aspx
            # VOID  WINAPI WakeByAddressSingle(_In_ PVOID Address)
            attach_function 'WakeByAddressSingle', [:pointer], :void
          end
        end
      end
    end
  end
end