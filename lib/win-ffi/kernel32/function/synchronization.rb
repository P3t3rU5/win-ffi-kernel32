module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/core/struct/large_integer'
    require 'win-ffi/core/struct/security_attributes'

    require_relative '../macro/thread/worker_thread'

    require_relative '../struct/synchronization/critical_section'
    require_relative '../struct/synchronization/overlapped'

    require_relative '../enum/synchronization/critical_section_flag'
    require_relative '../enum/synchronization/create_waitable_flag'
    require_relative '../enum/synchronization/private_namespace_flag'
    require_relative '../enum/synchronization/create_event_flag'
    require_relative '../enum/synchronization/create_mutex_flag'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687066
      # VOID CALLBACK WaitOrTimerCallback(_In_ PVOID   lpParameter, _In_ BOOLEAN TimerOrWaitFired)
      WaitOrTimerCallback = callback 'WaitOrTimerCallback', [:pointer, :bool], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686786
      # VOID CALLBACK TimerAPCProc(
      #   _In_opt_ LPVOID lpArgToCompletionRoutine,
      #   _In_     DWORD  dwTimerLowValue,
      #   _In_     DWORD  dwTimerHighValue)
      TimerAPCProc = callback 'TimerAPCProc', [:pointer, :dword, :dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681947
      # VOID CALLBACK APCProc(_In_ ULONG_PTR dwParam)
      APCProc = callback 'APCProc', [:ulong_ptr], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-cancelwaitabletimer
      # BOOL CancelWaitableTimer(_In_ HANDLE hTimer)
      def self.CancelWaitableTimer(hTimer) end
      attach_function 'CancelWaitableTimer', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682004
      # BOOL ChangeTimerQueueTimer(
      #   _In_opt_ HANDLE TimerQueue,
      #   _Inout_  HANDLE Timer,
      #   _In_     ULONG  DueTime,
      #   _In_     ULONG  Period)
      def self.ChangeTimerQueueTimer(timerQueue, timer, dueTime, period) end
      attach_function 'ChangeTimerQueueTimer', [:handle, :handle, :ulong, :ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-createeventa
      # HANDLE CreateEvent(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
      #   _In_     BOOL                  bManualReset,
      #   _In_     BOOL                  bInitialState,
      #   _In_opt_ LPCTSTR               lpName)
      def self.CreateEvent(lpEventAttributes, bManualReset, bInitialState, lpName) end
      encoded_function 'CreateEvent', [SECURITY_ATTRIBUTES, :bool, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-createmutexa
      # HANDLE CreateMutex(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpMutexAttributes,
      #   _In_     BOOL                  bInitialOwner,
      #   _In_opt_ LPCTSTR               lpName)
      def self.CreateMutex(lpMutexAttributes, bInitialOwner, lpName) end
      encoded_function 'CreateMutex', [SECURITY_ATTRIBUTES, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createsemaphorea
      # HANDLE CreateSemaphore(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
      #   _In_     LONG                  lInitialCount,
      #   _In_     LONG                  lMaximumCount,
      #   _In_opt_ LPCTSTR               lpName)
      def self.CreateSemaphore(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName) end
      encoded_function 'CreateSemaphore', [SECURITY_ATTRIBUTES, :long, :long, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682483
      # HANDLE CreateTimerQueue(void)
      def self.CreateTimerQueue; end
      attach_function 'CreateTimerQueue', [], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682485
      # BOOL CreateTimerQueueTimer(
      #   _Out_    PHANDLE             phNewTimer,
      #   _In_opt_ HANDLE              TimerQueue,
      #   _In_     WAITORTIMERCALLBACK Callback,
      #   _In_opt_ PVOID               Parameter,
      #   _In_     DWORD               DueTime,
      #   _In_     DWORD               Period,
      #   _In_     ULONG               Flags)
      def self.CreateTimerQueueTimer(phNewTimer, timerQueue, callback, parameter, dueTime, period, flags) end
      attach_function 'CreateTimerQueueTimer',
                      [:pointer, :handle, WaitOrTimerCallback, :pointer, :dword, :dword, WorkerThread], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createwaitabletimera
      # HANDLE CreateWaitableTimer(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpTimerAttributes,
      #   _In_     BOOL                  bManualReset,
      #   _In_opt_ LPCTSTR               lpTimerName)
      def self.CreateWaitableTimer(lpTimerAttributes, bManualReset, lpTimerName) end
      encoded_function 'CreateWaitableTimer', [SECURITY_ATTRIBUTES, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-deletecriticalsection
      # void DeleteCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      def self.DeleteCriticalSection(lpCriticalSection) end
      attach_function 'DeleteCriticalSection', [CRITICAL_SECTION.ptr], :void


      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deletetimerqueue
      # BOOL DeleteTimerQueue(_In_ HANDLE TimerQueue)
      def self.DeleteTimerQueue(timerQueue) end
      attach_function 'DeleteTimerQueue', [:handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682568
      # BOOL DeleteTimerQueueEx(_In_ HANDLE TimerQueue, _In_opt_ HANDLE CompletionEvent)
      def self.DeleteTimerQueueEx(timerQueue, completionEvent) end
      attach_function 'DeleteTimerQueueEx', [:handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682569
      # BOOL DeleteTimerQueueTimer( _In_opt_ HANDLE TimerQueue, _In_     HANDLE Timer, _In_opt_ HANDLE CompletionEvent)
      def self.DeleteTimerQueueTimer(timerQueue, timer, completionEvent) end
      attach_function 'DeleteTimerQueueTimer', [:handle, :handle, :handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-entercriticalsection
      # void EnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      def self.EnterCriticalSection(lpCriticalSection) end
      attach_function 'EnterCriticalSection', [CRITICAL_SECTION.ptr], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult
      # BOOL GetOverlappedResult(
      #   _In_  HANDLE       hFile,
      #   _In_  LPOVERLAPPED lpOverlapped,
      #   _Out_ LPDWORD      lpNumberOfBytesTransferred,
      #   _In_  BOOL         bWait)
      def self.GetOverlappedResult(hFile, lpOverlapped, lpNumberOfBytesTransferred, bWait) end
      attach_function 'GetOverlappedResult', [:handle, OVERLAPPED, :pointer, :bool], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsection
      # void InitializeCriticalSection(_Out_ LPCRITICAL_SECTION lpCriticalSection)
      def self.InitializeCriticalSection(lpCriticalSection) end
      attach_function 'InitializeCriticalSection', [CRITICAL_SECTION.ptr(:out)], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsectionandspincount
      # BOOL InitializeCriticalSectionAndSpinCount(_Out_ LPCRITICAL_SECTION lpCriticalSection, _In_ DWORD dwSpinCount)
      def self.InitializeCriticalSectionAndSpinCount(lpCriticalSection, dwSpinCount) end
      attach_function 'InitializeCriticalSectionAndSpinCount', [CRITICAL_SECTION.ptr(:out), :dword], :bool

      # TODO SLIST_HEADER
      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead
      # void InitializeSListHead(_Inout_ PSLIST_HEADER ListHead)
      def self.InitializeSListHead(listHead) end
      attach_function 'InitializeSListHead', [:pointer], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedflushslist
      # PSLIST_ENTRY InterlockedFlushSList(_Inout_ PSLIST_HEADER ListHead)
      def self.InterlockedFlushSList(listHead) end
      attach_function 'InterlockedFlushSList', [:pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpopentryslist
      # PSLIST_ENTRY InterlockedPopEntrySList(_Inout_ PSLIST_HEADER ListHead)
      def self.InterlockedPopEntrySList(listHead) end
      attach_function 'InterlockedPopEntrySList', [:pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpushentryslist
      # PSLIST_ENTRY InterlockedPushEntrySList(_Inout_ PSLIST_HEADER ListHead, _Inout_ PSLIST_ENTRY  ListEntry)
      def self.InterlockedPushEntrySList(listHead, listEntry) end
      attach_function 'InterlockedPushEntrySList', [:pointer, :pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448545
      # PSLIST_ENTRY  FASTCALL InterlockedPushListSList(
      #   _Inout_ PSLIST_HEADER ListHead,
      #   _Inout_ PSLIST_ENTRY  List,
      #   _Inout_ PSLIST_ENTRY  ListEnd,
      #   _In_    ULONG         Count)
      def self.InterlockedPushListSList(listHead, list, listEnd, count) end
      attach_function 'InterlockedPushListSList', [:pointer, :pointer, :pointer, :ulong], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpushlistslistex
      # PSLIST_ENTRY InterlockedPushListSListEx(
      #   _Inout_ PSLIST_HEADER ListHead,
      #   _Inout_ PSLIST_ENTRY  List,
      #   _Inout_ PSLIST_ENTRY  ListEnd,
      #   _In_    ULONG         Count)
      def self.InterlockedPushListSListEx(listHead, list, listEnd, count) end
      attach_function 'InterlockedPushListSListEx', [:pointer, :pointer, :pointer, :ulong], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-leavecriticalsection
      # void LeaveCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      def self.LeaveCriticalSection(lpCriticalSection) end
      attach_function 'LeaveCriticalSection', [CRITICAL_SECTION.ptr], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-openeventa
      # HANDLE OpenEvent( _In_ DWORD   dwDesiredAccess, _In_ BOOL    bInheritHandle, _In_ LPCTSTR lpName)
      def self.OpenEvent(dwDesiredAccess, bInheritHandle, lpName) end
      encoded_function 'OpenEvent', [:dword, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openmutexa
      # HANDLE OpenMutex( _In_ DWORD   dwDesiredAccess, _In_ BOOL    bInheritHandle, _In_ LPCTSTR lpName)
      def self.OpenMutex(dwDesiredAccess, bInheritHandle, lpName) end
      encoded_function 'OpenMutex', [:dword, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-opensemaphorea
      # HANDLE OpenSemaphore( _In_ DWORD   dwDesiredAccess, _In_ BOOL    bInheritHandle, _In_ LPCTSTR lpName)
      def self.OpenSemaphore(dwDesiredAccess, bInheritHandle, lpName) end
      encoded_function 'OpenSemaphore', [:dword, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openwaitabletimera
      # HANDLE OpenWaitableTimer(_In_ DWORD dwDesiredAccess, _In_ BOOL  bInheritHandle, _In_ LPCTSTR lpTimerName)
      def self.OpenWaitableTimer(dwDesiredAccess, bInheritHandle, lpTimerName) end
      encoded_function 'OpenWaitableTimer', [:dword, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-pulseevent
      # BOOL PulseEvent(_In_ HANDLE hEvent)
      def self.PulseEvent(hEvent) end
      attach_function 'PulseEvent', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/interlockedapi/nf-interlockedapi-querydepthslist
      # USHORT QueryDepthSList(_In_ PSLIST_HEADER ListHead)
      def self.QueryDepthSList(listHead) end
      attach_function 'QueryDepthSList', [:pointer], :ushort

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queueuserapc
      # DWORD QueueUserAPC( _In_ PAPCFUNC  pfnAPC, _In_ HANDLE    hThread, _In_ ULONG_PTR dwData)
      def self.QueueUserAPC(pfnAPC, hThread, dwData) end
      attach_function 'QueueUserAPC', [APCProc, :handle, :ulong_ptr], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-registerwaitforsingleobject
      # BOOL RegisterWaitForSingleObject(
      #   _Out_    PHANDLE             phNewWaitObject,
      #   _In_     HANDLE              hObject,
      #   _In_     WAITORTIMERCALLBACK Callback,
      #   _In_opt_ PVOID               Context,
      #   _In_     ULONG               dwMilliseconds,
      #   _In_     ULONG               dwFlags)
      def self.RegisterWaitForSingleObject(phNewWaitObject, hObject, callback, context, dwMilliseconds, dwFlags) end
      attach_function 'RegisterWaitForSingleObject',
                      [:pointer, :handle, WaitOrTimerCallback, :pointer, :ulong, WorkerThread], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-releasemutex
      # BOOL ReleaseMutex(_In_ HANDLE hMutex)
      def self.ReleaseMutex(hMutex) end
      attach_function 'ReleaseMutex', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-releasesemaphore
      # BOOL ReleaseSemaphore(_In_ HANDLE hSemaphore, _In_ LONG lReleaseCount, _Out_opt_ LPLONG lpPreviousCount)
      def self.ReleaseSemaphore(hSemaphore, lReleaseCount, lpPreviousCount) end
      attach_function 'ReleaseSemaphore', [:handle, :long, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-resetevent
      # BOOL ResetEvent(_In_ HANDLE hEvent)
      def self.ResetEvent(hEvent) end
      attach_function 'ResetEvent', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-setcriticalsectionspincount
      # DWORD SetCriticalSectionSpinCount(_Inout_ LPCRITICAL_SECTION lpCriticalSection, _In_ DWORD dwSpinCount)
      def self.SetCriticalSectionSpinCount(lpCriticalSection, dwSpinCount) end
      attach_function 'SetCriticalSectionSpinCount', [CRITICAL_SECTION.ptr, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-setevent
      # BOOL SetEvent( _In_ HANDLE hEvent)
      def self.SetEvent(hEvent) end
      attach_function 'SetEvent', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimer
      # BOOL SetWaitableTimer(
      #   _In_           HANDLE           hTimer,
      #   _In_     const LARGE_INTEGER    *pDueTime,
      #   _In_           LONG             lPeriod,
      #   _In_opt_       PTIMERAPCROUTINE pfnCompletionRoutine,
      #   _In_opt_       LPVOID           lpArgToCompletionRoutine,
      #   _In_           BOOL             fResume)
      def self.SetWaitableTimer(hTimer, pDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine, fResume) end
      attach_function 'SetWaitableTimer', [:handle, LARGE_INTEGER, :long, TimerAPCProc, :pointer, :bool], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-signalobjectandwait
      # DWORD SignalObjectAndWait(
      #   _In_ HANDLE hObjectToSignal,
      #   _In_ HANDLE hObjectToWaitOn,
      #   _In_ DWORD  dwMilliseconds,
      #   _In_ BOOL   bAlertable)
      def self.SignalObjectAndWait(hObjectToSignal, hObjectToWaitOn, dwMilliseconds, bAlertable) end
      attach_function 'SignalObjectAndWait', [:handle, :handle, :dword, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-tryentercriticalsection
      # BOOL TryEnterCriticalSection(_Inout_ LPCRITICAL_SECTION lpCriticalSection)
      def self.TryEnterCriticalSection(lpCriticalSection) end
      attach_function 'TryEnterCriticalSection', [CRITICAL_SECTION.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-unregisterwait
      # BOOL UnregisterWait(_In_ HANDLE WaitHandle)
      def self.UnregisterWait(waitHandle) end
      attach_function 'UnregisterWait', [:handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/Sync/unregisterwaitex
      # BOOL UnregisterWaitEx(_In_     HANDLE WaitHandle, _In_opt_ HANDLE CompletionEvent)
      def self.UnregisterWaitEx(waitHandle, completionEvent) end
      attach_function 'UnregisterWaitEx', [:handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687025
      # DWORD WaitForMultipleObjects(
      #   _In_       DWORD  nCount,
      #   _In_ const HANDLE *lpHandles,
      #   _In_       BOOL   bWaitAll,
      #   _In_       DWORD  dwMilliseconds)
      def self.WaitForMultipleObjects(nCount, lpHandles, bWaitAll, dwMilliseconds) end
      attach_function 'WaitForMultipleObjects', [:dword, :pointer, :bool, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjectsex
      # DWORD WaitForMultipleObjectsEx(
      #   _In_       DWORD  nCount,
      #   _In_ const HANDLE *lpHandles,
      #   _In_       BOOL   bWaitAll,
      #   _In_       DWORD  dwMilliseconds,
      #   _In_       BOOL   bAlertable)
      def self.WaitForMultipleObjectsEx(nCount, lpHandles, bWaitAll, dwMilliseconds, bAlertable) end
      attach_function 'WaitForMultipleObjectsEx', [:dword, :pointer, :bool, :dword, :bool], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-waitforsingleobject
      # DWORD WaitForSingleObject(_In_ HANDLE hHandle, _In_ DWORD  dwMilliseconds)
      def self.WaitForSingleObject(hHandle, dwMilliseconds) end
      attach_function 'WaitForSingleObject', [:handle, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-waitforsingleobjectex
      # DWORD WaitForSingleObjectEx( _In_ HANDLE hHandle, _In_ DWORD  dwMilliseconds, _In_ BOOL   bAlertable)
      def self.WaitForSingleObjectEx(hHandle, dwMilliseconds, bAlertable) end
      attach_function 'WaitForSingleObjectEx', [:handle, :dword, :bool], :dword

      if WINDOWS_VERSION >= :vista
        require_relative '../struct/synchronization/srw_lock'
        require_relative '../struct/synchronization/condition_variable'
        require_relative '../struct/synchronization/run_once'

        require_relative '../enum/synchronization/condition_variable'
        require_relative '../enum/synchronization/init_once_flag'

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683490
        # BOOL CALLBACK InitOnceCallback(
        #   _Inout_     PINIT_ONCE InitOnce,
        #   _Inout_opt_ PVOID      Parameter,
        #   _Out_opt_   PVOID      *Context)
        InitOnceCallback = callback 'InitOnceCallback', [RUN_ONCE.ptr, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-acquiresrwlockexclusive
        # VOID AcquireSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
        def self.AcquireSRWLockExclusive(sRWLock) end
        attach_function 'AcquireSRWLockExclusive', [SRWLOCK.ptr], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-acquiresrwlockshared
        # VOID AcquireSRWLockShared(_Inout_ PSRWLOCK SRWLock)
        def self.AcquireSRWLockShared(sRWLock) end
        attach_function 'AcquireSRWLockShared', [SRWLOCK.ptr], :void

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681937
        # BOOL AddSIDToBoundaryDescriptor(_Inout_ HANDLE *BoundaryDescriptor, _In_    PSID   RequiredSid)
        def self.AddSIDToBoundaryDescriptor(boundaryDescriptor, requiredSid) end
        attach_function 'AddSIDToBoundaryDescriptor', [:handle, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682026
        # BOOLEAN ClosePrivateNamespace(_In_ HANDLE Handle, _In_ ULONG  Flags)
        def self.ClosePrivateNamespace(handle, flags) end
        attach_function 'ClosePrivateNamespace', [:handle, PrivateNamespaceFlag], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createboundarydescriptora
        # HANDLE CreateBoundaryDescriptor(_In_ LPCTSTR Name, _In_ ULONG   Flags)
        def self.CreateBoundaryDescriptor(name, flags) end
        encoded_function 'CreateBoundaryDescriptor', [:string, :ulong], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-createeventexa
        # HANDLE CreateEventEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
        #   _In_opt_ LPCTSTR               lpName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        def self.CreateEventEx(lpEventAttributes, lpName, dwFlags, dwDesiredAccess) end
        encoded_function 'CreateEventEx', [SECURITY_ATTRIBUTES, CreateEventFlag, :dword], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-createmutexexa
        # HANDLE CreateMutexEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpMutexAttributes,
        #   _In_opt_ LPCTSTR               lpName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        def self.CreateMutexEx(lpMutexAttributes, lpName, dwFlags, dwDesiredAccess) end
        encoded_function 'CreateMutexEx', [SECURITY_ATTRIBUTES, :string, CreateMutexFlag, :dword], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createprivatenamespacea
        # HANDLE CreatePrivateNamespace(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpPrivateNamespaceAttributes,
        #   _In_     LPVOID                lpBoundaryDescriptor,
        #   _In_     LPCTSTR               lpAliasPrefix)
        def self.CreatePrivateNamespace(lpPrivateNamespaceAttributes, lpBoundaryDescriptor, lpAliasPrefix) end
        encoded_function 'CreatePrivateNamespace', [SECURITY_ATTRIBUTES, :pointer, :string], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createsemaphoreexa
        # HANDLE CreateSemaphoreEx(
        #   _In_opt_   LPSECURITY_ATTRIBUTES lpSemaphoreAttributes,
        #   _In_       LONG                  lInitialCount,
        #   _In_       LONG                  lMaximumCount,
        #   _In_opt_   LPCTSTR               lpName,
        #   _Reserved_ DWORD                 dwFlags,
        #   _In_       DWORD                 dwDesiredAccess)
        def self.CreateSemaphoreEx(lpSemaphoreAttributes, lInitialCount, lMaximumCount, lpName, dwFlags,
            dwDesiredAccess) end
        encoded_function 'CreateSemaphoreEx', [SECURITY_ATTRIBUTES, :long, :long, :string, :dword, :dword], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createwaitabletimerexa
        # HANDLE CreateWaitableTimerEx(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpTimerAttributes,
        #   _In_opt_ LPCTSTR               lpTimerName,
        #   _In_     DWORD                 dwFlags,
        #   _In_     DWORD                 dwDesiredAccess)
        def self.CreateWaitableTimerEx(lpTimerAttributes, lpTimerName, dwFlags, dwDesiredAccess) end
        encoded_function 'CreateWaitableTimerEx', [SECURITY_ATTRIBUTES, :string, CreateWaitableFlag, :dword], :handle

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682549
        # VOID DeleteBoundaryDescriptor(_In_ HANDLE BoundaryDescriptor)
        def self.DeleteBoundaryDescriptor(boundaryDescriptor) end
        attach_function 'DeleteBoundaryDescriptor', [:handle], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializeconditionvariable
        # VOID InitializeConditionVariable(_Out_ PCONDITION_VARIABLE ConditionVariable)
        def self.InitializeConditionVariable(conditionVariable) end
        attach_function 'InitializeConditionVariable', [CONDITION_VARIABLE.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializecriticalsectionex
        # BOOL InitializeCriticalSectionEx(
        #   _Out_ LPCRITICAL_SECTION lpCriticalSection,
        #   _In_  DWORD              dwSpinCount,
        #   _In_  DWORD              Flags)
        def self.InitializeCriticalSectionEx(lpCriticalSection, dwSpinCount, flags) end
        attach_function 'InitializeCriticalSectionEx', [CRITICAL_SECTION.ptr(:out), :dword, CriticalSectionFlag], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializesrwlock
        # VOID InitializeSRWLock(_Out_ PSRWLOCK SRWLock)
        def self.InitializeSRWLock(sRWLock) end
        attach_function 'InitializeSRWLock', [SRWLOCK.ptr(:out)], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initoncebegininitialize
        # BOOL InitOnceBeginInitialize(
        #   _Inout_   LPINIT_ONCE lpInitOnce,
        #   _In_      DWORD       dwFlags,
        #   _Out_     PBOOL       fPending,
        #   _Out_opt_ LPVOID      *lpContext)
        def self.InitOnceBeginInitialize(lpInitOnce, dwFlags, fPending, lpContext) end
        attach_function 'InitOnceBeginInitialize', [RUN_ONCE, InitOnceFlag, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initoncecomplete
        # BOOL InitOnceComplete(
        #   _Inout_  LPINIT_ONCE lpInitOnce,
        #   _In_     DWORD       dwFlags,
        #   _In_opt_ LPVOID      lpContext)
        def self.InitOnceComplete(lpInitOnce, dwFlags, lpContext) end
        attach_function 'InitOnceComplete', [RUN_ONCE.ptr, InitOnceFlag, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initonceexecuteonce
        # BOOL InitOnceExecuteOnce(
        #   _Inout_     PINIT_ONCE    InitOnce,
        #   _In_        PINIT_ONCE_FN InitFn,
        #   _Inout_opt_ PVOID         Parameter,
        #   _Out_opt_   LPVOID        *Context)
        def self.InitOnceExecuteOnce(initOnce, initFn, parameter, context) end
        attach_function 'InitOnceExecuteOnce', [RUN_ONCE.ptr, InitOnceCallback, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initonceinitialize
        # VOID InitOnceInitialize(_Out_ PINIT_ONCE InitOnce)
        def self.InitOnceInitialize(initOnce) end
        attach_function 'InitOnceInitialize', [RUN_ONCE.ptr(:out)], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openprivatenamespacea
        # HANDLE OpenPrivateNamespace(_In_ LPVOID  lpBoundaryDescriptor, _In_ LPCTSTR lpAliasPrefix)
        def self.OpenPrivateNamespace(lpBoundaryDescriptor, lpAliasPrefix) end
        encoded_function 'OpenPrivateNamespace', [:pointer, :string], :handle

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-releasesrwlockexclusive
        # VOID ReleaseSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
        def self.ReleaseSRWLockExclusive(sRWLock) end
        attach_function 'ReleaseSRWLockExclusive', [SRWLOCK.ptr], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-releasesrwlockshared
        # VOID ReleaseSRWLockShared(_Inout_ PSRWLOCK SRWLock)
        def self.ReleaseSRWLockShared(sRWLock) end
        attach_function 'ReleaseSRWLockShared', [SRWLOCK.ptr], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-sleepconditionvariablecs
        # BOOL SleepConditionVariableCS(
        #   _Inout_ PCONDITION_VARIABLE ConditionVariable,
        #   _Inout_ PCRITICAL_SECTION   CriticalSection,
        #   _In_    DWORD               dwMilliseconds)
        def self.SleepConditionVariableCS(conditionVariable, criticalSection, dwMilliseconds) end
        attach_function 'SleepConditionVariableCS', [CONDITION_VARIABLE.ptr, CRITICAL_SECTION.ptr, :dword], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-sleepconditionvariablesrw
        # BOOL SleepConditionVariableSRW(
        #   _Inout_ PCONDITION_VARIABLE ConditionVariable,
        #   _Inout_ PSRWLOCK            SRWLock,
        #   _In_    DWORD               dwMilliseconds,
        #   _In_    ULONG               Flags)
        def self.SleepConditionVariableSRW(conditionVariable, sRWLock, dwMilliseconds, flags) end
        attach_function 'SleepConditionVariableSRW',
                        [CONDITION_VARIABLE.ptr, SRWLOCK.ptr, :dword, Kernel32::ConditionVariable], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-wakeallconditionvariable
        # VOID WakeAllConditionVariable(_Inout_ PCONDITION_VARIABLE ConditionVariable)
        def self.WakeAllConditionVariable(conditionVariable) end
        attach_function 'WakeAllConditionVariable', [CONDITION_VARIABLE.ptr], :void

        # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-wakeconditionvariable
        # VOID WakeConditionVariable(_Inout_ PCONDITION_VARIABLE ConditionVariable)
        def self.WakeConditionVariable(conditionVariable) end
        attach_function 'WakeConditionVariable', [CONDITION_VARIABLE.ptr], :void

        if WINDOWS_VERSION >= 7
          require_relative '../struct/power/reason_context'

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-addintegritylabeltoboundarydescriptor
          # BOOL AddIntegrityLabelToBoundaryDescriptor(
          #   _Inout_ HANDLE *BoundaryDescriptor,
          #   _In_    PSID   IntegrityLabel)
          def self.AddIntegrityLabelToBoundaryDescriptor(boundaryDescriptor, integrityLabel) end
          attach_function 'AddIntegrityLabelToBoundaryDescriptor', [:handle, :pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-setwaitabletimerex
          # BOOL SetWaitableTimerEx(
          #   _In_       HANDLE           hTimer,
          #   _In_ const LARGE_INTEGER    *lpDueTime,
          #   _In_       LONG             lPeriod,
          #   _In_       PTIMERAPCROUTINE pfnCompletionRoutine,
          #   _In_       LPVOID           lpArgToCompletionRoutine,
          #   _In_       PREASON_CONTEXT  WakeContext,
          #   _In_       ULONG            TolerableDelay)
          def self.SetWaitableTimerEx(hTimer, lpDueTime, lPeriod, pfnCompletionRoutine, lpArgToCompletionRoutine,
              wakeContext, tolerableDelay) end
          attach_function 'SetWaitableTimerEx',
                          [:handle, LARGE_INTEGER, :long, TimerAPCProc, :pointer, REASON_CONTEXT.ptr(:in), :ulong],
                          :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-tryacquiresrwlockexclusive
          # BOOLEAN TryAcquireSRWLockExclusive(_Inout_ PSRWLOCK SRWLock)
          def self.TryAcquireSRWLockExclusive(sRWLOCK) end
          attach_function 'TryAcquireSRWLockExclusive', [SRWLOCK.ptr], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-tryacquiresrwlockshared
          # BOOLEAN TryAcquireSRWLockShared(_Inout_ PSRWLOCK SRWLock)
          def self.TryAcquireSRWLockShared(sRWLOCK) end
          attach_function 'TryAcquireSRWLockShared', [SRWLOCK.ptr], :bool

          if WINDOWS_VERSION >= 8
            require_relative '../enum/synchronization/synchronization_barrier_flag'

            require_relative '../struct/synchronization/rtl_barrier'

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-deletesynchronizationbarrier
            # BOOL DeleteSynchronizationBarrier(_Inout_ LPSYNCHRONIZATION_BARRIER lpBarrier)
            def self.DeleteSynchronizationBarrier(lpBarrier) end
            attach_function 'DeleteSynchronizationBarrier', [:pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-entersynchronizationbarrier
            # BOOL EnterSynchronizationBarrier( _Inout_ LPSYNCHRONIZATION_BARRIER lpBarrier, _In_ DWORD dwFlags)
            def self.EnterSynchronizationBarrier(lpBarrier, dwFlags) end
            attach_function 'EnterSynchronizationBarrier', [:pointer, SynchronizationBarrierFlag], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresultex
            # WINBASEAPI BOOL GetOverlappedResultEx(
            #   _In_  HANDLE       hFile,
            #   _In_  LPOVERLAPPED lpOverlapped,
            #   _Out_ LPDWORD      lpNumberOfBytesTransferred,
            #   _In_  DWORD        dwMilliseconds,
            #   _In_  BOOL         bAlertable)
            def self.GetOverlappedResultEx(hFile, lpOverlapped, lpNumberOfBytesTransferred, dwMilliseconds, bAlertable)
            end
            attach_function 'GetOverlappedResultEx', [:handle, OVERLAPPED, :pointer, :dword, :bool], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-initializesynchronizationbarrier
            # BOOL InitializeSynchronizationBarrier(
            #   _Out_ LPSYNCHRONIZATION_BARRIER lpBarrier,
            #   _In_  LONG                      lTotalThreads,
            #   _In_  LONG                      lSpinCount)
            def self.InitializeSynchronizationBarrier(lpBarrier, lTotalThreads, lSpinCount) end
            attach_function 'InitializeSynchronizationBarrier', [RTL_BARRIER.ptr(:out), :long, :long], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-waitonaddress
            # BOOL WaitOnAddress(
            #   _In_     VOID   volatile *Address,
            #   _In_     PVOID           CompareAddress,
            #   _In_     SIZE_T          AddressSize,
            #   _In_opt_ DWORD           dwMilliseconds)
            def self.WaitOnAddress(address, compareAddress, addressSize, dwMilliseconds) end
            attach_function 'WaitOnAddress', [:pointer, :pointer, :size_t, :dword], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-wakebyaddressall
            # VOID WakeByAddressAll(_In_ PVOID Address)
            def self.WakeByAddressAll(address) end
            attach_function 'WakeByAddressAll', [:pointer], :void

            # https://docs.microsoft.com/en-us/windows/desktop/api/synchapi/nf-synchapi-wakebyaddresssingle
            # VOID WakeByAddressSingle(_In_ PVOID Address)
            def self.WakeByAddressSingle(address) end
            attach_function 'WakeByAddressSingle', [:pointer], :void
          end
        end
      end
    end
  end
end