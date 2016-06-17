module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        #=== Win32 Spooler Error codes 3000 to 3049 ===#
        # MessageId: ERROR_UNKNOWN_PRINT_MONITOR
        # MessageText:
        # The specified print monitor is unknown.
        :UNKNOWN_PRINT_MONITOR, 3000,
        # MessageId: ERROR_PRINTER_DRIVER_IN_USE
        # MessageText:
        # The specified printer driver is currently in use.
        :PRINTER_DRIVER_IN_USE, 3001,
        # MessageId: ERROR_SPOOL_FILE_NOT_FOUND
        # MessageText:
        # The spool file was not found.
        :SPOOL_FILE_NOT_FOUND, 3002,
        # MessageId: ERROR_SPL_NO_STARTDOC
        # MessageText:
        # A StartDocPrinter call was not issued.
        :SPL_NO_STARTDOC, 3003,
        # MessageId: ERROR_SPL_NO_ADDJOB
        # MessageText:
        # An AddJob call was not issued.
        :SPL_NO_ADDJOB, 3004,
        # MessageId: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
        # MessageText:
        # The specified print processor has already been installed.
        :PRINT_PROCESSOR_ALREADY_INSTALLED, 3005,
        # MessageId: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
        # MessageText:
        # The specified print monitor has already been installed.
        :PRINT_MONITOR_ALREADY_INSTALLED, 3006,
        # MessageId: ERROR_INVALID_PRINT_MONITOR
        # MessageText:
        # The specified print monitor does not have the required functions.
        :INVALID_PRINT_MONITOR, 3007,
        # MessageId: ERROR_PRINT_MONITOR_IN_USE
        # MessageText:
        # The specified print monitor is currently in use.
        :PRINT_MONITOR_IN_USE, 3008,
        # MessageId: ERROR_PRINTER_HAS_JOBS_QUEUED
        # MessageText:
        # The requested operation is not allowed when there are jobs queued to the printer.
        :PRINTER_HAS_JOBS_QUEUED, 3009,
        # MessageId: ERROR_SUCCESS_REBOOT_REQUIRED
        # MessageText:
        # The requested operation is successful. Changes will not be effective until the system is rebooted.
        :SUCCESS_REBOOT_REQUIRED, 3010,
        # MessageId: ERROR_SUCCESS_RESTART_REQUIRED
        # MessageText:
        # The requested operation is successful. Changes will not be effective until the service is restarted.
        :SUCCESS_RESTART_REQUIRED, 3011,
        # MessageId: ERROR_PRINTER_NOT_FOUND
        # MessageText:
        # No printers were found.
        :PRINTER_NOT_FOUND, 3012,
        # MessageId: ERROR_PRINTER_DRIVER_WARNED
        # MessageText:
        # The printer driver is known to be unreliable.
        :PRINTER_DRIVER_WARNED, 3013,
        # MessageId: ERROR_PRINTER_DRIVER_BLOCKED
        # MessageText:
        # The printer driver is known to harm the system.
        :PRINTER_DRIVER_BLOCKED, 3014,
        # MessageId: ERROR_PRINTER_DRIVER_PACKAGE_IN_USE
        # MessageText:
        # The specified printer driver package is currently in use.
        :PRINTER_DRIVER_PACKAGE_IN_USE, 3015,
        # MessageId: ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND
        # MessageText:
        # Unable to find a core driver package that is required by the printer driver package.
        :CORE_DRIVER_PACKAGE_NOT_FOUND, 3016,
        # MessageId: ERROR_FAIL_REBOOT_REQUIRED
        # MessageText:
        # The requested operation failed. A system reboot is required to roll back changes made.
        :FAIL_REBOOT_REQUIRED, 3017,
        # MessageId: ERROR_FAIL_REBOOT_INITIATED
        # MessageText:
        # The requested operation failed. A system reboot has been initiated to roll back changes made.
        :FAIL_REBOOT_INITIATED, 3018,
        # MessageId: ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED
        # MessageText:
        # The specified printer driver was not found on the system and needs to be downloaded.
        :PRINTER_DRIVER_DOWNLOAD_NEEDED, 3019,
        # MessageId: ERROR_PRINT_JOB_RESTART_REQUIRED
        # MessageText:
        # The requested print job has failed to print. A print system update requires the job to be resubmitted.
        :PRINT_JOB_RESTART_REQUIRED, 3020,
        # MessageId: ERROR_INVALID_PRINTER_DRIVER_MANIFEST
        # MessageText:
        # The printer driver does not contain a valid manifest, or contains too many manifests.
        :INVALID_PRINTER_DRIVER_MANIFEST, 3021,
        # MessageId: ERROR_PRINTER_NOT_SHAREABLE
        # MessageText:
        # The specified printer cannot be shared.
        :PRINTER_NOT_SHAREABLE, 3022,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end