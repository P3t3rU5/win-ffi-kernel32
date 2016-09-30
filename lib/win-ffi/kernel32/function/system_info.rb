require 'win-ffi/kernel32'


require 'win-ffi/kernel32/enum/computer_name_format'
require 'win-ffi/kernel32/enum/system_info/version_flag'
require 'win-ffi/kernel32/enum/system_info/processor_feature'
require 'win-ffi/kernel32/enum/system_info/computer_name_format'
require 'win-ffi/kernel32/enum/system_info/version_type'
require 'win-ffi/kernel32/enum/system_info/version_condition_mask'
require 'win-ffi/kernel32/enum/system_info/variable_attribute'
require 'win-ffi/kernel32/enum/system_info/product_type'
require 'win-ffi/kernel32/enum/system_info/firmware_type'

require 'win-ffi/core/struct/large_integer'
require 'win-ffi/kernel32/struct/system_info/os_version_info_ex'
require 'win-ffi/kernel32/struct/system_info/system_info'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724244%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # BOOL WINAPI DnsHostnameToComputerName(
    #   _In_     LPCTSTR Hostname,
    #   _Out_    LPTSTR ComputerName,
    #   _Inout_  LPDWORD nSize )
    encoded_function 'DnsHostnameToComputerName', [:string, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724265(v=vs.85).aspx
    # DWORD WINAPI ExpandEnvironmentStrings(
    #   _In_       LPCTSTR lpSrc,
    #   _Out_opt_  LPTSTR lpDst,
    #   _In_       DWORD nSize )
    encoded_function 'ExpandEnvironmentStrings', [:string, :pointer, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724295%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # BOOL WINAPI GetComputerName(
    #   _Out_    LPTSTR lpBuffer,
    #   _Inout_  LPDWORD lpnSize )
    encoded_function 'GetComputerName', [:pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724301(v=vs.85).aspx
    # BOOL WINAPI GetComputerNameEx(
    #   _In_     COMPUTER_NAME_FORMAT NameType,
    #   _Out_    LPTSTR lpBuffer,
    #   _Inout_  LPDWORD lpnSize )
    encoded_function 'GetComputerNameEx', [ComputerNameFormat, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724373%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # UINT WINAPI GetSystemDirectory(
    #   _Out_  LPTSTR lpBuffer,
    #   _In_   UINT uSize )
    encoded_function 'GetSystemDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724381(v=vs.85).aspx
    # void WINAPI GetSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
    attach_function 'GetSystemInfo', [SYSTEM_INFO.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724403(v=vs.85).aspx
    # UINT WINAPI GetSystemWindowsDirectory(
    #   _Out_  LPTSTR lpBuffer,
    #   _In_   UINT uSize )
    encoded_function 'GetSystemWindowsDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724439(v=vs.85).aspx
    # DWORD WINAPI GetVersion(void)
    attach_function 'GetVersion', [], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724454(v=vs.85).aspx
    # UINT WINAPI GetWindowsDirectory(
    #   _Out_  LPTSTR lpBuffer,
    #   _In_   UINT uSize )
    encoded_function 'GetWindowsDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724482%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # BOOL WINAPI IsProcessorFeaturePresent( _In_  DWORD ProcessorFeature )
    attach_function 'IsProcessorFeaturePresent', [ProcessorFeature], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644904%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # BOOL WINAPI QueryPerformanceCounter( _Out_  LARGE_INTEGER *lpPerformanceCount )
    attach_function 'QueryPerformanceCounter', [LARGE_INTEGER.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644905(v=vs.85).aspx
    # BOOL WINAPI QueryPerformanceFrequency( _Out_  LARGE_INTEGER *lpFrequency )
    attach_function 'QueryPerformanceFrequency', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724930%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # BOOL WINAPI SetComputerName( _In_  LPCTSTR lpComputerName )
    encoded_function 'SetComputerName', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724931(v=vs.85).aspx
    # BOOL WINAPI SetComputerNameEx(
    #   _In_  COMPUTER_NAME_FORMAT NameType,
    #   _In_  LPCTSTR lpBuffer )
    encoded_function 'SetComputerNameEx', [COMPUTER_NAME_FORMAT, :string], :bool

    # BOOL SetComputerNameEx2W(
    #   _In_ COMPUTER_NAME_FORMAT NameType,
    #   _In_ DWORD Flags,
    #   _In_ LPCWSTR lpBuffer)
    attach_function 'SetComputerNameEx2', 'SetComputerNameEx2W', [COMPUTER_NAME_FORMAT, :dword, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms725492(v=vs.85).aspx
    # BOOL WINAPI VerifyVersionInfo(
    #   _In_  LPOSVERSIONINFOEX lpVersionInfo,
    #   _In_  DWORD dwTypeMask,
    #   _In_  DWORDLONG dwlConditionMask )
    encoded_function 'VerifyVersionInfo', [OSVERSIONINFOEX.ptr, VersionType, :ulong], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms725493%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
    # ULONGLONG WINAPI VerSetConditionMask(
    #   _In_  ULONGLONG dwlConditionMask,
    #   _In_  DWORD dwTypeBitMask,
    #   _In_  BYTE dwConditionMask )
    attach_function 'VerSetConditionMask', [:ulong_long, VersionType, VersionConditionMask], :ulong

    # BOOL WINAPI DnsHostnameToComputerNameExW(
    #   _In_ LPCWSTR Hostname,
    #   _Out_writes_to_opt_(*nSize, *nSize + 1) LPWSTR ComputerName,
    #   _Inout_ LPDWORD nSize)
    attach_function 'DnsHostnameToComputerNameExW', [:string, :string, :pointer], :bool

    if WindowsVersion >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724405(v=vs.85).aspx
      # UINT WINAPI GetSystemWow64Directory(
      #   _Out_  LPTSTR lpBuffer,
      #   _In_   UINT uSize )
      encoded_function 'GetSystemWow64Directory', [:pointer, :uint], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724340%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # void WINAPI GetNativeSystemInfo( _Out_  LPSYSTEM_INFO lpSystemInfo )
      attach_function 'GetNativeSystemInfo', [SYSTEM_INFO.ptr(:out)], :void

      if WindowsVersion.sp >= 1 || WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724325(v=vs.85).aspx
        # DWORD WINAPI GetFirmwareEnvironmentVariable(
        #   _In_   LPCTSTR lpName,
        #   _In_   LPCTSTR lpGuid,
        #   _Out_  PVOID pBuffer,
        #   _In_   DWORD nSize )
        encoded_function 'GetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724387(v=vs.85).aspx
        # BOOL WINAPI GetSystemRegistryQuota(
        #   _Out_opt_  PDWORD pdwQuotaAllowed,
        #   _Out_opt_  PDWORD pdwQuotaUsed )
        attach_function 'GetSystemRegistryQuota', [:pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724934(v=vs.85).aspx
        # BOOL WINAPI SetFirmwareEnvironmentVariable(
        #   _In_  LPCTSTR lpName,
        #   _In_  LPCTSTR lpGuid,
        #   _In_  PVOID pBuffer,
        #   _In_  DWORD nSize )
        encoded_function 'SetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :bool
      end

      #x64
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724259(v=vs.85).aspx
      # UINT WINAPI EnumSystemFirmwareTables(
      #   _In_   DWORD FirmwareTableProviderSignature,
      #   _Out_  PVOID pFirmwareTableBuffer,
      #   _In_   DWORD BufferSize )
      attach_function 'EnumSystemFirmwareTables', [:dword, :pointer, :dword], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724379(v=vs.85).aspx
      # UINT WINAPI GetSystemFirmwareTable(
      #   _In_   DWORD FirmwareTableProviderSignature,
      #   _In_   DWORD FirmwareTableID,
      #   _Out_  PVOID pFirmwareTableBuffer,
      #   _In_   DWORD BufferSize )
      attach_function 'GetSystemFirmwareTable', [:dword, :dword, :pointer, :dword], :uint

      if WindowsVersion >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724358%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
        # BOOL WINAPI GetProductInfo(
        #   _In_   DWORD dwOSMajorVersion,
        #   _In_   DWORD dwOSMinorVersion,
        #   _In_   DWORD dwSpMajorVersion,
        #   _In_   DWORD dwSpMinorVersion,
        #   _Out_  PDWORD pdwReturnedProductType )
        attach_function 'GetProductInfo', [:dword, :dword, :dword, :dword, :pointer], :bool

        if WindowsVersion >= 8

          # https://msdn.microsoft.com/en-us/library/windows/desktop/jj204593%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
          # BOOL WINBASEAPI GetFirmwareEnvironmentVariableEx(
          #   LPCSTR lpName,
          #   LPCSTR lpGuid,
          #   PVOID pValue,
          #   DWORD nSize,
          #   PDWORD pdwAttributes )
          encoded_function 'GetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, :pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh848321(v=vs.85).aspx
          # BOOL WINAPI GetFirmwareType( _Inout_  PFIRMWARE_TYPE FirmwareType )
          attach_function 'GetFirmwareType', [:pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706896(v=vs.85).aspx
          # BOOL WINAPI IsNativeVhdBoot ( _Out_  PBOOL *NativeVhdBoot )
          attach_function 'IsNativeVhdBoot', [:pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/jj204594%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
          # BOOL WINBASEAPI SetFirmwareEnvironmentVariableEx(
          #   _In_  LPCTSTR lpName,
          #   _In_  LPCTSTR lpGuid,
          #   _In_  PVOID pValue,
          #   _In_  DWORD nSize,
          #   _In_  DWORD dwAttributes )
          encoded_function 'SetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, VariableAttribute],
                           :bool

          if WindowsVersion >= 8.1
            # https://msdn.microsoft.com/en-us/library/windows/desktop/dn482415(v=vs.85).aspx
            # BOOL WINAPI  CeipIsOptedIn(void)

            if WindowsVersion >= 10
              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn904185(v=vs.85).aspx
              # WINAPI GetIntegratedDisplaySize(_Out_ double *sizeInInches)
              # attach_function 'GetIntegratedDisplaySize', [:double], :hresult
            end
          end
        end
      end
    end
  end
end