require 'win-ffi/kernel32/enum/tool_help/tool_help_crate_snapshot_flag'
require 'win-ffi/kernel32/struct/tool_help/heap_entry_32'

module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682489(v=vs.85).aspx
      # HANDLE WINAPI CreateToolhelp32Snapshot(_In_ DWORD dwFlags, _In_ DWORD th32ProcessID)
      attach_function 'CreateToolhelp32Snapshot', [ToolHelpCrateSnapshotFlag, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683245(v=vs.85).aspx
      # BOOL WINAPI Heap32First(
      #   _Inout_ LPHEAPENTRY32 lphe,
      #   _In_    DWORD         th32ProcessID,
      #   _In_    ULONG_PTR     th32HeapID)
      attach_function 'Heap32First', [HEAPENTRY32.ptr, :dword, :ulong_ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683432(v=vs.85).aspx
      # BOOL WINAPI Heap32ListFirst(_In_ HANDLE hSnapshot, _Inout_ LPHEAPLIST32 lphl)
      attach_function 'Heap32ListFirst', [:handle, HEAPLIST32.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683436(v=vs.85).aspx
      # BOOL Heap32ListNext(HANDLE hSnapshot, LPHEAPLIST32 lphl)
      attach_function 'Heap32ListNext', [:handle, HEAPLIST32.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683440(v=vs.85).aspx
      # BOOL WINAPI Heap32Next(_Out_ LPHEAPENTRY32 lphe)
      attach_function 'Heap32Next', [HEAPENTRY32.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684218(v=vs.85).aspx
      # BOOL WINAPI Module32First(_In_ HANDLE hSnapshot, _Inout_ LPMODULEENTRY32 lpme)
      attach_function encoding == 'A' ? 'Module32First' : 'Module32FirstW', [:handle, MODULEENTRY32.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684221(v=vs.85).aspx
      # BOOL WINAPI Module32Next(_In_ HANDLE  hSnapshot, _Out_ LPMODULEENTRY32 lpme)
      attach_function encoding == 'A' ? 'Module32Next' : 'Module32NextW', [:handle, MODULEENTRY32.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684834(v=vs.85).aspx
      # BOOL WINAPI Process32First(_In_ HANDLE hSnapshot, _Inout_ LPPROCESSENTRY32 lppe)
      attach_function encoding == 'A' ? 'Process32First' : 'Process32FirstW', [:handle, PROCESSENTRY32.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684836(v=vs.85).aspx
      # BOOL WINAPI Process32Next(_In_  HANDLE hSnapshot, _Out_ LPPROCESSENTRY32 lppe)
      attach_function  encoding == 'A' ?'Process32Next' : 'Process32NextW', [:handle, PROCESSENTRY32.ptr(:out)], :bool

    end
  end
end
