require 'win-ffi/wofutil'

require 'win-ffi/wofutil/enum/wim_type'
require 'win-ffi/core/struct/large_integer'

module WinFFI
  module Wofutil

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595726(v=vs.85).aspx
    # BOOL CALLBACK *WofEnumEntryProc(_In_     const PVOID EntryInfo, _In_opt_       PVOID UserData)
    WofEnumEntryProc = callback 'WofEnumEntryProc', [:pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595727(v=vs.85).aspx
    # BOOL CALLBACK *WofEnumFilesProc(
    #   _In_     PCWSTR FilePath,
    #   _In_     PVOID  ExternalFileInfo,
    #   _In_opt_ PVOID  UserData)
    WofEnumFilesProc = enum 'WofEnumFilesProc', [:string, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595725(v=vs.85).aspx
    # HRESULT WINAPI WofEnumEntries(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     ULONG            Provider,
    #   _In_     WofEnumEntryProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    attach_function 'WofEnumEntries', [:string, :ulong, WofEnumEntryProc, :pointer], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595728(v=vs.85).aspx
    # HRESULT WINAPI WofFileEnumFiles(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     ULONG            Algorithm,
    #   _In_     WofEnumFilesProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    attach_function 'WofFileEnumFiles', [:string, :ulong, WofEnumFilesProc, :pointer], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595729(v=vs.85).aspx
    # HRESULT WINAPI WofGetDriverVersion(
    #   _In_  HANDLE FileOrVolumeHandle,
    #   _In_  ULONG  Provider,
    #   _Out_ PULONG WofVersion)
    attach_function 'WofGetDriverVersion', [:handle, :ulong, :pointer], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595730(v=vs.85).aspx
    # HRESULT WINAPI WofIsExternalFile(
    #   _In_        LPCWSTR FilePath,
    #   _Out_opt_   PBOOL   IsExternalFile,
    #   _Out_opt_   PULONG  Provider,
    #   _Out_opt_   PVOID   ExternalFileInfo,
    #   _Inout_opt_ PULONG  BufferLength)
    attach_function 'WofIsExternalFile', [:string, :pointer, :pointer, :pointer, :pointer], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595731(v=vs.85).aspx
    # HRESULT WINAPI WofSetFileDataLocation(
    #   _In_ HANDLE FileHandle,
    #   _In_ ULONG  Provider,
    #   _In_ PVOID  ExternalFileInfo,
    #   _In_ ULONG  Length)
    attach_function 'WofSetFileDataLocation', [:handle, :ulong, :pointer, :ulong], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595732(v=vs.85).aspx
    # BOOL WINAPI WofShouldCompressBinaries(_In_  LPCWSTR Volume, _Out_ PULONG  Algorithm)
    attach_function 'WofShouldCompressBinaries', [:string, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595733(v=vs.85).aspx
    # HRESULT WINAPI WofWimAddEntry(
    #   _In_  PCWSTR         VolumeName,
    #   _In_  PCWSTR         WimPath,
    #   _In_  DWORD          WimType,
    #   _In_  DWORD          WimIndex,
    #   _Out_ PLARGE_INTEGER DataSourceId)
    attach_function 'WofWimAddEntry', [:string, :string, WimType, :dword, LARGE_INTEGER.ptr(:out)], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595734(v=vs.85).aspx
    # HRESULT WINAPI WofWimEnumFiles(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     LARGE_INTEGER    DataSourceId,
    #   _In_     WofEnumFilesProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    attach_function 'WofWimEnumFiles', [:string, LARGE_INTEGER.ptr(:in), WofEnumFilesProc, :pointer], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595735(v=vs.85).aspx
    # HRESULT WINAPI WofWimRemoveEntry(_In_ PCWSTR VolumeName, _In_ LARGE_INTEGER DataSourceId)
    attach_function 'WofWimRemoveEntry', [:string, LARGE_INTEGER.ptr(:in)], :hresult

    # HRESULT WINAPI WofWimSuspendEntry(_In_ PCWSTR VolumeName, _In_ LARGE_INTEGER DataSourceId)
    attach_function 'WofWimSuspendEntry', [:string, LARGE_INTEGER.ptr(:in)], :hresult

    # https://msdn.microsoft.com/en-us/library/windows/desktop/mt595737(v=vs.85).aspx
    # HRESULT WINAPI WofWimUpdateEntry(
    #   _In_ PCWSTR        VolumeName,
    #   _In_ LARGE_INTEGER DataSourceId,
    #   _In_ PCWSTR        NewWimPath)
    attach_function 'WofWimUpdateEntry', [:string, LARGE_INTEGER, :string], :hresult

  end
end