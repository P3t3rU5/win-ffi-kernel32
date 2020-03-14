module WinFFI
  if WINDOWS_VERSION >= 8
    require_relative '../struct/query/package_info_reference'
    require_relative '../struct/query/package_id'

    require_relative '../enum/query/package_information'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-closepackageinfo
      # LONG ClosePackageInfo(_In_ PACKAGE_INFO_REFERENCE packageInfoReference)
      def self.ClosePackageInfo(packageInfoReference) end
      attach_function 'ClosePackageInfo', [PACKAGE_INFO_REFERENCE.ptr(:in)], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getapplicationusermodelid
      # LONG GetApplicationUserModelId(
      #   _In_    HANDLE hProcess,
      #   _Inout_ UINT32 *applicationUserModelIdLength,
      #   _Out_   PWSTR  applicationUserModelId)
      def self.GetApplicationUserModelId(hProcess, applicationUserModelIdLength, applicationUserModelId) end
      attach_function 'GetApplicationUserModelId', [:handle, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentapplicationusermodelid
      # LONG GetCurrentApplicationUserModelId(
      #   _Inout_ UINT32 *applicationUserModelIdLength,
      #   _Out_   PWSTR  applicationUserModelId)
      def self.GetCurrentApplicationUserModelId(applicationUserModelIdLength, applicationUserModelId) end
      attach_function 'GetCurrentApplicationUserModelId', [:pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentpackagefamilyname
      # LONG GetCurrentPackageFamilyName(
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      def self.GetCurrentPackageFamilyName(packageFamilyNameLength, packageFamilyName) end
      attach_function 'GetCurrentPackageFamilyName', [:pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentpackagefullname
      # LONG GetCurrentPackageFullName(_Inout_   UINT32 *packageFullNameLength, _Out_opt_ PWSTR  packageFullName)
      def self.GetCurrentPackageFullName(packageFullNameLength, packageFullName) end
      attach_function 'GetCurrentPackageFullName', [:pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentpackageid
      # LONG GetCurrentPackageId(_Inout_   UINT32 *bufferLength, _Out_opt_ BYTE   *buffer)
      def self.GetCurrentPackageId(bufferLength, buffer) end
      attach_function 'GetCurrentPackageId', [:uint32, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentpackageinfo
      # LONG GetCurrentPackageInfo(
      #   _In_      const UINT32 flags,
      #   _Inout_         UINT32 *bufferLength,
      #   _Out_opt_       BYTE   *buffer,
      #   _Out_opt_       UINT32 *count)
      def self.GetCurrentPackageInfo(flags, bufferLength, buffer, count) end
      attach_function 'GetCurrentPackageInfo', [:uint, :pointer, :pointer, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getcurrentpackagepath
      # LONG GetCurrentPackagePath( _Inout_   UINT32 *pathLength, _Out_opt_ PWSTR  path)
      def self.GetCurrentPackagePath(pathLength, path) end
      attach_function 'GetCurrentPackagePath', [:pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackagefamilyname
      # LONG GetPackageFamilyName(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      def self.GetPackageFamilyName(hProcess, packageFamilyNameLength, packageFamilyName) end
      attach_function 'GetPackageFamilyName', [:handle, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackagefullname
      # LONG GetPackageFullName(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *packageFullNameLength,
      #   _Out_opt_ PWSTR  packageFullName)
      def self.GetPackageFullName(hProcess, packageFullNameLength, packageFullName) end
      attach_function 'GetPackageFullName', [:handle, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackageid
      # LONG GetPackageId(
      #   _In_      HANDLE hProcess,
      #   _Inout_   UINT32 *bufferLength,
      #   _Out_opt_ BYTE   *pBuffer)
      def self.GetPackageId(hProcess, bufferLength, pBuffer) end
      attach_function 'GetPackageId', [:handle, :pointer, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackageinfo
      # LONG GetPackageInfo(
      #   _In_            PACKAGE_INFO_REFERENCE packageInfoReference,
      #   _In_      const UINT32                 flags,
      #   _Inout_         UINT32                 *bufferLength,
      #   _Out_opt_       BYTE                   *buffer,
      #   _Out_opt_       UINT32                 *count)
      def self.GetPackageInfo(packageInfoReference, flags, bufferLength, buffer, count) end
      attach_function 'GetPackageInfo', [PACKAGE_INFO_REFERENCE, :uint, :pointer, :pointer, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackagepath
      # LONG GetPackagePath(
      #   _In_       const PACKAGE_ID *packageId,
      #   _Reserved_ const UINT32     reserved,
      #   _Inout_          UINT32     *pathLength,
      #   _Out_opt_        PWSTR      path)
      def self.GetPackagePath(packageId, reserved, pathLength, path) end
      attach_function 'GetPackagePath', [PACKAGE_ID, :uint32, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackagesbypackagefamily
      # LONG GetPackagesByPackageFamily(
      #   _In_      PCWSTR packageFamilyName,
      #   _Inout_   UINT32 *count,
      #   _Out_opt_ PWSTR  *packageFullNames,
      #   _Inout_   UINT32 *bufferLength,
      #   _Out_opt_ WCHAR  *buffer)
      def self.GetPackagesByPackageFamily(packageFamilyName, count, packageFullNames, bufferLength, buffer) end
      attach_function 'GetPackagesByPackageFamily', [:string, :pointer, :string, :pointer, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-openpackageinfobyfullname
      # LONG OpenPackageInfoByFullName(
      #   _In_             PCWSTR                 packageFullName,
      #   _Reserved_ const UINT32                 reserved,
      #   _Out_            PACKAGE_INFO_REFERENCE *packageInfoReference)
      def self.OpenPackageInfoByFullName(packageFullName, reserved, packageInfoReference) end
      attach_function 'OpenPackageInfoByFullName', [:string, :uint32, PACKAGE_INFO_REFERENCE.ptr(:out)], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-packagefamilynamefromfullname
      # LONG PackageFamilyNameFromFullName(
      #   _In_      PCWSTR packageFullName,
      #   _Inout_   UINT32 *packageFamilyNameLength,
      #   _Out_opt_ PWSTR  packageFamilyName)
      def self.PackageFamilyNameFromFullName(packageFullName, packageFamilyNameLength, packageFamilyName) end
      attach_function 'PackageFamilyNameFromFullName', [:string, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-packagefamilynamefromid
      # LONG PackageFamilyNameFromId(
      #   _In_      const PACKAGE_ID *packageId,
      #   _Inout_         UINT32     *packageFamilyNameLength,
      #   _Out_opt_       PWSTR      packageFamilyName)
      def self.PackageFamilyNameFromId(packageId, packageFamilyNameLength, packageFamilyName) end
      attach_function 'PackageFamilyNameFromId', [PACKAGE_ID, :pointer, :string], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-packageidfromfullname
      # LONG PackageIdFromFullName(
      #   _In_            PCWSTR packageFullName,
      #   _In_      const UINT32 flags,
      #   _Inout_         UINT32 *bufferLength,
      #   _Out_opt_       BYTE   *buffer)
      def self.PackageIdFromFullName(packageFullName, flags, bufferLength, buffer) end
      attach_function 'PackageIdFromFullName', [:string, PackageInformation, :pointer, :pointer], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-packagenameandpublisheridfromfamilyname
      # LONG PackageNameAndPublisherIdFromFamilyName(
      #   _In_      PCWSTR packageFamilyName,
      #   _Inout_   UINT32 *packageNameLength,
      #   _Out_opt_ PWSTR  packageName,
      #   _Inout_   UINT32 *packagePublisherIdLength,
      #   _Out_opt_ PWSTR  packagePublisherId)
      def self.PackageNameAndPublisherIdFromFamilyName(packageFamilyName,*packageNameLength, packageName,
          packagePublisherIdLength, packagePublisherId) end
      attach_function 'PackageNameAndPublisherIdFromFamilyName', [:string, :pointer, :string, :pointer, :string], :long

      if WINDOWS_VERSION >= 8.1
        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-findpackagesbypackagefamily
        # LONG FindPackagesByPackageFamily(
        #   _In_      PCWSTR packageFamilyName,
        #   _In_      UINT32 packageFilters,
        #   _Inout_   UINT32 *count,
        #   _Out_opt_ PWSTR  *packageFullNames,
        #   _Inout_   UINT32 *bufferLength,
        #   _Out_opt_ WCHAR  *buffer,
        #   _Out_opt_ UINT32 *packageProperties)
        def self.FindPackagesByPackageFamily(packageFamilyName, packageFilters, count, packageFullNames, bufferLength,
            buffer, packageProperties) end
        attach_function 'FindPackagesByPackageFamily', [:string, :uint32, :pointer, :string, :pointer, :pointer, :pointer],
                        :long

        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-formatapplicationusermodelid
        # LONG FormatApplicationUserModelId(
        #   _In_      PCWSTR packageFamilyName,
        #   _In_      PCWSTR packageRelativeApplicationId,
        #   _Inout_   UINT32 *applicationUserModelIdLength,
        #   _Out_opt_ PWSTR  applicationUserModelId)
        def self.FormatApplicationUserModelId(packageFamilyName, packageRelativeApplicationId,
            applicationUserModelIdLength, applicationUserModelId) end
        attach_function 'FormatApplicationUserModelId', [:string, :string, :pointer, :string], :long

        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackageapplicationids
        # LONG GetPackageApplicationIds(
        #   _In_      PACKAGE_INFO_REFERENCE packageInfoReference,
        #   _Inout_   UINT32                 *bufferLength,
        #   _Out_opt_ BYTE                   *buffer,
        #   _Out_opt_ UINT32                 *count)
        def self.GetPackageApplicationIds(bufferLength, buffer, count) end
        attach_function 'GetPackageApplicationIds', [PACKAGE_INFO_REFERENCE.ptr(:in), :pointer, :pointer, :pointer],
                        :long

        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getpackagepathbyfullname
        # LONG GetPackagePathByFullName(
        #   _In_      PCWSTR packageFullName,
        #   _Inout_   UINT32 *pathLength,
        #   _Out_opt_ PWSTR  path)
        def self.GetPackagePathByFullName(packageFullName, pathLength, path) end
        attach_function 'GetPackagePathByFullName', [:string, :pointer, :string], :long

        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-getstagedpackagepathbyfullname
        # LONG GetStagedPackagePathByFullName(
        #   _In_      PCWSTR packageFullName,
        #   _Inout_   UINT32 *pathLength,
        #   _Out_opt_ PWSTR  path)
        def self.GetStagedPackagePathByFullName(packageFullName, pathLength, path) end
        attach_function 'GetStagedPackagePathByFullName', [:string, :pointer, :string], :long

        # https://docs.microsoft.com/en-us/windows/desktop/api/appmodel/nf-appmodel-parseapplicationusermodelid
        # LONG ParseApplicationUserModelId(
        #   _In_      PCWSTR applicationUserModelId,
        #   _Inout_   UINT32 *packageFamilyNameLength,
        #   _Out_opt_ PWSTR  packageFamilyName,
        #   _Inout_   UINT32 *packageRelativeApplicationIdLength,
        #   _Out_opt_ PWSTR  packageRelativeApplicationId)
        def self.ParseApplicationUserModelId(applicationUserModelId, packageFamilyNameLength, packageFamilyName,
            packageRelativeApplicationIdLength, packageRelativeApplicationId) end
        attach_function 'ParseApplicationUserModelId', [:string, :pointer, :string, :pointer, :string], :long
      end
    end
  end
end
