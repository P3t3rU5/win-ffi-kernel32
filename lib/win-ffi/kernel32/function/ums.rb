module WinFFI
  if WINDOWS_VERSION >= 7 && WinFFI.x64?
    require_relative '../enum/ums/thread_info_class'
    require_relative '../enum/ums/scheduler_reason'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nc-winnt-rtl_ums_scheduler_entry_point
      # VOID UmsSchedulerProc(
      #   _In_ UMS_SCHEDULER_REASON Reason,
      #   _In_ ULONG_PTR            ActivationPayload,
      #   _In_ PVOID                SchedulerParam)
      UmsSchedulerProc = callback 'UmsSchedulerProc', [UmsSchedulerReason, :ulong_ptr, :pointer], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createumscompletionlist
      # BOOL CreateUmsCompletionList(_Out_ PUMS_COMPLETION_LIST *UmsCompletionList)
      def self.CreateUmsCompletionList(umsCompletionList) end
      attach_function 'CreateUmsCompletionList', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createumsthreadcontext
      # BOOL CreateUmsThreadContext(_Out_ PUMS_CONTEXT *lpUmsThread)
      def self.CreateUmsThreadContext(lpUmsThread) end
      attach_function 'CreateUmsThreadContext', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deleteumscompletionlist
      # BOOL DeleteUmsCompletionList(_In_ PUMS_COMPLETION_LIST UmsCompletionList)
      def self.DeleteUmsCompletionList(umsCompletionList) end
      attach_function 'DeleteUmsCompletionList', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deleteumsthreadcontext
      # BOOL DeleteUmsThreadContext(_In_ PUMS_CONTEXT UmsThread)
      def self.DeleteUmsThreadContext(umsThread) end
      attach_function 'DeleteUmsThreadContext', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-dequeueumscompletionlistitems
      # BOOL DequeueUmsCompletionListItems(
      #   _In_  PUMS_COMPLETION_LIST UmsCompletionList,
      #   _In_  DWORD                WaitTimeOut,
      #   _Out_ PUMS_CONTEXT         *UmsThreadList)
      def self.DequeueUmsCompletionListItems(umsCompletionList, waitTimeOut, umsThreadList) end
      attach_function 'DequeueUmsCompletionListItems', [:pointer, :dword, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-enterumsschedulingmode
      # BOOL EnterUmsSchedulingMode(_In_ PUMS_SCHEDULER_STARTUP_INFO SchedulerStartupInfo)
      def self.EnterUmsSchedulingMode(schedulerStartupInfo) end
      attach_function 'EnterUmsSchedulingMode', [UmsSchedulerProc], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-executeumsthread
      # BOOL ExecuteUmsThread(_Inout_ PUMS_CONTEXT UmsThread)
      def self.ExecuteUmsThread(umsThread) end
      attach_function 'ExecuteUmsThread', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getcurrentumsthread
      # PUMS_CONTEXT GetCurrentUmsThread(void)
      def self.GetCurrentUmsThread; end
      attach_function 'GetCurrentUmsThread', [], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getnextumslistitem
      # PUMS_CONTEXT GetNextUmsListItem(_Inout_ PUMS_CONTEXT UmsContext)
      def self.GetNextUmsListItem(umsContext) end
      attach_function 'GetNextUmsListItem', [:pointer], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getumscompletionlistevent
      # BOOL GetUmsCompletionListEvent(
      #   _In_    PUMS_COMPLETION_LIST UmsCompletionList,
      #   _Inout_ PHANDLE              UmsCompletionEvent)
      def self.GetUmsCompletionListEvent(umsCompletionList, umsCompletionEvent) end
      attach_function 'GetUmsCompletionListEvent', [:pointer, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-queryumsthreadinformation
      # BOOL QueryUmsThreadInformation(
      #   _In_      PUMS_CONTEXT          UmsThread,
      #   _In_      UMS_THREAD_INFO_CLASS UmsThreadInfoClass,
      #   _Out_     PVOID                 UmsThreadInformation,
      #   _In_      ULONG                 UmsThreadInformationLength,
      #   _Out_opt_ PULONG                ReturnLength)
      def self.QueryUmsThreadInformation(umsThread, umsThreadInfoClass, umsThreadInformation,
          umsThreadInformationLength, returnLength) end
      attach_function 'QueryUmsThreadInformation', [:pointer, UmsThreadInfoClass, :pointer, :ulong, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setumsthreadinformation
      # BOOL SetUmsThreadInformation(
      #   _In_ PUMS_CONTEXT          UmsThread,
      #   _In_ UMS_THREAD_INFO_CLASS UmsThreadInfoClass,
      #   _In_ PVOID                 UmsThreadInformation,
      #   _In_ ULONG                 UmsThreadInformationLength)
      def self.SetUmsThreadInformation(umsThread, umsThreadInfoClass, umsThreadInformation, umsThreadInformationLength)
      end
      attach_function 'SetUmsThreadInformation', [:pointer, UmsThreadInfoClass, :pointer, :ulong], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-umsthreadyield
      # BOOL UmsThreadYield(_In_ PVOID SchedulerParam)
      def self.UmsThreadYield(schedulerParam) end
      attach_function 'UmsThreadYield', [:pointer], :bool

      if (WINDOWS_VERSION == 7 && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= 8
        require_relative '../struct/ums/system_thread_information'
        
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getumssystemthreadinformation
        # BOOL GetUmsSystemThreadInformation(
        #   _In_    HANDLE                         ThreadHandle,
        #   _Inout_ PUMS_SYSTEM_THREAD_INFORMATION SystemThreadInfo)
        def self.GetUmsSystemThreadInformation(threadHandle, systemThreadInfo) end
        attach_function 'GetUmsSystemThreadInformation', [:handle, UMS_SYSTEM_THREAD_INFORMATION.ptr], :bool
      end
    end
  end
end