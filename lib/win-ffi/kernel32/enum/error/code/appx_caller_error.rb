module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== APPX Caller Visible Error Codes 15600-15699 ===#
        # MessageId: ERROR_INSTALL_OPEN_PACKAGE_FAILED
        # MessageText:
        # Package could not be opened.
        :INSTALL_OPEN_PACKAGE_FAILED, 15600,
        # MessageId: ERROR_INSTALL_PACKAGE_NOT_FOUND
        # MessageText:
        # Package was not found.
        :INSTALL_PACKAGE_NOT_FOUND, 15601,
        # MessageId: ERROR_INSTALL_INVALID_PACKAGE
        # MessageText:
        # Package data is invalid.
        :INSTALL_INVALID_PACKAGE, 15602,
        # MessageId: ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED
        # MessageText:
        # Package failed updates, dependency or conflict validation.
        :INSTALL_RESOLVE_DEPENDENCY_FAILED, 15603,
        # MessageId: ERROR_INSTALL_OUT_OF_DISK_SPACE
        # MessageText:
        # There is not enough disk space on your computer. Please free up some space and try again.
        :INSTALL_OUT_OF_DISK_SPACE, 15604,
        # MessageId: ERROR_INSTALL_NETWORK_FAILURE
        # MessageText:
        # There was a problem downloading your product.
        :INSTALL_NETWORK_FAILURE, 15605,
        # MessageId: ERROR_INSTALL_REGISTRATION_FAILURE
        # MessageText:
        # Package could not be registered.
        :INSTALL_REGISTRATION_FAILURE, 15606,
        # MessageId: ERROR_INSTALL_DEREGISTRATION_FAILURE
        # MessageText:
        # Package could not be unregistered.
        :INSTALL_DEREGISTRATION_FAILURE, 15607,
        # MessageId: ERROR_INSTALL_CANCEL
        # MessageText:
        # User cancelled the install request.
        :INSTALL_CANCEL, 15608,
        # MessageId: ERROR_INSTALL_FAILED
        # MessageText:
        # Install failed. Please contact your software vendor.
        :INSTALL_FAILED, 15609,
        # MessageId: ERROR_REMOVE_FAILED
        # MessageText:
        # Removal failed. Please contact your software vendor.
        :REMOVE_FAILED, 15610,
        # MessageId: ERROR_PACKAGE_ALREADY_EXISTS
        # MessageText:
        # The provided package is already installed, and reinstallation of the package was blocked. Check the AppXDeployment-Server event log for details.
        :PACKAGE_ALREADY_EXISTS, 15611,
        # MessageId: ERROR_NEEDS_REMEDIATION
        # MessageText:
        # The application cannot be started. Try reinstalling the application to fix the problem.
        :NEEDS_REMEDIATION, 15612,
        # MessageId: ERROR_INSTALL_PREREQUISITE_FAILED
        # MessageText:
        # A Prerequisite for an install could not be satisfied.
        :INSTALL_PREREQUISITE_FAILED, 15613,
        # MessageId: ERROR_PACKAGE_REPOSITORY_CORRUPTED
        # MessageText:
        # The package repository is corrupted.
        :PACKAGE_REPOSITORY_CORRUPTED, 15614,
        # MessageId: ERROR_INSTALL_POLICY_FAILURE
        # MessageText:
        # To install this application you need either a Windows developer license or a sideloading-enabled system.
        :INSTALL_POLICY_FAILURE, 15615,
        # MessageId: ERROR_PACKAGE_UPDATING
        # MessageText:
        # The application cannot be started because it is currently updating.
        :PACKAGE_UPDATING, 15616,
        # MessageId: ERROR_DEPLOYMENT_BLOCKED_BY_POLICY
        # MessageText:
        # The package deployment operation is blocked by policy. Please contact your system administrator.
        :DEPLOYMENT_BLOCKED_BY_POLICY, 15617,
        # MessageId: ERROR_PACKAGES_IN_USE
        # MessageText:
        # The package could not be installed because resources it modifies are currently in use.
        :PACKAGES_IN_USE, 15618,
        # MessageId: ERROR_RECOVERY_FILE_CORRUPT
        # MessageText:
        # The package could not be recovered because necessary data for recovery have been corrupted.
        :RECOVERY_FILE_CORRUPT, 15619,
        # MessageId: ERROR_INVALID_STAGED_SIGNATURE
        # MessageText:
        # The signature is invalid. To register in developer mode, AppxSignature.p7x and AppxBlockMap.xml must be valid or should not be present.
        :INVALID_STAGED_SIGNATURE, 15620,
        # MessageId: ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED
        # MessageText:
        # An error occurred while deleting the package's previously existing application data.
        :DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED, 15621,
        # MessageId: ERROR_INSTALL_PACKAGE_DOWNGRADE
        # MessageText:
        # The package could not be installed because a higher version of this package is already installed.
        :INSTALL_PACKAGE_DOWNGRADE, 15622,
        # MessageId: ERROR_SYSTEM_NEEDS_REMEDIATION
        # MessageText:
        # An error in a system binary was detected. Try refreshing the PC to fix the problem.
        :SYSTEM_NEEDS_REMEDIATION, 15623,
        # MessageId: ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN
        # MessageText:
        # A corrupted CLR NGEN binary was detected on the system.
        :APPX_INTEGRITY_FAILURE_CLR_NGEN, 15624,
        # MessageId: ERROR_RESILIENCY_FILE_CORRUPT
        # MessageText:
        # The operation could not be resumed because necessary data for recovery have been corrupted.
        :RESILIENCY_FILE_CORRUPT, 15625,
        # MessageId: ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING
        # MessageText:
        # The package could not be installed because the Windows Firewall service is not running. Enable the Windows Firewall service and try again.
        :INSTALL_FIREWALL_SERVICE_NOT_RUNNING, 15626,
        # MessageId: ERROR_PACKAGE_MOVE_FAILED
        # MessageText:
        # Package move failed.
        :PACKAGE_MOVE_FAILED, 15627,
        # MessageId: ERROR_INSTALL_VOLUME_NOT_EMPTY
        # MessageText:
        # The deployment operation failed because the volume is not empty.
        :INSTALL_VOLUME_NOT_EMPTY, 15628,
        # MessageId: ERROR_INSTALL_VOLUME_OFFLINE
        # MessageText:
        # The deployment operation failed because the volume is offline.
        :INSTALL_VOLUME_OFFLINE, 15629,
        # MessageId: ERROR_INSTALL_VOLUME_CORRUPT
        # MessageText:
        # The deployment operation failed because the specified volume is corrupt.
        :INSTALL_VOLUME_CORRUPT, 15630,
        # MessageId: ERROR_NEEDS_REGISTRATION
        # MessageText:
        # The deployment operation failed because the specified application needs to be registered first.
        :NEEDS_REGISTRATION, 15631,
        # MessageId: ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE
        # MessageText:
        # The deployment operation failed because the package targets the wrong processor architecture.
        :INSTALL_WRONG_PROCESSOR_ARCHITECTURE, 15632,
        # MessageId: ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED
        # MessageText:
        # You have reached the maximum number of developer sideloaded packages allowed on this device. Please uninstall a sideloaded package and try again.
        :DEV_SIDELOAD_LIMIT_EXCEEDED, 15633,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end