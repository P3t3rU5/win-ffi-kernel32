require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/ums/ums_thread_info_class'
require 'win-ffi/kernel32/struct/ums/ums_system_thread_information'

# Possible Heisenbug.

module WinFFI
  module Kernel32
    if WindowsVersion >= 7 && Architecture == 'x64-mingw32'
      # VOID UmsSchedulerProc(
      #   _In_ UMS_SCHEDULER_REASON Reason,
      #   _In_ ULONG_PTR            ActivationPayload,
      #   _In_ PVOID                SchedulerParam)
      UmsSchedulerProc = callback 'UmsSchedulerProc', [UmsSchedulerReason, :ulong, :pointer], :void

      # TODO not in kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627159(v=vs.85).aspx
      # BOOL WINAPI CreateUmsCompletionList(_Out_ PUMS_COMPLETION_LIST *UmsCompletionList)
      attach_function 'CreateUmsCompletionList', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627160(v=vs.85).aspx
      # BOOL WINAPI CreateUmsThreadContext(_Out_ PUMS_CONTEXT *lpUmsThread)
      attach_function 'CreateUmsThreadContext', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627161(v=vs.85).aspx
      # BOOL WINAPI DeleteUmsCompletionList(_In_ PUMS_COMPLETION_LIST UmsCompletionList)
      attach_function 'DeleteUmsCompletionList', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627162(v=vs.85).aspx
      # BOOL WINAPI DeleteUmsThreadContext(_In_ PUMS_CONTEXT UmsThread)
      attach_function 'DeleteUmsThreadContext', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627163(v=vs.85).aspx
      # BOOL WINAPI DequeueUmsCompletionListItems(
      #   _In_  PUMS_COMPLETION_LIST UmsCompletionList,
      #   _In_  DWORD                WaitTimeOut,
      #   _Out_ PUMS_CONTEXT         *UmsThreadList)
      attach_function 'DequeueUmsCompletionListItems', [:pointer, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627164(v=vs.85).aspx
      # BOOL WINAPI EnterUmsSchedulingMode(_In_ PUMS_SCHEDULER_STARTUP_INFO SchedulerStartupInfo)
      attach_function 'EnterUmsSchedulingMode', [UmsSchedulerProc], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627165(v=vs.85).aspx
      # BOOL WINAPI ExecuteUmsThread(_Inout_ PUMS_CONTEXT UmsThread)
      attach_function 'ExecuteUmsThread', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627166(v=vs.85).aspx
      # PUMS_CONTEXT WINAPI GetCurrentUmsThread(void)
      attach_function 'GetCurrentUmsThread', [], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627167(v=vs.85).aspx
      # PUMS_CONTEXT WINAPI GetNextUmsListItem(_Inout_ PUMS_CONTEXT UmsContext)
      attach_function 'GetNextUmsListItem', [:pointer], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627168(v=vs.85).aspx
      # BOOL WINAPI GetUmsCompletionListEvent(
      #   _In_    PUMS_COMPLETION_LIST UmsCompletionList,
      #   _Inout_ PHANDLE              UmsCompletionEvent)
      attach_function 'GetUmsCompletionListEvent', [:pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627177(v=vs.85).aspx
      # BOOL WINAPI QueryUmsThreadInformation(
      #   _In_      PUMS_CONTEXT          UmsThread,
      #   _In_      UMS_THREAD_INFO_CLASS UmsThreadInfoClass,
      #   _Out_     PVOID                 UmsThreadInformation,
      #   _In_      ULONG                 UmsThreadInformationLength,
      #   _Out_opt_ PULONG                ReturnLength)
      attach_function 'QueryUmsThreadInformation', [:pointer, UmsThreadInfoClass, :pointer, :ulong, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627181(v=vs.85).aspx
      # BOOL WINAPI SetUmsThreadInformation(
      #   _In_ PUMS_CONTEXT          UmsThread,
      #   _In_ UMS_THREAD_INFO_CLASS UmsThreadInfoClass,
      #   _In_ PVOID                 UmsThreadInformation,
      #   _In_ ULONG                 UmsThreadInformationLength)
      attach_function 'SetUmsThreadInformation', [:pointer, UmsThreadInfoClass, :pointer, :ulong], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/dd627183(v=vs.85).aspx
      # BOOL WINAPI UmsThreadYield(_In_ PVOID SchedulerParam)
      attach_function 'UmsThreadYield', [:pointer], :bool

      if (WindowsVersion == 7 && WindowsVersion.sp >= 1) || WindowsVersion >= 8
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ff189221(v=vs.85).aspx
        # BOOL WINAPI GetUmsSystemThreadInformation(
        #   _In_    HANDLE                         ThreadHandle,
        #   _Inout_ PUMS_SYSTEM_THREAD_INFORMATION SystemThreadInfo)
        attach_function 'GetUmsSystemThreadInformation', [:handle, UMS_SYSTEM_THREAD_INFORMATION.ptr], :bool
      end
    end
  end
end