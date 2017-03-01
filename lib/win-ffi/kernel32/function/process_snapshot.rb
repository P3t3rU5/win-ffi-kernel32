require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    if WINDOWS_VERSION >= 8.1

      typedef :hpss, :handle

      # https://msdn.microsoft.com/en-us/library/dn457828(v=vs.85).aspx
      # STDAPI_(DWORD) PssCaptureSnapshot(
      #   _In_     HANDLE            ProcessHandle,
      #   _In_     PSS_CAPTURE_FLAGS CaptureFlags,
      #   _In_opt_ DWORD             ThreadContextFlags,
      #   _Out_    HPSS              *SnapshotHandle)
      attach_function 'PssCaptureSnapshot', [:handle, PSS_CAPTURE_FLAGS, :dword, :pointer], :dword

      # https://msdn.microsoft.com/en-us/library/dn457829(v=vs.85).aspx
      # STDAPI_(DWORD) PssDuplicateSnapshot(
      #   _In_     HANDLE              SourceProcessHandle,
      #   _In_     HPSS                SnapshotHandle,
      #   _In_     HANDLE              TargetProcessHandle,
      #   _Out_    HPSS                *TargetSnapshotHandle,
      #   _In_opt_ PSS_DUPLICATE_FLAGS Flags)
      attach_function 'PssDuplicateSnapshot', [:handle, :hpss, :handle, :pointer, PSS_DUPLICATE_FLAGS], :dword

      
    end
  end
end