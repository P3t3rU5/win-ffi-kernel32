module WinFFI
  if WINDOWS_VERSION >= 8.1
    require_relative '../enum/process_snapshot/pss_capture_flags'
    require_relative '../enum/process_snapshot/pss_duplicate_flag'

    module Kernel32

      typedef :handle, :hpss

      # https://docs.microsoft.com/en-us/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psscapturesnapshot
      # STDAPI_(DWORD) PssCaptureSnapshot(
      #   _In_     HANDLE            ProcessHandle,
      #   _In_     PSS_CAPTURE_FLAGS CaptureFlags,
      #   _In_opt_ DWORD             ThreadContextFlags,
      #   _Out_    HPSS              *SnapshotHandle)
      def self.PssCaptureSnapshot(processHandle, captureFlags, threadContextFlags, snapshotHandle); end
      attach_function 'PssCaptureSnapshot', [:handle, PSS_CAPTURE_FLAGS, :dword, :pointer], :dword

      # https://docs.microsoft.com/en-us/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssduplicatesnapshot
      # STDAPI_(DWORD) PssDuplicateSnapshot(
      #   _In_     HANDLE              SourceProcessHandle,
      #   _In_     HPSS                SnapshotHandle,
      #   _In_     HANDLE              TargetProcessHandle,
      #   _Out_    HPSS                *TargetSnapshotHandle,
      #   _In_opt_ PSS_DUPLICATE_FLAGS Flags)
      def self.PssDuplicateSnapshot(sourceProcessHandle, snapshotHandle, targetProcessHandle, targetSnapshotHandle,
          flags); end
      attach_function 'PssDuplicateSnapshot', [:handle, :hpss, :handle, :pointer, PSS_DUPLICATE_FLAGS], :dword
    end
  end
end