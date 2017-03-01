require 'win-ffi/kernel32/struct/query/package_info_reference'

module WinFFI
  if WINDOWS_VERSION >= 8
    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446594%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # LONG WINAPI ClosePackageInfo(_In_ PACKAGE_INFO_REFERENCE packageInfoReference)
      attach_function 'ClosePackageInfo', [PACKAGE_INFO_REFERENCE.ptr(:in)], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh920917(v=vs.85).aspx
      # LONG WINAPI GetApplicationUserModelId(
      #   _In_    HANDLE hProcess,
      #   _Inout_ UINT32 *applicationUserModelIdLength,
      #   _Out_   PWSTR  applicationUserModelId)
      attach_function 'GetApplicationUserModelId', [:handle, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh920918(v=vs.85).aspx
      # LONG WINAPI GetCurrentApplicationUserModelId(
      #   _Inout_ UINT32 *applicationUserModelIdLength,
      #   _Out_   PWSTR  applicationUserModelId)
      attach_function 'GetCurrentApplicationUserModelId', [:pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446598(v=vs.85).aspx
      # LONG WINAPI GetCurrentPackageFamilyName(
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      attach_function 'GetCurrentPackageFamilyName', [:pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446598
      # LONG WINAPI GetCurrentPackageFullName(_Inout_   UINT32 *packageFullNameLength, _Out_opt_ PWSTR  packageFullName)
      attach_function 'GetCurrentPackageFullName', [:pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446600(v=vs.85).aspx
      # LONG WINAPI GetCurrentPackageId(_Inout_   UINT32 *bufferLength, _Out_opt_ BYTE   *buffer)
      attach_function 'GetCurrentPackageId', [:uint32, :pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446601(v=vs.85).aspx
      # LONG WINAPI GetCurrentPackageInfo(
      #   _In_      const UINT32 flags,
      #   _Inout_         UINT32 *bufferLength,
      #   _Out_opt_       BYTE   *buffer,
      #   _Out_opt_       UINT32 *count)
      attach_function 'GetCurrentPackageInfo', [:uint, :pointer, :pointer, :pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446602(v=vs.85).aspx
      # LONG WINAPI GetCurrentPackagePath(
      #   _Inout_   UINT32 *pathLength,
      #   _Out_opt_ PWSTR  path)
      attach_function 'GetCurrentPackagePath', [:pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446603(v=vs.85).aspx
      # LONG WINAPI GetPackageFamilyName(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      attach_function 'GetPackageFamilyName', [:handle, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446605(v=vs.85).aspx
      # LONG WINAPI GetPackageFullName(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *packageFullNameLength,
      #   _Out_opt_ PWSTR  packageFullName)
      attach_function 'GetPackageFullName', [:handle, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446607%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # LONG WINAPI GetPackageId(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *bufferLength,
      #   _Out_opt_ BYTE   *pBuffer)
      attach_function 'GetPackageId', [:handle, :pointer, :pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446609%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
      # LONG WINAPI GetPackageInfo(
      #   _In_            PACKAGE_INFO_REFERENCE packageInfoReference,
      #   _In_      const UINT32                 flags,
      #   _Inout_         UINT32                 *bufferLength,
      #   _Out_opt_       BYTE                   *buffer,
      #   _Out_opt_       UINT32                 *count)
      attach_function 'GetPackageInfo', [PACKAGE_INFO_REFERENCE, :uint, :pointer, :pointer, :pointer], :long

      # LONG WINAPI GetPackagePath(
      #   _In_       const PACKAGE_ID *packageId,
      #   _Reserved_ const UINT32     reserved,
      #   _Inout_          UINT32     *pathLength,
      #   _Out_opt_        PWSTR      path)
      attach_function 'GetPackagePath', [PACKAGE_ID, :uint32, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446613(v=vs.85).aspx
      # LONG WINAPI GetPackagesByPackageFamily(
      #   _In_      PCWSTR packageFamilyName,
      #   _Inout_   UINT32 *count,
      #   _Out_opt_ PWSTR  *packageFullNames,
      #   _Inout_   UINT32 *bufferLength,
      #   _Out_opt_ WCHAR  *buffer)
      attach_function 'GetPackagesByPackageFamily', [:string, :pointer, :string, :pointer, :pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446768(v=vs.85).aspx
      # LONG WINAPI OpenPackageInfoByFullName(
      #   _In_             PCWSTR                 packageFullName,
      #   _Reserved_ const UINT32                 reserved,
      #   _Out_            PACKAGE_INFO_REFERENCE *packageInfoReference)
      attach_function 'OpenPackageInfoByFullName', [:string, :uint32, PACKAGE_INFO_REFERENCE.ptr(:out)], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446769(v=vs.85).aspx
      # LONG WINAPI PackageFamilyNameFromFullName(
      #   _In_      PCWSTR packageFullName,
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      attach_function 'PackageFamilyNameFromFullName', [:string, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446770(v=vs.85).aspx
      # LONG WINAPI PackageFamilyNameFromId(
      #   _In_      const PACKAGE_ID *packageId,
      #   _Inout_         UINT32     *packageFamilyNameLength,
      #   _Out_opt_       PWSTR      packageFamilyName)
      attach_function 'PackageFamilyNameFromId', [PACKAGE_ID, :pointer, :string], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446772(v=vs.85).aspx
      # LONG WINAPI PackageIdFromFullName(
      #   _In_            PCWSTR packageFullName,
      #   _In_      const UINT32 flags,
      #   _Inout_         UINT32 *bufferLength,
      #   _Out_opt_       BYTE   *buffer)
      attach_function 'PackageIdFromFullName', [:string, PackageInformation, :pointer, :pointer], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/hh446773(v=vs.85).aspx
      # LONG WINAPI PackageNameAndPublisherIdFromFamilyName(
      #   _In_      PCWSTR packageFamilyName,
      #   _Inout_   UINT32 *packageNameLength,
      #   _Out_opt_ PWSTR  packageName,
      #   _Inout_   UINT32 *packagePublisherIdLength,
      #   _Out_opt_ PWSTR  packagePublisherId)
      attach_function 'PackageNameAndPublisherIdFromFamilyName', [:string, :pointer, :string, :pointer, :string], :long

      if WINDOWS_VERSION >= 8.1
        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn270601%28v=vs.85%29.aspx?f=255&MSPPError=-2147217396
        # LONG WINAPI FindPackagesByPackageFamily(
        #   _In_      PCWSTR packageFamilyName,
        #   _In_      UINT32 packageFilters,
        #   _Inout_   UINT32 *count,
        #   _Out_opt_ PWSTR  *packageFullNames,
        #   _Inout_   UINT32 *bufferLength,
        #   _Out_opt_ WCHAR  *buffer,
        #   _Out_opt_ UINT32 *packageProperties)
        attach_function 'FindPackagesByPackageFamily', [:string, :uint32, :pointer, :string, :pointer, :pointer, :pointer],
                        :long

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn270602(v=vs.85).aspx
        # LONG WINAPI FormatApplicationUserModelId(
        #   _In_      PCWSTR packageFamilyName,
        #   _In_      PCWSTR packageRelativeApplicationId,
        #   _Inout_   UINT32 *applicationUserModelIdLength,
        #   _Out_opt_ PWSTR  applicationUserModelId)
        attach_function 'FormatApplicationUserModelId', [:string, :string, :pointer, :string], :long


        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn270603(v=vs.85).aspx
        # LONG WINAPI GetPackageApplicationIds(
        #   _In_      PACKAGE_INFO_REFERENCE packageInfoReference,
        #   _Inout_   UINT32                 *bufferLength,
        #   _Out_opt_ BYTE                   *buffer,
        #   _Out_opt_ UINT32                 *count)
        attach_function 'GetPackageApplicationIds', [PACKAGE_INFO_REFERENCE.ptr(:in), :pointer, :pointer, :pointer],
                        :long

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn270604(v=vs.85).aspx
        # LONG WINAPI GetPackagePathByFullName(
        #   _In_      PCWSTR packageFullName,
        #   _Inout_   UINT32 *pathLength,
        #   _Out_opt_ PWSTR  path)
        attach_function 'GetPackagePathByFullName', [:string, :pointer, :string], :long

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn270606(v=vs.85).aspx
        # LONG WINAPI GetStagedPackagePathByFullName(
        #   _In_      PCWSTR packageFullName,
        #   _Inout_   UINT32 *pathLength,
        #   _Out_opt_ PWSTR  path)
        attach_function 'GetStagedPackagePathByFullName', [:string, :pointer, :string], :long

        # https://msdn.microsoft.com/en-us/library/windows/desktop/dn313168(v=vs.85).aspx
        # LONG WINAPI ParseApplicationUserModelId(
        #   _In_      PCWSTR applicationUserModelId,
        #   _Inout_   UINT32 *packageFamilyNameLength,
        #   _Out_opt_ PWSTR  packageFamilyName,
        #   _Inout_   UINT32 *packageRelativeApplicationIdLength,
        #   _Out_opt_ PWSTR  packageRelativeApplicationId)
        attach_function 'ParseApplicationUserModelId', [:string, :pointer, :string, :pointer, :string], :long

      end
    end
  end
end
