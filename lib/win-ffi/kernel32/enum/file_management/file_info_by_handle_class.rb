module WinFFI
  module Kernel32
    buffer = [
        :BasicInfo,
        :StandardInfo,
        :NameInfo,
        :RenameInfo,
        :DispositionInfo,
        :AllocationInfo,
        :EndOfFileInfo,
        :StreamInfo,
        :CompressionInfo,
        :AttributeTagInfo,
        :IdBothDirectoryInfo,
        :IdBothDirectoryRestartInfo,
        :IoPriorityHintInfo,
        :RemoteProtocolInfo,
        :FullDirectoryInfo,
        :FullDirectoryRestartInfo,
    ]

    buffer += [
        :StorageInfo,
        :AlignmentInfo,
        :IdInfo,
        :IdExtdDirectoryInfo,
        :IdExtdDirectoryRestartInfo,
    ] if WINDOWS_VERSION >= 8

    buffer += [:MaximumInfoByHandleClass]

    FILE_INFO_BY_HANDLE_CLASS = enum :file_info_by_handle_class, buffer

    define_prefix(:File, FILE_INFO_BY_HANDLE_CLASS, true)
  end
end