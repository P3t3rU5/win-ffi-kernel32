require 'win-ffi/core/struct/large_integer'

require_relative '../../wofutil'
require_relative '../enum/wim_type'

module WinFFI
  module Wofutil

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nc-wofapi-wofenumentryproc
    # BOOL CALLBACK *WofEnumEntryProc(_In_     const PVOID EntryInfo, _In_opt_       PVOID UserData)
    WofEnumEntryProc = callback 'WofEnumEntryProc', [:pointer, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nc-wofapi-wofenumfilesproc
    # BOOL CALLBACK *WofEnumFilesProc(_In_ PCWSTR FilePath, _In_ PVOID ExternalFileInfo, _In_opt_ PVOID UserData)
    WofEnumFilesProc = enum 'WofEnumFilesProc', [:string, :pointer, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofenumentries
    # HRESULT WofEnumEntries(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     ULONG            Provider,
    #   _In_     WofEnumEntryProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    def self.WofEnumEntries(volumeName, provider, enumProc, userData) end
    attach_function 'WofEnumEntries', [:string, :ulong, WofEnumEntryProc, :pointer], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-woffileenumfiles
    # HRESULT WofFileEnumFiles(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     ULONG            Algorithm,
    #   _In_     WofEnumFilesProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    def self.WofFileEnumFiles(volumeName, algorithm, enumProc, userData) end
    attach_function 'WofFileEnumFiles', [:string, :ulong, WofEnumFilesProc, :pointer], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofgetdriverversion
    # HRESULT WofGetDriverVersion(
    #   _In_  HANDLE FileOrVolumeHandle,
    #   _In_  ULONG  Provider,
    #   _Out_ PULONG WofVersion)
    def self.WofGetDriverVersion(fileOrVolumeHandle, provider, wofVersion) end
    attach_function 'WofGetDriverVersion', [:handle, :ulong, :pointer], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofisexternalfile
    # HRESULT WofIsExternalFile(
    #   _In_        LPCWSTR FilePath,
    #   _Out_opt_   PBOOL   IsExternalFile,
    #   _Out_opt_   PULONG  Provider,
    #   _Out_opt_   PVOID   ExternalFileInfo,
    #   _Inout_opt_ PULONG  BufferLength)
    def self.WofIsExternalFile(filePath, isExternalFile, provider, externalFileInfo, bufferLength) end
    attach_function 'WofIsExternalFile', [:string, :pointer, :pointer, :pointer, :pointer], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofsetfiledatalocation
    # HRESULT WofSetFileDataLocation(
    #   _In_ HANDLE FileHandle,
    #   _In_ ULONG  Provider,
    #   _In_ PVOID  ExternalFileInfo,
    #   _In_ ULONG  Length)
    def self.WofSetFileDataLocation(fileHandle, provider, externalFileInfo, length) end
    attach_function 'WofSetFileDataLocation', [:handle, :ulong, :pointer, :ulong], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofshouldcompressbinaries
    # BOOL WofShouldCompressBinaries(_In_  LPCWSTR Volume, _Out_ PULONG  Algorithm)
    def self.WofShouldCompressBinaries(volume, algorithm) end
    attach_function 'WofShouldCompressBinaries', [:string, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofwimaddentry
    # HRESULT WofWimAddEntry(
    #   _In_  PCWSTR         VolumeName,
    #   _In_  PCWSTR         WimPath,
    #   _In_  DWORD          WimType,
    #   _In_  DWORD          WimIndex,
    #   _Out_ PLARGE_INTEGER DataSourceId)
    def self.WofWimAddEntry(volumeName, wimPath, wimType, wimIndex, dataSourceId) end
    attach_function 'WofWimAddEntry', [:string, :string, WimType, :dword, LARGE_INTEGER.ptr(:out)], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofwimenumfiles
    # HRESULT WofWimEnumFiles(
    #   _In_     PCWSTR           VolumeName,
    #   _In_     LARGE_INTEGER    DataSourceId,
    #   _In_     WofEnumFilesProc EnumProc,
    #   _In_opt_ PVOID            UserData)
    def self.WofWimEnumFiles(volumeName, dataSourceId, enumProc, userData) end
    attach_function 'WofWimEnumFiles', [:string, LARGE_INTEGER.ptr(:in), WofEnumFilesProc, :pointer], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofwimremoveentry
    # HRESULT WofWimRemoveEntry(_In_ PCWSTR VolumeName, _In_ LARGE_INTEGER DataSourceId)
    def self.WofWimRemoveEntry(volumeName, dataSourceId) end
    attach_function 'WofWimRemoveEntry', [:string, LARGE_INTEGER.ptr(:in)], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofwimsuspendentry
    # HRESULT WofWimSuspendEntry(_In_ PCWSTR VolumeName, _In_ LARGE_INTEGER DataSourceId)
    def self.WofWimSuspendEntry(volumeName, dataSourceId) end
    attach_function 'WofWimSuspendEntry', [:string, LARGE_INTEGER.ptr(:in)], :hresult

    # https://docs.microsoft.com/en-us/windows/desktop/api/wofapi/nf-wofapi-wofwimupdateentry
    # HRESULT WofWimUpdateEntry(
    #   _In_ PCWSTR        VolumeName,
    #   _In_ LARGE_INTEGER DataSourceId,
    #   _In_ PCWSTR        NewWimPath)
    def self.WofWimUpdateEntry(volumeName, dataSourceId, newWimPath) end
    attach_function 'WofWimUpdateEntry', [:string, LARGE_INTEGER, :string], :hresult
  end
end