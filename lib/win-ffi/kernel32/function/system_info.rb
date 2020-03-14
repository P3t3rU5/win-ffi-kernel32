require 'win-ffi/core/struct/large_integer'
require 'win-ffi/kernel32/struct/system_info/os_version_info_ex'

require_relative '../enum/computer_name_format'

require_relative '../enum/system_info/version_flag'
require_relative '../enum/system_info/processor_feature'
require_relative '../enum/system_info/computer_name_format'
require_relative '../enum/system_info/version_type'
require_relative '../enum/system_info/version_condition_mask'
require_relative '../enum/system_info/product_type'
require_relative '../enum/system_info/firmware_type'

require_relative '../struct/system_info/system_info'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-dnshostnametocomputernamea
    # @param [String] hostname
    # @param [FFI::Pointer] computerName
    # @param [FFI::Pointer] nSize
    # @return [true, false]
    def self.DnsHostnameToComputerName(hostname, computerName, nSize) end
    encoded_function 'DnsHostnameToComputerName', [:string, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724265
    # @param [String] lpSrc
    # @param [FFI::Pointer] lpDst
    # @param [Integer] nSize
    # @return [Integer]
    def self.ExpandEnvironmentStrings(lpSrc, lpDst, nSize) end
    encoded_function 'ExpandEnvironmentStrings', [:string, :pointer, :dword], :dword

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getcomputernamea
    # @param [FFI::Pointer] lpBuffer
    # @param [FFI::Pointer] lpnSize
    # @return [true, false]
    def self.GetComputerName(lpBuffer, lpnSize) end
    encoded_function 'GetComputerName', [:pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724301
    # @param [Integer] nameType
    # @param [FFI::Pointer] lpBuffer
    # @param [FFI::Pointer] lpnSize
    # @return [true, false]
    def self.GetComputerNameEx(nameType, lpBuffer, lpnSize) end
    encoded_function 'GetComputerNameEx', [ComputerNameFormat, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724373
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] uSize
    # @return [Integer]
    def self.GetSystemDirectory(lpBuffer, uSize) end
    encoded_function 'GetSystemDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724381
    # @param [FFI::Pointer] lpSystemInfo
    # @return [nil]
    def self.GetSystemInfo(lpSystemInfo) end
    attach_function 'GetSystemInfo', [SYSTEM_INFO.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724403
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] uSize
    # @return [Integer]
    def self.GetSystemWindowsDirectory(lpBuffer, uSize) end
    encoded_function 'GetSystemWindowsDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724439
    # @return [Integer]
    def self.GetVersion; end
    attach_function 'GetVersion', [], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724454
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] uSize
    # @return [Integer]
    def self.GetWindowsDirectory(lpBuffer, uSize) end
    encoded_function 'GetWindowsDirectory', [:pointer, :uint], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724482
    # @param [Integer] processorFeature
    # @return [true, false]
    def self.IsProcessorFeaturePresent(processorFeature) end
    attach_function 'IsProcessorFeaturePresent', [ProcessorFeature], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644904
    # @param [FFI::Pointer] lpPerformanceCount
    # @return [true, false]
    def self.QueryPerformanceCounter(lpPerformanceCount) end
    attach_function 'QueryPerformanceCounter', [LARGE_INTEGER.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms644905
    # BOOL QueryPerformanceFrequency( _Out_  LARGE_INTEGER *lpFrequency )
    # @param [FFI::Pointer] lpFrequency
    # @return [true, false]
    def self.QueryPerformanceFrequency(lpFrequency) end
    attach_function 'QueryPerformanceFrequency', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724930
    # @param [String] lpComputerName
    # @return [true, false]
    def self.SetComputerName(lpComputerName) end
    encoded_function 'SetComputerName', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724931
    # @param [Integer] nameType
    # @param [String] lpBuffer
    # @return [true, false]
    def self.SetComputerNameEx(nameType, lpBuffer) end
    encoded_function 'SetComputerNameEx', [COMPUTER_NAME_FORMAT, :string], :bool

    # @param [Integer] nameType
    # @param [Integer] flags
    # @param [String] lpBuffer
    # @return [true, false]
    def self.SetComputerNameEx2(nameType, flags, lpBuffer) end
    attach_function 'SetComputerNameEx2', 'SetComputerNameEx2W', [COMPUTER_NAME_FORMAT, :dword, :string], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-verifyversioninfoa
    # @param [FFI::Pointer] lpVersionInfo
    # @param [Integer] dwTypeMask
    # @param [Integer] dwlConditionMask
    # @return [true, false]
    def self.VerifyVersionInfo(lpVersionInfo, dwTypeMask, dwlConditionMask) end
    encoded_function 'VerifyVersionInfo', [OSVERSIONINFOEX.ptr, VersionType, :ulong], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winnt/nf-winnt-versetconditionmask
    # @param [Integer] dwlConditionMask
    # @param [Integer] dwTypeBitMask
    # @param [Integer] dwConditionMask
    # @return [Integer]
    def self.VerSetConditionMask(dwlConditionMask, dwTypeBitMask, dwConditionMask) end
    attach_function 'VerSetConditionMask', [:ulong_long, VersionType, VersionConditionMask], :ulong

    # @param [String] hostname
    # @param [String] computerName
    # @param [FFI::Pointer] nSize
    # @return [true, false]
    def self.DnsHostnameToComputerNameEx(hostname, computerName, nSize) end
    attach_function 'DnsHostnameToComputerNameExW', 'DnsHostnameToComputerNameExW',
                    [:string, :string, :pointer], :bool

    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724405
      # @param [FFI::Pointer] lpBuffer
      # @param [Integer] uSize
      # @return [Integer]
      def self.GetSystemWow64Directory(lpBuffer, uSize) end
      encoded_function 'GetSystemWow64Directory', [:pointer, :uint], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724340
      # @param [FFI::Pointer] lpSystemInfo
      # @return [nil]
      def self.GetNativeSystemInfo(lpSystemInfo) end
      attach_function 'GetNativeSystemInfo', [SYSTEM_INFO.ptr(:out)], :void

      #x64
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724259
      # @param [Integer] firmwareTableProviderSignature
      # @param [FFI::Pointer] pFirmwareTableBuffer
      # @param [Integer] bufferSize
      # @return [Integer]
      def self.EnumSystemFirmwareTables(firmwareTableProviderSignature, pFirmwareTableBuffer, bufferSize) end
      attach_function 'EnumSystemFirmwareTables', [:dword, :pointer, :dword], :uint

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724379
      # @param [Integer] firmwareTableProviderSignature
      # @param [Integer] firmwareTableID
      # @param [FFI::Pointer] pFirmwareTableBuffer
      # @param [Integer] bufferSize
      # @return [Integer]
      def self.GetSystemFirmwareTable(firmwareTableProviderSignature, firmwareTableID, pFirmwareTableBuffer, bufferSize) end
      attach_function 'GetSystemFirmwareTable', [:dword, :dword, :pointer, :dword], :uint

      if WINDOWS_VERSION.sp >= 1 || WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfirmwareenvironmentvariablea
        # @param [String] lpName
        # @param [String] lpGuid
        # @param [FFI::Pointer] pBuffer
        # @param [Integer] nSize
        # @return [Integer]
        def self.GetFirmwareEnvironmentVariable(lpName, lpGuid, pBuffer, nSize) end
        encoded_function 'GetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getsystemregistryquota
        # @param [FFI::Pointer] pdwQuotaAllowed
        # @param [FFI::Pointer] pdwQuotaUsed
        # @return [true, false]
        def self.GetSystemRegistryQuota(pdwQuotaAllowed, pdwQuotaUsed) end
        attach_function 'GetSystemRegistryQuota', [:pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariablea
        # @param [String] lpName
        # @param [String] lpGuid
        # @param [FFI::Pointer] pBuffer
        # @param [Integer] nSize
        # @return [true, false]
        def self.SetFirmwareEnvironmentVariable(lpName, lpGuid, pBuffer, nSize) end
        encoded_function 'SetFirmwareEnvironmentVariable', [:string, :string, :pointer, :dword], :bool
      end

      if WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724358
        # @param [Integer] dwOSMajorVersion
        # @param [Integer] dwOSMinorVersion
        # @param [Integer] dwSpMajorVersion
        # @param [Integer] dwSpMinorVersion
        # @param [FFI::Pointer] pdwReturnedProductType
        # @return [FFI::Pointer]
        def self.GetProductInfo(dwOSMajorVersion, dwOSMinorVersion, dwSpMajorVersion, dwSpMinorVersion,
            pdwReturnedProductType); end
        attach_function 'GetProductInfo', [:dword, :dword, :dword, :dword, :pointer], :bool

        if WINDOWS_VERSION >= 8
          require_relative '../enum/system_info/variable_attribute'

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfirmwareenvironmentvariableexa
          # @param [String] lpName
          # @param [String] lpGuid
          # @param [FFI::Pointer] pValue
          # @param [Integer] nSize
          # @param [FFI::Pointer] pdwAttributes
          # @return [true, false]
          def self.GetFirmwareEnvironmentVariableEx(lpName, lpGuid, pValue, nSize, pdwAttributes) end
          encoded_function 'GetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, :pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getfirmwaretype
          # BOOL GetFirmwareType( _Inout_  PFIRMWARE_TYPE FirmwareType )
          def self.GetFirmwareType(firmwareType) end
          attach_function 'GetFirmwareType', [:pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-isnativevhdboot
          # @param [FFI::Pointer] nativeVhdBoot
          # @return [true, false]
          def self.IsNativeVhdBoot(nativeVhdBoot) end
          attach_function 'IsNativeVhdBoot', [:pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setfirmwareenvironmentvariableexa
          # @param [String] lpName
          # @param [String] lpGuid
          # @param [FFI::Pointer] pValue
          # @param [Integer] nSize
          # @param [Integer] dwAttributes
          # @return [true, false]
          def self.SetFirmwareEnvironmentVariableEx(lpName, lpGuid, pValue, nSize, dwAttributes) end
          encoded_function 'SetFirmwareEnvironmentVariableEx', [:string, :string, :pointer, :dword, VariableAttribute],
                           :bool

          if WINDOWS_VERSION >= 8.1
            # https://docs.microsoft.com/en-us/windows/desktop/api/windowsceip/nf-windowsceip-ceipisoptedin
            # @return [true, false]
            def self.CeipIsOptedIn; end
            attach_function 'CeipIsOptedIn', [], :bool

            if WINDOWS_VERSION >= 10
              # https://msdn.microsoft.com/en-us/library/windows/desktop/dn904185
              # @param [Integer] sizeInInches
              # @return [Integer]
              def self.GetIntegratedDisplaySize(sizeInInches) end
              attach_function 'GetIntegratedDisplaySize', [:double], :hresult
            end
          end
        end
      end
    end
  end
end