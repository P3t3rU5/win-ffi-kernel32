module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/tool_help/tool_help_crate_snapshot_flag'

    require_relative '../struct/tool_help/heap_entry_32'
    require_relative '../struct/tool_help/heap_list_32'
    require_relative '../struct/tool_help/module_entry_32'
    require_relative '../struct/tool_help/process_entry_32'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-createtoolhelp32snapshot
      # HANDLE WINAPI CreateToolhelp32Snapshot(_In_ DWORD dwFlags, _In_ DWORD th32ProcessID)
      def self.CreateToolhelp32Snapshot(th32ProcessID); end
      attach_function 'CreateToolhelp32Snapshot', [ToolHelpCrateSnapshotFlag, :dword], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32first
      # BOOL WINAPI Heap32First(_Inout_ LPHEAPENTRY32 lphe, _In_ DWORD th32ProcessID, _In_ ULONG_PTR th32HeapID)
      def self.Heap32First(lphe, th32ProcessID, th32HeapID); end
      attach_function 'Heap32First', [HEAPENTRY32.ptr, :dword, :ulong_ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listfirst
      # BOOL WINAPI Heap32ListFirst(_In_ HANDLE hSnapshot, _Inout_ LPHEAPLIST32 lphl)
      def self.Heap32ListFirst(lphe, th32ProcessID, th32HeapID); end
      attach_function 'Heap32ListFirst', [:handle, HEAPLIST32.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32listnext
      # BOOL Heap32ListNext(HANDLE hSnapshot, LPHEAPLIST32 lphl)
      def self.Heap32ListNext(hSnapshot, lphl); end
      attach_function 'Heap32ListNext', [:handle, HEAPLIST32.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-heap32next
      # BOOL WINAPI Heap32Next(_Out_ LPHEAPENTRY32 lphe)
      def self.Heap32Next(lphe); end
      attach_function 'Heap32Next', [HEAPENTRY32.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-module32first
      def self.Module32First(hSnapshot, lpme); end
      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-module32next
      def self.Module32Next(hSnapshot, lpme); end
      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-process32first
      def self.Process32First(hSnapshot, lppe); end
      # https://docs.microsoft.com/en-us/windows/desktop/api/tlhelp32/nf-tlhelp32-process32next
      def self.Process32Next(hSnapshot, lppe); end
      if WinFFI.ascii?
        # BOOL WINAPI Module32First(_In_ HANDLE hSnapshot, _Inout_ LPMODULEENTRY32 lpme)
        attach_function 'Module32First', [:handle, MODULEENTRY32.ptr], :bool

        # BOOL WINAPI Module32Next(_In_ HANDLE  hSnapshot, _Out_ LPMODULEENTRY32 lpme)
        attach_function 'Module32Next', [:handle, MODULEENTRY32.ptr(:out)], :bool

        # BOOL WINAPI Process32First(_In_ HANDLE hSnapshot, _Inout_ LPPROCESSENTRY32 lppe)
        attach_function 'Process32First', [:handle, PROCESSENTRY32.ptr], :bool

        # BOOL WINAPI Process32Next(_In_  HANDLE hSnapshot, _Out_ LPPROCESSENTRY32 lppe)
        attach_function 'Process32Next', [:handle, PROCESSENTRY32.ptr(:out)], :bool

      else
        # BOOL WINAPI Module32First(_In_ HANDLE hSnapshot, _Inout_ LPMODULEENTRY32 lpme)
        attach_function 'Module32First', 'Module32FirstW', [:handle, MODULEENTRY32.ptr], :bool

        # BOOL WINAPI Module32Next(_In_ HANDLE  hSnapshot, _Out_ LPMODULEENTRY32 lpme)
        attach_function 'Module32Next', 'Module32NextW', [:handle, MODULEENTRY32.ptr(:out)], :bool

        # BOOL WINAPI Process32First(_In_ HANDLE hSnapshot, _Inout_ LPPROCESSENTRY32 lppe)
        attach_function 'Process32First', 'Process32FirstW', [:handle, PROCESSENTRY32.ptr], :bool

        # BOOL WINAPI Process32Next(_In_  HANDLE hSnapshot, _Out_ LPPROCESSENTRY32 lppe)
        attach_function 'Process32Next', 'Process32NextW', [:handle, PROCESSENTRY32.ptr(:out)], :bool
      end
    end
  end
end
