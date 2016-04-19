require 'win-ffi/kernel32'

# Possible Heisenbug.

module WinFFI
  module Kernel32
    if Architecture == 'x64-mingw32'
      # VOID UmsSchedulerProc(
      #   _In_ UMS_SCHEDULER_REASON Reason,
      #   _In_ ULONG_PTR            ActivationPayload,
      #   _In_ PVOID                SchedulerParam)
      UmsSchedulerProc = callback 'UmsSchedulerProc', [:pointer, :ulong, :pointer], :void

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
    end
  end
end