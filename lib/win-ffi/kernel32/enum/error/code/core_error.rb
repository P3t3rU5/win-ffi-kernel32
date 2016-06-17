require 'win-ffi/kernel32'
module WinFFI
  module Kernel32
    ErrorBuffer = [] unless defined? ErrorBuffer
    ErrorBuffer.push(
        # MessageId: ERROR_SUCCESS
        # MessageText:
        # The operation completed successfully.
        :SUCCESS,  0,
        :NO_ERROR, 0, # dderror
        :SEC_E_OK, 0x00000000,
        # MessageId: ERROR_INVALID_FUNCTION
        # MessageText:
        # Incorrect function.
        :INVALID_FUNCTION, 1, # dderror
        # MessageId: ERROR_FILE_NOT_FOUND
        # MessageText:
        # The system cannot find the file specified.
        :FILE_NOT_FOUND, 2,
        # MessageId: ERROR_PATH_NOT_FOUND
        # MessageText:
        # The system cannot find the path specified.
        :ERROR_PATH_NOT_FOUND, 3,
        # MessageId: ERROR_TOO_MANY_OPEN_FILES
        # MessageText:
        # The system cannot open the file.
        :ERROR_TOO_MANY_OPEN_FILES, 4,
        # MessageId: ERROR_ACCESS_DENIED
        # MessageText:
        # Access is denied.
        :ERROR_ACCESS_DENIED, 5,
        # MessageId: ERROR_INVALID_HANDLE
        # MessageText:
        # The handle is invalid.
        :ERROR_INVALID_HANDLE, 6,
        # MessageId: ERROR_ARENA_TRASHED
        # MessageText:
        # The storage control blocks were destroyed.
        :ERROR_ARENA_TRASHED, 7,
        # MessageId: ERROR_NOT_ENOUGH_MEMORY
        # MessageText:
        # Not enough storage is available to process this command.
        :ERROR_NOT_ENOUGH_MEMORY, 8,    # dderror
        # MessageId: ERROR_INVALID_BLOCK
        # MessageText:
        # The storage control block address is invalid.
        :ERROR_INVALID_BLOCK, 9,
        # MessageId: ERROR_BAD_ENVIRONMENT
        # MessageText:
        # The environment is incorrect.
        :ERROR_BAD_ENVIRONMENT, 10,
        # MessageId: ERROR_BAD_FORMAT
        # MessageText:
        # An attempt was made to load a program with an incorrect format.
        :ERROR_BAD_FORMAT, 11,
        # MessageId: ERROR_INVALID_ACCESS
        # MessageText:
        # The access code is invalid.
        :INVALID_ACCESS, 12,
        # MessageId: ERROR_INVALID_DATA
        # MessageText:
        # The data is invalid.
        :INVALID_DATA, 13,
        # MessageId: ERROR_OUTOFMEMORY
        # MessageText:
        # Not enough storage is available to complete this operation.
        :OUTOFMEMORY, 14,
        # MessageId: ERROR_INVALID_DRIVE
        # MessageText:
        # The system cannot find the drive specified.
        :INVALID_DRIVE, 15,
        # MessageId: ERROR_CURRENT_DIRECTORY
        # MessageText:
        # The directory cannot be removed.
        :CURRENT_DIRECTORY, 16,
        # MessageId: ERROR_NOT_SAME_DEVICE
        # MessageText:
        # The system cannot move the file to a different disk drive.
        :NOT_SAME_DEVICE, 17,
        # MessageId: ERROR_NO_MORE_FILES
        # MessageText:
        # There are no more files.
        :NO_MORE_FILES, 18,
        # MessageId: ERROR_WRITE_PROTECT
        # MessageText:
        # The media is write protected.
        :WRITE_PROTECT, 19,
        # MessageId: ERROR_BAD_UNIT
        # MessageText:
        # The system cannot find the device specified.
        :BAD_UNIT, 20,
        # MessageId: ERROR_NOT_READY
        # MessageText:
        # The device is not ready.
        :NOT_READY, 21,
        # MessageId: ERROR_BAD_COMMAND
        # MessageText:
        # The device does not recognize the command.
        :BAD_COMMAND, 22,
        # MessageId: ERROR_CRC
        # MessageText:
        # Data error (cyclic redundancy check).
        :CRC, 23,
        # MessageId: ERROR_BAD_LENGTH
        # MessageText:
        # The program issued a command but the command length is incorrect.
        :BAD_LENGTH, 24,
        # MessageId: ERROR_SEEK
        # MessageText:
        # The drive cannot locate a specific area or track on the disk.
        :SEEK, 25,
        # MessageId: ERROR_NOT_DOS_DISK
        # MessageText:
        # The specified disk or diskette cannot be accessed.
        :NOT_DOS_DISK, 26,
        # MessageId: ERROR_SECTOR_NOT_FOUND
        # MessageText:
        # The drive cannot find the sector requested.
        :SECTOR_NOT_FOUND, 27,
        # MessageId: ERROR_OUT_OF_PAPER
        # MessageText:
        # The printer is out of paper.
        :OUT_OF_PAPER, 28,
        # MessageId: ERROR_WRITE_FAULT
        # MessageText:
        # The system cannot write to the specified device.
        :WRITE_FAULT, 29,
        # MessageId: ERROR_READ_FAULT
        # MessageText:
        # The system cannot read from the specified device.
        :READ_FAULT, 30,
        # MessageId: ERROR_GEN_FAILURE
        # MessageText:
        # A device attached to the system is not functioning.
        :GEN_FAILURE, 31,
        # MessageId: ERROR_SHARING_VIOLATION
        # MessageText:
        # The process cannot access the file because it is being used by another process.
        :SHARING_VIOLATION, 32,
        # MessageId: ERROR_LOCK_VIOLATION
        # MessageText:
        # The process cannot access the file because another process has locked a portion of the file.
        :LOCK_VIOLATION, 33,
        # MessageId: ERROR_WRONG_DISK
        # MessageText:
        # The wrong diskette is in the drive.
        # Insert %2 (Volume Serial Number: %3) into drive %1.
        :WRONG_DISK, 34,
        # MessageId: ERROR_SHARING_BUFFER_EXCEEDED
        # MessageText:
        # Too many files opened for sharing.
        :SHARING_BUFFER_EXCEEDED, 36,
        # MessageId: ERROR_HANDLE_EOF
        # MessageText:
        # Reached the end of the file.
        :HANDLE_EOF, 38,
        # MessageId: ERROR_HANDLE_DISK_FULL
        # MessageText:
        # The disk is full.
        :HANDLE_DISK_FULL, 39,
        # MessageId: ERROR_NOT_SUPPORTED
        # MessageText:
        # The request is not supported.
        :NOT_SUPPORTED, 50,
        # MessageId: ERROR_REM_NOT_LIST
        # MessageText:
        # Windows cannot find the network path. Verify that the network path is correct and the destination computer is
        # not busy or turned off. If Windows still cannot find the network path, contact your network administrator.
        :REM_NOT_LIST, 51,
        # MessageId: ERROR_DUP_NAME
        # MessageText:
        # You were not connected because a duplicate name exists on the network. If joining a domain, go to System in
        # Control Panel to change the computer name and try again. If joining a workgroup, choose another workgroup name.
        :DUP_NAME, 52,
        # MessageId: ERROR_BAD_NETPATH
        # MessageText:
        # The network path was not found.
        :BAD_NETPATH, 53,
        # MessageId: ERROR_NETWORK_BUSY
        # MessageText:
        # The network is busy.
        :NETWORK_BUSY, 54,
        # MessageId: ERROR_DEV_NOT_EXIST
        # MessageText:
        # The specified network resource or device is no longer available.
        :DEV_NOT_EXIST, 55,    # dderror
        # MessageId: ERROR_TOO_MANY_CMDS
        # MessageText:
        # The network BIOS command limit has been reached.
        :TOO_MANY_CMDS, 56,
        # MessageId: ERROR_ADAP_HDW_ERR
        # MessageText:
        # A network adapter hardware error occurred.
        :ADAP_HDW_ERR, 57,
        # MessageId: ERROR_BAD_NET_RESP
        # MessageText:
        # The specified server cannot perform the requested operation.
        :BAD_NET_RESP, 58,
        # MessageId: ERROR_UNEXP_NET_ERR
        # MessageText:
        # An unexpected network error occurred.
        :UNEXP_NET_ERR, 59,
        # MessageId: ERROR_BAD_REM_ADAP
        # MessageText:
        # The remote adapter is not compatible.
        :BAD_REM_ADAP, 60,
        # MessageId: ERROR_PRINTQ_FULL
        # MessageText:
        # The printer queue is full.
        :PRINTQ_FULL, 61,
        # MessageId: ERROR_NO_SPOOL_SPACE
        # MessageText:
        # Space to store the file waiting to be printed is not available on the server.
        :NO_SPOOL_SPACE, 62,
        # MessageId: ERROR_PRINT_CANCELLED
        # MessageText:
        # Your file waiting to be printed was deleted.
        :PRINT_CANCELLED, 63,
        # MessageId: ERROR_NETNAME_DELETED
        # MessageText:
        # The specified network name is no longer available.
        :NETNAME_DELETED, 64,
        # MessageId: ERROR_NETWORK_ACCESS_DENIED
        # MessageText:
        # Network access is denied.
        :NETWORK_ACCESS_DENIED, 65,
        # MessageId: ERROR_BAD_DEV_TYPE
        # MessageText:
        # The network resource type is not correct.
        :BAD_DEV_TYPE, 66,
        # MessageId: ERROR_BAD_NET_NAME
        # MessageText:
        # The network name cannot be found.
        :BAD_NET_NAME, 67,
        # MessageId: ERROR_TOO_MANY_NAMES
        # MessageText:
        # The name limit for the local computer network adapter card was exceeded.
        :TOO_MANY_NAMES, 68,
        # MessageId: ERROR_TOO_MANY_SESS
        # MessageText:
        # The network BIOS session limit was exceeded.
        :TOO_MANY_SESS, 69,
        # MessageId: ERROR_SHARING_PAUSED
        # MessageText:
        # The remote server has been paused or is in the process of being started.
        :SHARING_PAUSED, 70,
        # MessageId: ERROR_REQ_NOT_ACCEP
        # MessageText:
        # No more connections can be made to this remote computer at this time because there are already as many
        # connections as the computer can accept.
        :REQ_NOT_ACCEP, 71,
        # MessageId: ERROR_REDIR_PAUSED
        # MessageText:
        # The specified printer or disk device has been paused.
        :REDIR_PAUSED, 72,
        # MessageId: ERROR_FILE_EXISTS
        # MessageText:
        # The file exists.
        :FILE_EXISTS, 80,
        # MessageId: ERROR_CANNOT_MAKE
        # MessageText:
        # The directory or file cannot be created.
        :CANNOT_MAKE, 82,
        # MessageId: ERROR_FAIL_I24
        # MessageText:
        # Fail on INT 24.
        :FAIL_I24, 83,
        # MessageId: ERROR_OUT_OF_STRUCTURES
        # MessageText:
        # Storage to process this request is not available.
        :OUT_OF_STRUCTURES, 84,
        # MessageId: ERROR_ALREADY_ASSIGNED
        # MessageText:
        # The local device name is already in use.
        :ALREADY_ASSIGNED, 85,
        # MessageId: ERROR_INVALID_PASSWORD
        # MessageText:
        # The specified network password is not correct.
        :INVALID_PASSWORD, 86,
        # MessageId: ERROR_INVALID_PARAMETER
        # MessageText:
        # The parameter is incorrect.
        :INVALID_PARAMETER, 87,    # dderror
        # MessageId: ERROR_NET_WRITE_FAULT
        # MessageText:
        # A write fault occurred on the network.
        :NET_WRITE_FAULT, 88,
        # MessageId: ERROR_NO_PROC_SLOTS
        # MessageText:
        # The system cannot start another process at this time.
        :NO_PROC_SLOTS, 89,
        # MessageId: ERROR_TOO_MANY_SEMAPHORES
        # MessageText:
        # Cannot create another system semaphore.
        :TOO_MANY_SEMAPHORES, 100,
        # MessageId: ERROR_EXCL_SEM_ALREADY_OWNED
        # MessageText:
        # The exclusive semaphore is owned by another process.
        :EXCL_SEM_ALREADY_OWNED, 101,
        # MessageId: ERROR_SEM_IS_SET
        # MessageText:
        # The semaphore is set and cannot be closed.
        :SEM_IS_SET, 102,
        # MessageId: ERROR_TOO_MANY_SEM_REQUESTS
        # MessageText:
        # The semaphore cannot be set again.
        :TOO_MANY_SEM_REQUESTS, 103,
        # MessageId: ERROR_INVALID_AT_INTERRUPT_TIME
        # MessageText:
        # Cannot request exclusive semaphores at interrupt time.
        :INVALID_AT_INTERRUPT_TIME, 104,
        # MessageId: ERROR_SEM_OWNER_DIED
        # MessageText:
        # The previous ownership of this semaphore has ended.
        :SEM_OWNER_DIED, 105,
        # MessageId: ERROR_SEM_USER_LIMIT
        # MessageText:
        # Insert the diskette for drive %1.
        :SEM_USER_LIMIT, 106,
        # MessageId: ERROR_DISK_CHANGE
        # MessageText:
        # The program stopped because an alternate diskette was not inserted.
        :DISK_CHANGE, 107,
        # MessageId: ERROR_DRIVE_LOCKED
        # MessageText:
        # The disk is in use or locked by another process.
        :DRIVE_LOCKED, 108,
        # MessageId: ERROR_BROKEN_PIPE
        # MessageText:
        # The pipe has been ended.
        :BROKEN_PIPE, 109,
        # MessageId: ERROR_OPEN_FAILED
        # MessageText:
        # The system cannot open the device or file specified.
        :OPEN_FAILED, 110,
        # MessageId: ERROR_BUFFER_OVERFLOW
        # MessageText:
        # The file name is too long.
        :BUFFER_OVERFLOW, 111,
        # MessageId: ERROR_DISK_FULL
        # MessageText:
        # There is not enough space on the disk.
        :DISK_FULL, 112,
        # MessageId: ERROR_NO_MORE_SEARCH_HANDLES
        # MessageText:
        # No more internal file identifiers available.
        :NO_MORE_SEARCH_HANDLES, 113,
        # MessageId: ERROR_INVALID_TARGET_HANDLE
        # MessageText:
        # The target internal file identifier is incorrect.
        :INVALID_TARGET_HANDLE, 114,
        # MessageId: ERROR_INVALID_CATEGORY
        # MessageText:
        # The IOCTL call made by the application program is not correct.
        :INVALID_CATEGORY, 117,
        # MessageId: ERROR_INVALID_VERIFY_SWITCH
        # MessageText:
        # The verify-on-write switch parameter value is not correct.
        :INVALID_VERIFY_SWITCH, 118,
        # MessageId: ERROR_BAD_DRIVER_LEVEL
        # MessageText:
        # The system does not support the command requested.
        :BAD_DRIVER_LEVEL, 119,
        # MessageId: ERROR_CALL_NOT_IMPLEMENTED
        # MessageText:
        # This function is not supported on this system.
        :CALL_NOT_IMPLEMENTED, 120,
        # MessageId: ERROR_SEM_TIMEOUT
        # MessageText:
        # The semaphore timeout period has expired.
        :SEM_TIMEOUT, 121,
        # MessageId: ERROR_INSUFFICIENT_BUFFER
        # MessageText:
        # The data area passed to a system call is too small.
        :INSUFFICIENT_BUFFER, 122,    # dderror
        # MessageId: ERROR_INVALID_NAME
        # MessageText:
        # The filename, directory name, or volume label syntax is incorrect.
        :INVALID_NAME, 123,    # dderror
        # MessageId: ERROR_INVALID_LEVEL
        # MessageText:
        # The system call level is not correct.
        :INVALID_LEVEL, 124,
        # MessageId: ERROR_NO_VOLUME_LABEL
        # MessageText:
        # The disk has no volume label.
        :NO_VOLUME_LABEL, 125,
        # MessageId: ERROR_MOD_NOT_FOUND
        # MessageText:
        # The specified module could not be found.
        :MOD_NOT_FOUND, 126,
        # MessageId: ERROR_PROC_NOT_FOUND
        # MessageText:
        # The specified procedure could not be found.
        :PROC_NOT_FOUND, 127,
        # MessageId: ERROR_WAIT_NO_CHILDREN
        # MessageText:
        # There are no child processes to wait for.
        :WAIT_NO_CHILDREN, 128,
        # MessageId: ERROR_CHILD_NOT_COMPLETE
        # MessageText:
        # The %1 application cannot be run in Win32 mode.
        :CHILD_NOT_COMPLETE, 129,
        # MessageId: ERROR_DIRECT_ACCESS_HANDLE
        # MessageText:
        # Attempt to use a file handle to an open disk partition for an operation other than raw disk I/O.
        :DIRECT_ACCESS_HANDLE, 130,
        # MessageId: ERROR_NEGATIVE_SEEK
        # MessageText:
        # An attempt was made to move the file pointer before the beginning of the file.
        :NEGATIVE_SEEK, 131,
        # MessageId: ERROR_SEEK_ON_DEVICE
        # MessageText:
        # The file pointer cannot be set on the specified device or file.
        :SEEK_ON_DEVICE, 132,
        # MessageId: ERROR_IS_JOIN_TARGET
        # MessageText:
        # A JOIN or SUBST command cannot be used for a drive that contains previously joined drives.
        :IS_JOIN_TARGET, 133,
        # MessageId: ERROR_IS_JOINED
        # MessageText:
        # An attempt was made to use a JOIN or SUBST command on a drive that has already been joined.
        :IS_JOINED, 134,
        # MessageId: ERROR_IS_SUBSTED
        # MessageText:
        # An attempt was made to use a JOIN or SUBST command on a drive that has already been substituted.
        :IS_SUBSTED, 135,
        # MessageId: ERROR_NOT_JOINED
        # MessageText:
        # The system tried to delete the JOIN of a drive that is not joined.
        :NOT_JOINED, 136,
        # MessageId: ERROR_NOT_SUBSTED
        # MessageText:
        # The system tried to delete the substitution of a drive that is not substituted.
        :NOT_SUBSTED, 137,
        # MessageId: ERROR_JOIN_TO_JOIN
        # MessageText:
        # The system tried to join a drive to a directory on a joined drive.
        :JOIN_TO_JOIN, 138,
        # MessageId: ERROR_SUBST_TO_SUBST
        # MessageText:
        # The system tried to substitute a drive to a directory on a substituted drive.
        :SUBST_TO_SUBST, 139,
        # MessageId: ERROR_JOIN_TO_SUBST
        # MessageText:
        # The system tried to join a drive to a directory on a substituted drive.
        :JOIN_TO_SUBST, 140,
        # MessageId: ERROR_SUBST_TO_JOIN
        # MessageText:
        # The system tried to SUBST a drive to a directory on a joined drive.
        :SUBST_TO_JOIN, 141,
        # MessageId: ERROR_BUSY_DRIVE
        # MessageText:
        # The system cannot perform a JOIN or SUBST at this time.
        :BUSY_DRIVE, 142,
        # MessageId: ERROR_SAME_DRIVE
        # MessageText:
        # The system cannot join or substitute a drive to or for a directory on the same drive.
        :SAME_DRIVE, 143,
        # MessageId: ERROR_DIR_NOT_ROOT
        # MessageText:
        # The directory is not a subdirectory of the root directory.
        :DIR_NOT_ROOT, 144,
        # MessageId: ERROR_DIR_NOT_EMPTY
        # MessageText:
        # The directory is not empty.
        :DIR_NOT_EMPTY, 145,
        # MessageId: ERROR_IS_SUBST_PATH
        # MessageText:
        # The path specified is being used in a substitute.
        :IS_SUBST_PATH, 146,
        # MessageId: ERROR_IS_JOIN_PATH
        # MessageText:
        # Not enough resources are available to process this command.
        :IS_JOIN_PATH, 147,
        # MessageId: ERROR_PATH_BUSY
        # MessageText:
        # The path specified cannot be used at this time.
        :PATH_BUSY, 148,
        # MessageId: ERROR_IS_SUBST_TARGET
        # MessageText:
        # An attempt was made to join or substitute a drive for which a directory on the drive is the target of a
        # previous substitute.
        :IS_SUBST_TARGET, 149,
        # MessageId: ERROR_SYSTEM_TRACE
        # MessageText:
        # System trace information was not specified in your CONFIG.SYS file, or tracing is disallowed.
        :SYSTEM_TRACE, 150,
        # MessageId: ERROR_INVALID_EVENT_COUNT
        # MessageText:
        # The number of specified semaphore events for DosMuxSemWait is not correct.
        :INVALID_EVENT_COUNT, 151,
        # MessageId: ERROR_TOO_MANY_MUXWAITERS
        # MessageText:
        # DosMuxSemWait did not execute; too many semaphores are already set.
        :TOO_MANY_MUXWAITERS, 152,
        # MessageId: ERROR_INVALID_LIST_FORMAT
        # MessageText:
        # The DosMuxSemWait list is not correct.
        :INVALID_LIST_FORMAT, 153,
        # MessageId: ERROR_LABEL_TOO_LONG
        # MessageText:
        # The volume label you entered exceeds the label character limit of the target file system.
        :LABEL_TOO_LONG, 154,
        # MessageId: ERROR_TOO_MANY_TCBS
        # MessageText:
        # Cannot create another thread.
        :TOO_MANY_TCBS, 155,
        # MessageId: ERROR_SIGNAL_REFUSED
        # MessageText:
        # The recipient process has refused the signal.
        :SIGNAL_REFUSED, 156,
        # MessageId: ERROR_DISCARDED
        # MessageText:
        # The segment is already discarded and cannot be locked.
        :DISCARDED, 157,
        # MessageId: ERROR_NOT_LOCKED
        # MessageText:
        # The segment is already unlocked.
        :NOT_LOCKED, 158,
        # MessageId: ERROR_BAD_THREADID_ADDR
        # MessageText:
        # The address for the thread ID is not correct.
        :BAD_THREADID_ADDR, 159,
        # MessageId: ERROR_BAD_ARGUMENTS
        # MessageText:
        # One or more arguments are not correct.
        :BAD_ARGUMENTS, 160,
        # MessageId: ERROR_BAD_PATHNAME
        # MessageText:
        # The specified path is invalid.
        :BAD_PATHNAME, 161,
        # MessageId: ERROR_SIGNAL_PENDING
        # MessageText:
        # A signal is already pending.
        :SIGNAL_PENDING, 162,
        # MessageId: ERROR_MAX_THRDS_REACHED
        # MessageText:
        # No more threads can be created in the system.
        :MAX_THRDS_REACHED, 164,
        # MessageId: ERROR_LOCK_FAILED
        # MessageText:
        # Unable to lock a region of a file.
        :LOCK_FAILED, 167,
        # MessageId: ERROR_BUSY
        # MessageText:
        # The requested resource is in use.
        :BUSY, 170,    # dderror
        # MessageId: ERROR_DEVICE_SUPPORT_IN_PROGRESS
        # MessageText:
        # Device's command support detection is in progress.
        :DEVICE_SUPPORT_IN_PROGRESS, 171,
        # MessageId: ERROR_CANCEL_VIOLATION
        # MessageText:
        # A lock request was not outstanding for the supplied cancel region.
        :CANCEL_VIOLATION, 173,
        # MessageId: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
        # MessageText:
        # The file system does not support atomic changes to the lock type.
        :ATOMIC_LOCKS_NOT_SUPPORTED, 174,
        # MessageId: ERROR_INVALID_SEGMENT_NUMBER
        # MessageText:
        # The system detected a segment number that was not correct.
        :INVALID_SEGMENT_NUMBER, 180,
        # MessageId: ERROR_INVALID_ORDINAL
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_ORDINAL, 182,
        # MessageId: ERROR_ALREADY_EXISTS
        # MessageText:
        # Cannot create a file when that file already exists.
        :ALREADY_EXISTS, 183,
        ## MessageId: ERROR_INVALID_FLAG_NUMBER
        # MessageText:
        # The flag passed is not correct.
        :INVALID_FLAG_NUMBER, 186,
        # MessageId: ERROR_SEM_NOT_FOUND
        # MessageText:
        # The specified system semaphore name was not found.
        :SEM_NOT_FOUND, 187,
        # MessageId: ERROR_INVALID_STARTING_CODESEG
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_STARTING_CODESEG, 188,
        # MessageId: ERROR_INVALID_STACKSEG
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_STACKSEG, 189,
        # MessageId: ERROR_INVALID_MODULETYPE
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_MODULETYPE, 190,
        # MessageId: ERROR_INVALID_EXE_SIGNATURE
        # MessageText:
        # Cannot run %1 in Win32 mode.
        :INVALID_EXE_SIGNATURE, 191,
        # MessageId: ERROR_EXE_MARKED_INVALID
        # MessageText:
        # The operating system cannot run %1.
        :EXE_MARKED_INVALID, 192,
        # MessageId: ERROR_BAD_EXE_FORMAT
        # MessageText:
        # %1 is not a valid Win32 application.
        :BAD_EXE_FORMAT, 193,
        # MessageId: ERROR_ITERATED_DATA_EXCEEDS_64k
        # MessageText:
        # The operating system cannot run %1.
        :ITERATED_DATA_EXCEEDS_64k, 194,
        # MessageId: ERROR_INVALID_MINALLOCSIZE
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_MINALLOCSIZE, 195,
        # MessageId: ERROR_DYNLINK_FROM_INVALID_RING
        # MessageText:
        # The operating system cannot run this application program.
        :DYNLINK_FROM_INVALID_RING, 196,
        # MessageId: ERROR_IOPL_NOT_ENABLED
        # MessageText:
        # The operating system is not presently configured to run this application.
        :IOPL_NOT_ENABLED, 197,
        # MessageId: ERROR_INVALID_SEGDPL
        # MessageText:
        # The operating system cannot run %1.
        :INVALID_SEGDPL, 198,
        # MessageId: ERROR_AUTODATASEG_EXCEEDS_64k
        # MessageText:
        # The operating system cannot run this application program.
        :AUTODATASEG_EXCEEDS_64k, 199,
        # MessageId: ERROR_RING2SEG_MUST_BE_MOVABLE
        # MessageText:
        # The code segment cannot be greater than or equal to 64K.
        :RING2SEG_MUST_BE_MOVABLE, 200,
        # MessageId: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
        # MessageText:
        # The operating system cannot run %1.
        :RELOC_CHAIN_XEEDS_SEGLIM, 201,
        # MessageId: ERROR_INFLOOP_IN_RELOC_CHAIN
        # MessageText:
        # The operating system cannot run %1.
        :INFLOOP_IN_RELOC_CHAIN, 202,
        # MessageId: ERROR_ENVVAR_NOT_FOUND
        # MessageText:
        # The system could not find the environment option that was entered.
        :ENVVAR_NOT_FOUND, 203,
        # MessageId: ERROR_NO_SIGNAL_SENT
        # MessageText:
        # No process in the command subtree has a signal handler.
        :NO_SIGNAL_SENT, 205,
        # MessageId: ERROR_FILENAME_EXCED_RANGE
        # MessageText:
        # The filename or extension is too long.
        :FILENAME_EXCED_RANGE, 206,
        # MessageId: ERROR_RING2_STACK_IN_USE
        # MessageText:
        # The ring 2 stack is in use.
        :RING2_STACK_IN_USE, 207,
        # MessageId: ERROR_META_EXPANSION_TOO_LONG
        # MessageText:
        # The global filename characters, * or ?, are entered incorrectly or too many global filename characters are
        # specified.
        :META_EXPANSION_TOO_LONG, 208,
        # MessageId: ERROR_INVALID_SIGNAL_NUMBER
        # MessageText:
        # The signal being posted is not correct.
        :INVALID_SIGNAL_NUMBER, 209,
        # MessageId: ERROR_THREAD_1_INACTIVE
        # MessageText:
        # The signal handler cannot be set.
        :THREAD_1_INACTIVE, 210,
        # MessageId: ERROR_LOCKED
        # MessageText:
        # The segment is locked and cannot be reallocated.
        :LOCKED, 212,
        # MessageId: ERROR_TOO_MANY_MODULES
        # MessageText:
        # Too many dynamic-link modules are attached to this program or dynamic-link module.
        :TOO_MANY_MODULES, 214,
        # MessageId: ERROR_NESTING_NOT_ALLOWED
        # MessageText:
        # Cannot nest calls to LoadModule.
        :NESTING_NOT_ALLOWED, 215,
        # MessageId: ERROR_EXE_MACHINE_TYPE_MISMATCH
        # MessageText:
        # This version of %1 is not compatible with the version of Windows you're running. Check your computer's system
        # information and then contact the software publisher.
        :EXE_MACHINE_TYPE_MISMATCH, 216,
        # MessageId: ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY
        # MessageText:
        # The image file %1 is signed, unable to modify.
        :EXE_CANNOT_MODIFY_SIGNED_BINARY, 217,
        # MessageId: ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY
        # MessageText:
        # The image file %1 is strong signed, unable to modify.
        :EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY, 218,
        # MessageId: ERROR_FILE_CHECKED_OUT
        # MessageText:
        # This file is checked out or locked for editing by another user.
        :FILE_CHECKED_OUT, 220,
        # MessageId: ERROR_CHECKOUT_REQUIRED
        # MessageText:
        # The file must be checked out before saving changes.
        :CHECKOUT_REQUIRED, 221,
        # MessageId: ERROR_BAD_FILE_TYPE
        # MessageText:
        # The file type being saved or retrieved has been blocked.
        :BAD_FILE_TYPE, 222,
        # MessageId: ERROR_FILE_TOO_LARGE
        # MessageText:
        # The file size exceeds the limit allowed and cannot be saved.
        :FILE_TOO_LARGE, 223,
        # MessageId: ERROR_FORMS_AUTH_REQUIRED
        # MessageText:
        # Access Denied. Before opening files in this location, you must first add the web site to your trusted sites
        # list, browse to the web site, and select the option to login automatically.
        :FORMS_AUTH_REQUIRED, 224,
        # MessageId: ERROR_VIRUS_INFECTED
        # MessageText:
        # Operation did not complete successfully because the file contains a virus or potentially unwanted software.
        :VIRUS_INFECTED, 225,
        # MessageId: ERROR_VIRUS_DELETED
        # MessageText:
        # This file contains a virus or potentially unwanted software and cannot be opened. Due to the nature of this
        # virus or potentially unwanted software, the file has been removed from this location.
        :VIRUS_DELETED, 226,
        # MessageId: ERROR_PIPE_LOCAL
        # MessageText:
        # The pipe is local.
        :PIPE_LOCAL, 229,
        # MessageId: ERROR_BAD_PIPE
        # MessageText:
        # The pipe state is invalid.
        :BAD_PIPE, 230,
        # MessageId: ERROR_PIPE_BUSY
        # MessageText:
        # All pipe instances are busy.
        :PIPE_BUSY, 231,
        # MessageId: ERROR_NO_DATA
        # MessageText:
        # The pipe is being closed.
        :NO_DATA, 232,
        # MessageId: ERROR_PIPE_NOT_CONNECTED
        # MessageText:
        # No process is on the other end of the pipe.
        :PIPE_NOT_CONNECTED, 233,
        # MessageId: ERROR_MORE_DATA
        # MessageText:
        # More data is available.
        :MORE_DATA, 234,    # dderror# MessageId: ERROR_VC_DISCONNECTED
        # MessageText:
        # The session was canceled.
        :VC_DISCONNECTED, 240,
        # MessageId: ERROR_INVALID_EA_NAME
        # MessageText:
        # The specified extended attribute name was invalid.
        :INVALID_EA_NAME, 254,
        # MessageId: ERROR_EA_LIST_INCONSISTENT
        # MessageText:
        # The extended attributes are inconsistent.
        :EA_LIST_INCONSISTENT, 255,
        # MessageId: WAIT_TIMEOUT
        # MessageText:
        # The wait operation timed out.
        :WAIT_TIMEOUT, 258,
        # dderror
        # # MessageId: ERROR_NO_MORE_ITEMS
        # MessageText:
        # No more data is available.
        :NO_MORE_ITEMS, 259,
        # MessageId: ERROR_CANNOT_COPY
        # MessageText:
        # The copy functions cannot be used.
        :CANNOT_COPY, 266,
        # MessageId: ERROR_DIRECTORY
        # MessageText:
        # The directory name is invalid.
        :DIRECTORY, 267,
        # MessageId: ERROR_EAS_DIDNT_FIT
        # MessageText:
        # The extended attributes did not fit in the buffer.
        :EAS_DIDNT_FIT, 275,
        # MessageId: ERROR_EA_FILE_CORRUPT
        # MessageText:
        # The extended attribute file on the mounted file system is corrupt.
        :EA_FILE_CORRUPT, 276,
        # MessageId: ERROR_EA_TABLE_FULL
        # MessageText:
        # The extended attribute table file is full.
        :EA_TABLE_FULL, 277,
        # MessageId: ERROR_INVALID_EA_HANDLE
        # MessageText:
        # The specified extended attribute handle is invalid.
        :INVALID_EA_HANDLE, 278,
        # MessageId: ERROR_EAS_NOT_SUPPORTED
        # MessageText:
        # The mounted file system does not support extended attributes.
        :EAS_NOT_SUPPORTED, 282,
        # MessageId: ERROR_NOT_OWNER
        # MessageText:
        # Attempt to release mutex not owned by caller.
        :NOT_OWNER, 288,
        # MessageId: ERROR_TOO_MANY_POSTS
        # MessageText:
        # Too many posts were made to a semaphore.
        :TOO_MANY_POSTS, 298,
        # MessageId: ERROR_PARTIAL_COPY
        # MessageText:
        # Only part of a ReadProcessMemory or WriteProcessMemory request was completed.
        :PARTIAL_COPY, 299,
        # MessageId: ERROR_OPLOCK_NOT_GRANTED
        # MessageText:
        # The oplock request is denied.
        :OPLOCK_NOT_GRANTED, 300,
        # MessageId: ERROR_INVALID_OPLOCK_PROTOCOL
        # MessageText:
        # An invalid oplock acknowledgment was received by the system.
        :INVALID_OPLOCK_PROTOCOL, 301,
        # MessageId: ERROR_DISK_TOO_FRAGMENTED
        # MessageText:
        # The volume is too fragmented to complete this operation.
        :DISK_TOO_FRAGMENTED, 302,
        # MessageId: ERROR_DELETE_PENDING
        # MessageText:
        # The file cannot be opened because it is in the process of being deleted.
        :DELETE_PENDING, 303,
        # MessageId: ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING
        # MessageText:
        # Short name settings may not be changed on this volume due to the global registry setting.
        :INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING, 304,
        # MessageId: ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME
        # MessageText:
        # Short names are not enabled on this volume.
        :SHORT_NAMES_NOT_ENABLED_ON_VOLUME, 305,
        # MessageId: ERROR_SECURITY_STREAM_IS_INCONSISTENT
        # MessageText:
        # The security stream for the given volume is in an inconsistent state.
        # Please run CHKDSK on the volume.
        :SECURITY_STREAM_IS_INCONSISTENT, 306,
        # MessageId: ERROR_INVALID_LOCK_RANGE
        # MessageText:
        # A requested file lock operation cannot be processed due to an invalid byte range.
        :INVALID_LOCK_RANGE, 307,
        # MessageId: ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT
        # MessageText:
        # The subsystem needed to support the image type is not present.
        :IMAGE_SUBSYSTEM_NOT_PRESENT, 308,
        # MessageId: ERROR_NOTIFICATION_GUID_ALREADY_DEFINED
        # MessageText:
        # The specified file already has a notification GUID associated with it.
        :NOTIFICATION_GUID_ALREADY_DEFINED, 309,
        # MessageId: ERROR_INVALID_EXCEPTION_HANDLER
        # MessageText:
        # An invalid exception handler routine has been detected.
        :INVALID_EXCEPTION_HANDLER, 310,
        # MessageId: ERROR_DUPLICATE_PRIVILEGES
        # MessageText:
        # Duplicate privileges were specified for the token.
        :DUPLICATE_PRIVILEGES, 311,
        # MessageId: ERROR_NO_RANGES_PROCESSED
        # MessageText:
        # No ranges for the specified operation were able to be processed.
        :NO_RANGES_PROCESSED, 312,
        # MessageId: ERROR_NOT_ALLOWED_ON_SYSTEM_FILE
        # MessageText:
        # Operation is not allowed on a file system internal file.
        :NOT_ALLOWED_ON_SYSTEM_FILE, 313,
        # MessageId: ERROR_DISK_RESOURCES_EXHAUSTED
        # MessageText:
        # The physical resources of this disk have been exhausted.
        :DISK_RESOURCES_EXHAUSTED, 314,
        # MessageId: ERROR_INVALID_TOKEN
        # MessageText:
        # The token representing the data is invalid.
        :INVALID_TOKEN, 315,
        # MessageId: ERROR_DEVICE_FEATURE_NOT_SUPPORTED
        # MessageText:
        # The device does not support the command feature.
        :DEVICE_FEATURE_NOT_SUPPORTED, 316,
        # MessageId: ERROR_MR_MID_NOT_FOUND
        # MessageText:
        # The system cannot find message text for message number 0x%1 in the message file for %2.
        :MR_MID_NOT_FOUND, 317,
        # MessageId: ERROR_SCOPE_NOT_FOUND
        # MessageText:
        # The scope specified was not found.
        :SCOPE_NOT_FOUND, 318,
        # MessageId: ERROR_UNDEFINED_SCOPE
        # MessageText:
        # The Central Access Policy specified is not defined on the target machine.
        :UNDEFINED_SCOPE, 319,
        # MessageId: ERROR_INVALID_CAP
        # MessageText:
        # The Central Access Policy obtained from Active Directory is invalid.
        :INVALID_CAP, 320,
        # MessageId: ERROR_DEVICE_UNREACHABLE
        # MessageText:
        # The device is unreachable.
        :DEVICE_UNREACHABLE, 321,
        # MessageId: ERROR_DEVICE_NO_RESOURCES
        # MessageText:
        # The target device has insufficient resources to complete the operation.
        :DEVICE_NO_RESOURCES, 322,
        # MessageId: ERROR_DATA_CHECKSUM_ERROR
        # MessageText:
        # A data integrity checksum error occurred. Data in the file stream is corrupt.
        :DATA_CHECKSUM_ERROR, 323,
        # MessageId: ERROR_INTERMIXED_KERNEL_EA_OPERATION
        # MessageText:
        # An attempt was made to modify both a KERNEL and normal Extended Attribute (EA) in the same operation.
        :INTERMIXED_KERNEL_EA_OPERATION, 324,
        # MessageId: ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED
        # MessageText:
        # Device does not support file-level TRIM.
        :FILE_LEVEL_TRIM_NOT_SUPPORTED, 326,
        # MessageId: ERROR_OFFSET_ALIGNMENT_VIOLATION
        # MessageText:
        # The command specified a data offset that does not align to the device's granularity/alignment.
        :OFFSET_ALIGNMENT_VIOLATION, 327,
        # MessageId: ERROR_INVALID_FIELD_IN_PARAMETER_LIST
        # MessageText:
        # The command specified an invalid field in its parameter list.
        :INVALID_FIELD_IN_PARAMETER_LIST, 328,
        # MessageId: ERROR_OPERATION_IN_PROGRESS
        # MessageText:
        # An operation is currently in progress with the device.
        :OPERATION_IN_PROGRESS, 329,
        # MessageId: ERROR_BAD_DEVICE_PATH
        # MessageText:
        # An attempt was made to send down the command via an invalid path to the target device.
        :BAD_DEVICE_PATH, 330,
        # MessageId: ERROR_TOO_MANY_DESCRIPTORS
        # MessageText:
        # The command specified a number of descriptors that exceeded the maximum supported by the device.
        :TOO_MANY_DESCRIPTORS, 331,
        # MessageId: ERROR_SCRUB_DATA_DISABLED
        # MessageText:
        # Scrub is disabled on the specified file.
        :SCRUB_DATA_DISABLED, 332,
        # MessageId: ERROR_NOT_REDUNDANT_STORAGE
        # MessageText:
        # The storage device does not provide redundancy.
        :NOT_REDUNDANT_STORAGE, 333,
        # MessageId: ERROR_RESIDENT_FILE_NOT_SUPPORTED
        # MessageText:
        # An operation is not supported on a resident file.
        :RESIDENT_FILE_NOT_SUPPORTED, 334,
        # MessageId: ERROR_COMPRESSED_FILE_NOT_SUPPORTED
        # MessageText:
        # An operation is not supported on a compressed file.
        :COMPRESSED_FILE_NOT_SUPPORTED, 335,
        # MessageId: ERROR_DIRECTORY_NOT_SUPPORTED
        # MessageText:
        # An operation is not supported on a directory.
        :DIRECTORY_NOT_SUPPORTED, 336,
        # MessageId: ERROR_NOT_READ_FROM_COPY
        # MessageText:
        # The specified copy of the requested data could not be read.
        :NOT_READ_FROM_COPY, 337,
        # MessageId: ERROR_FT_WRITE_FAILURE
        # MessageText:
        # The specified data could not be written to any of the copies.
        :FT_WRITE_FAILURE, 338,
        # MessageId: ERROR_FT_DI_SCAN_REQUIRED
        # MessageText:
        # One or more copies of data on this device may be out of sync. No writes may be performed until a data
        # integrity scan is completed.
        :FT_DI_SCAN_REQUIRED, 339,
        # MessageId: ERROR_INVALID_KERNEL_INFO_VERSION
        # MessageText:
        # The supplied kernel information version is invalid.
        :INVALID_KERNEL_INFO_VERSION, 340,
        # MessageId: ERROR_INVALID_PEP_INFO_VERSION
        # MessageText:
        # The supplied PEP information version is invalid.
        :INVALID_PEP_INFO_VERSION, 341,
        # MessageId: ERROR_OBJECT_NOT_EXTERNALLY_BACKED
        # MessageText:
        # This object is not externally backed by any provider.
        :OBJECT_NOT_EXTERNALLY_BACKED, 342,
        # MessageId: ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN
        # MessageText:
        # The external backing provider is not recognized.
        :EXTERNAL_BACKING_PROVIDER_UNKNOWN, 343,
        # MessageId: ERROR_COMPRESSION_NOT_BENEFICIAL
        # MessageText:
        # Compressing this object would not save space.
        :COMPRESSION_NOT_BENEFICIAL, 344,
        # MessageId: ERROR_STORAGE_TOPOLOGY_ID_MISMATCH
        # MessageText:
        # The request failed due to a storage topology ID mismatch.
        :STORAGE_TOPOLOGY_ID_MISMATCH, 345,
        # MessageId: ERROR_BLOCKED_BY_PARENTAL_CONTROLS
        # MessageText:
        # The operation was blocked by parental controls.
        :BLOCKED_BY_PARENTAL_CONTROLS, 346,
        # MessageId: ERROR_BLOCK_TOO_MANY_REFERENCES
        # MessageText:
        # A file system block being referenced has already reached the maximum reference count and can't be referenced
        # any further.
        :BLOCK_TOO_MANY_REFERENCES, 347,
        # MessageId: ERROR_MARKED_TO_DISALLOW_WRITES
        # MessageText:
        # The requested operation failed because the file stream is marked to disallow writes.
        :MARKED_TO_DISALLOW_WRITES, 348,
        # MessageId: ERROR_ENCLAVE_FAILURE
        # MessageText:
        # The requested operation failed with an architecture-specific failure code.
        :ENCLAVE_FAILURE, 349,
        # MessageId: ERROR_FAIL_NOACTION_REBOOT
        # MessageText:
        # No action was taken as a system reboot is required.
        :FAIL_NOACTION_REBOOT, 350,
        # MessageId: ERROR_FAIL_SHUTDOWN
        # MessageText:
        # The shutdown operation failed.
        :FAIL_SHUTDOWN, 351,
        # MessageId: ERROR_FAIL_RESTART
        # MessageText:
        # The restart operation failed.
        :FAIL_RESTART, 352,
        # MessageId: ERROR_MAX_SESSIONS_REACHED
        # MessageText:
        # The maximum number of sessions has been reached.
        :MAX_SESSIONS_REACHED, 353,
        # MessageId: ERROR_NETWORK_ACCESS_DENIED_EDP
        # MessageText:
        # Enterprise Data Protection policy does not allow access to this network resource.
        :NETWORK_ACCESS_DENIED_EDP, 354,
        # MessageId: ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL
        # MessageText:
        # The device hint name buffer is too small to receive the remaining name.
        :DEVICE_HINT_NAME_BUFFER_TOO_SMALL, 355,
        # MessageId: ERROR_EDP_POLICY_DENIES_OPERATION
        # MessageText:
        # The requested operation was blocked by Enterprise Data Protection policy. For more information, contact your
        # system administrator.
        :EDP_POLICY_DENIES_OPERATION, 356,
        # **** Available SYSTEM error codes ****
        # MessageId: ERROR_THREAD_MODE_ALREADY_BACKGROUND
        # MessageText:
        # The thread is already in background processing mode.
        :THREAD_MODE_ALREADY_BACKGROUND, 400,
        # MessageId: ERROR_THREAD_MODE_NOT_BACKGROUND
        # MessageText:
        # The thread is not in background processing mode.
        :THREAD_MODE_NOT_BACKGROUND, 401,
        # MessageId: ERROR_PROCESS_MODE_ALREADY_BACKGROUND
        # MessageText:
        # The process is already in background processing mode.
        :PROCESS_MODE_ALREADY_BACKGROUND, 402,
        # MessageId: ERROR_PROCESS_MODE_NOT_BACKGROUND
        # MessageText:
        # The process is not in background processing mode.
        :PROCESS_MODE_NOT_BACKGROUND, 403,
        # **** Available SYSTEM error codes ****

        # **** Available SYSTEM error codes ****
        # MessageId: ERROR_DEVICE_HARDWARE_ERROR
        # MessageText:
        # The request failed due to a fatal device hardware error.
        :DEVICE_HARDWARE_ERROR, 483,
        # MessageId: ERROR_INVALID_ADDRESS
        # MessageText:
        # Attempt to access invalid address.
        :INVALID_ADDRESS, 487,
        # **** Available SYSTEM error codes ****
        # MessageId: ERROR_USER_PROFILE_LOAD
        # MessageText:
        # User profile cannot be loaded.
        :USER_PROFILE_LOAD, 500,
        # **** Available SYSTEM error codes ****
        # MessageId: ERROR_ARITHMETIC_OVERFLOW
        # MessageText:
        # Arithmetic result exceeded 32 bits.
        :ARITHMETIC_OVERFLOW, 534,
        # MessageId: ERROR_PIPE_CONNECTED
        # MessageText:
        # There is a process on other end of the pipe.
        :PIPE_CONNECTED, 535,
        # MessageId: ERROR_PIPE_LISTENING
        # MessageText:
        # Waiting for a process to open the other end of the pipe.
        :PIPE_LISTENING, 536,
        # MessageId: ERROR_VERIFIER_STOP
        # MessageText:
        # Application verifier has found an error in the current process.
        :VERIFIER_STOP, 537,
        # MessageId: ERROR_ABIOS_ERROR
        # MessageText:
        # An error occurred in the ABIOS subsystem.
        :ABIOS_ERROR, 538,
        # MessageId: ERROR_WX86_WARNING
        # MessageText:
        # A warning occurred in the WX86 subsystem.
        :WX86_WARNING, 539,
        # MessageId: ERROR_WX86_ERROR
        # MessageText:
        # An error occurred in the WX86 subsystem.
        :WX86_ERROR, 540,
        # MessageId: ERROR_TIMER_NOT_CANCELED
        # MessageText:
        # An attempt was made to cancel or set a timer that has an associated APC and the subject thread is not the
        # thread that originally set the timer with an associated APC routine.
        :TIMER_NOT_CANCELED, 541,
        # MessageId: ERROR_UNWIND
        # MessageText:
        # Unwind exception code.
        :UNWIND, 542,
        # MessageId: ERROR_BAD_STACK
        # MessageText:
        # An invalid or unaligned stack was encountered during an unwind operation.
        :BAD_STACK, 543,
        # MessageId: ERROR_INVALID_UNWIND_TARGET
        # MessageText:
        # An invalid unwind target was encountered during an unwind operation.
        :INVALID_UNWIND_TARGET, 544,
        # MessageId: ERROR_INVALID_PORT_ATTRIBUTES
        # MessageText:
        # Invalid Object Attributes specified to NtCreatePort or invalid Port Attributes specified to NtConnectPort
        :INVALID_PORT_ATTRIBUTES, 545,
        # MessageId: ERROR_PORT_MESSAGE_TOO_LONG
        # MessageText:
        # Length of message passed to NtRequestPort or NtRequestWaitReplyPort was longer than the maximum message
        # allowed by the port.
        :PORT_MESSAGE_TOO_LONG, 546,
        # MessageId: ERROR_INVALID_QUOTA_LOWER
        # MessageText:
        # An attempt was made to lower a quota limit below the current usage.
        :INVALID_QUOTA_LOWER, 547,
        # MessageId: ERROR_DEVICE_ALREADY_ATTACHED
        # MessageText:
        # An attempt was made to attach to a device that was already attached to another device.
        :DEVICE_ALREADY_ATTACHED, 548,
        # MessageId: ERROR_INSTRUCTION_MISALIGNMENT
        # MessageText:
        # An attempt was made to execute an instruction at an unaligned address and the host system does not support
        # unaligned instruction references.
        :INSTRUCTION_MISALIGNMENT, 549,
        # MessageId: ERROR_PROFILING_NOT_STARTED
        # MessageText:
        # Profiling not started.
        :PROFILING_NOT_STARTED, 550,
        # MessageId: ERROR_PROFILING_NOT_STOPPED
        # MessageText:
        # Profiling not stopped.
        :PROFILING_NOT_STOPPED, 551,
        # MessageId: ERROR_COULD_NOT_INTERPRET
        # MessageText:
        # The passed ACL did not contain the minimum required information.
        :COULD_NOT_INTERPRET, 552,
        # MessageId: ERROR_PROFILING_AT_LIMIT
        # MessageText:
        # The number of active profiling objects is at the maximum and no more may be started.
        :PROFILING_AT_LIMIT, 553,
        # MessageId: ERROR_CANT_WAIT
        # MessageText:
        # Used to indicate that an operation cannot continue without blocking for I/O.
        :CANT_WAIT, 554,
        # MessageId: ERROR_CANT_TERMINATE_SELF
        # MessageText:
        # Indicates that a thread attempted to terminate itself by default (called NtTerminateThread with NULL) and it
        # was the last thread in the current process.
        :CANT_TERMINATE_SELF, 555,
        # MessageId: ERROR_UNEXPECTED_MM_CREATE_ERR
        # MessageText:
        # If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the
        # following errors which is guaranteed to be in the filter.
        # In this case information is lost, however, the filter correctly handles the exception.
        :UNEXPECTED_MM_CREATE_ERR, 556,
        # MessageId: ERROR_UNEXPECTED_MM_MAP_ERROR
        # MessageText:
        # If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the
        # following errors which is guaranteed to be in the filter.
        # In this case information is lost, however, the filter correctly handles the exception.
        :UNEXPECTED_MM_MAP_ERROR, 557,
        # MessageId: ERROR_UNEXPECTED_MM_EXTEND_ERR
        # MessageText:
        # If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the
        # following errors which is guaranteed to be in the filter.
        # In this case information is lost, however, the filter correctly handles the exception.
        :UNEXPECTED_MM_EXTEND_ERR, 558,
        # MessageId: ERROR_BAD_FUNCTION_TABLE
        # MessageText:
        # A malformed function table was encountered during an unwind operation.
        :BAD_FUNCTION_TABLE, 559,
        # MessageId: ERROR_NO_GUID_TRANSLATION
        # MessageText:
        # Indicates that an attempt was made to assign protection to a file system file or directory and one of the SIDs
        # in the security descriptor could not be translated into a GUID that could be stored by the file system.
        # This causes the protection attempt to fail, which may cause a file creation attempt to fail.
        :NO_GUID_TRANSLATION, 560,
        # MessageId: ERROR_INVALID_LDT_SIZE
        # MessageText:
        # Indicates that an attempt was made to grow an LDT by setting its size, or that the size was not an even number
        # of selectors.
        :INVALID_LDT_SIZE, 561,
        # MessageId: ERROR_INVALID_LDT_OFFSET
        # MessageText:
        # Indicates that the starting value for the LDT information was not an integral multiple of the selector size.
        :INVALID_LDT_OFFSET, 563,
        # MessageId: ERROR_INVALID_LDT_DESCRIPTOR
        # MessageText:
        # Indicates that the user supplied an invalid descriptor when trying to set up Ldt descriptors.
        :INVALID_LDT_DESCRIPTOR, 564,
        # MessageId: ERROR_TOO_MANY_THREADS
        # MessageText:
        # Indicates a process has too many threads to perform the requested action. For example, assignment of a primary
        # token may only be performed when a process has zero or one threads.
        :TOO_MANY_THREADS, 565,
        # MessageId: ERROR_THREAD_NOT_IN_PROCESS
        # MessageText:
        # An attempt was made to operate on a thread within a specific process, but the thread specified is not in the
        # process specified.
        :THREAD_NOT_IN_PROCESS, 566,
        # MessageId: ERROR_PAGEFILE_QUOTA_EXCEEDED
        # MessageText:
        # Page file quota was exceeded.
        :PAGEFILE_QUOTA_EXCEEDED, 567,
        # MessageId: ERROR_LOGON_SERVER_CONFLICT
        # MessageText:
        # The Netlogon service cannot start because another Netlogon service running in the domain conflicts with the
        # specified role.
        :LOGON_SERVER_CONFLICT, 568,
        # MessageId: ERROR_SYNCHRONIZATION_REQUIRED
        # MessageText:
        # The SAM database on a Windows Server is significantly out of synchronization with the copy on the Domain
        # Controller. A complete synchronization is required.
        :SYNCHRONIZATION_REQUIRED, 569,
        # MessageId: ERROR_NET_OPEN_FAILED
        # MessageText:
        # The NtCreateFile API failed. This error should never be returned to an application, it is a place holder for
        # the Windows Lan Manager Redirector to use in its internal error mapping routines.
        :NET_OPEN_FAILED, 570,
        # MessageId: ERROR_IO_PRIVILEGE_FAILED
        # MessageText:
        # {Privilege Failed}
        # The I/O permissions for the process could not be changed.
        :IO_PRIVILEGE_FAILED, 571,
        # MessageId: ERROR_CONTROL_C_EXIT
        # MessageText:
        # {Application Exit by CTRL+C}
        # The application terminated as a result of a CTRL+C.
        :CONTROL_C_EXIT, 572,
        # winnt
        # MessageId: ERROR_MISSING_SYSTEMFILE
        # MessageText:
        # {Missing System File}
        # The required system file %hs is bad or missing.
        :MISSING_SYSTEMFILE, 573,
        # MessageId: ERROR_UNHANDLED_EXCEPTION
        # MessageText:
        # {Application Error}
        # The exception %s (0x%08lx) occurred in the application at location 0x%08lx.
        :UNHANDLED_EXCEPTION, 574,
        # MessageId: ERROR_APP_INIT_FAILURE
        # MessageText:
        # {Application Error}
        # The application was unable to start correctly (0x%lx). Click OK to close the application.
        :APP_INIT_FAILURE, 575,
        # MessageId: ERROR_PAGEFILE_CREATE_FAILED
        # MessageText:
        # {Unable to Create Paging File}
        # The creation of the paging file %hs failed (%lx). The requested size was %ld.
        :PAGEFILE_CREATE_FAILED, 576,
        # MessageId: ERROR_INVALID_IMAGE_HASH
        # MessageText:
        # Windows cannot verify the digital signature for this file. A recent hardware or software change might have
        # installed a file that is signed incorrectly or damaged, or that might be malicious software from an unknown
        # source.
        :INVALID_IMAGE_HASH, 577,
        # MessageId: ERROR_NO_PAGEFILE
        # MessageText:
        # {No Paging File Specified}
        # No paging file was specified in the system configuration.
        :NO_PAGEFILE, 578,
        # MessageId: ERROR_ILLEGAL_FLOAT_CONTEXT
        # MessageText:
        # {EXCEPTION}
        # A real-mode application issued a floating-point instruction and floating-point hardware is not present.
        :ILLEGAL_FLOAT_CONTEXT, 579,
        # MessageId: ERROR_NO_EVENT_PAIR
        # MessageText:
        # An event pair synchronization operation was performed using the thread specific client/server event pair
        # object, but no event pair object was associated with the thread.
        :NO_EVENT_PAIR, 580,
        # MessageId: ERROR_DOMAIN_CTRLR_CONFIG_ERROR
        # MessageText:
        # A Windows Server has an incorrect configuration.
        :DOMAIN_CTRLR_CONFIG_ERROR, 581,
        # MessageId: ERROR_ILLEGAL_CHARACTER
        # MessageText:
        # An illegal character was encountered. For a multi-byte character set this includes a lead byte without a
        # succeeding trail byte. For the Unicode character set this includes the characters 0xFFFF and 0xFFFE.
        :ILLEGAL_CHARACTER, 582,
        # MessageId: ERROR_UNDEFINED_CHARACTER
        # MessageText:
        # The Unicode character is not defined in the Unicode character set installed on the system.
        :UNDEFINED_CHARACTER, 583,
        # MessageId: ERROR_FLOPPY_VOLUME
        # MessageText:
        # The paging file cannot be created on a floppy diskette.
        :FLOPPY_VOLUME, 584,
        # MessageId: ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT
        # MessageText:
        # The system BIOS failed to connect a system interrupt to the device or bus for which the device is connected.
        :BIOS_FAILED_TO_CONNECT_INTERRUPT, 585,
        # MessageId: ERROR_BACKUP_CONTROLLER
        # MessageText:
        # This operation is only allowed for the Primary Domain Controller of the domain.
        :BACKUP_CONTROLLER, 586,
        # MessageId: ERROR_MUTANT_LIMIT_EXCEEDED
        # MessageText:
        # An attempt was made to acquire a mutant such that its maximum count would have been exceeded.
        :MUTANT_LIMIT_EXCEEDED, 587,
        # MessageId: ERROR_FS_DRIVER_REQUIRED
        # MessageText:
        # A volume has been accessed for which a file system driver is required that has not yet been loaded.
        :FS_DRIVER_REQUIRED, 588,
        # MessageId: ERROR_CANNOT_LOAD_REGISTRY_FILE
        # MessageText:
        # {Registry File Failure}
        # The registry cannot load the hive (file):
        # %hs
        # or its log or alternate.
        # It is corrupt, absent, or not writable.
        :CANNOT_LOAD_REGISTRY_FILE, 589,
        # MessageId: ERROR_DEBUG_ATTACH_FAILED
        # MessageText:
        # {Unexpected Failure in DebugActiveProcess}
        # An unexpected failure occurred while processing a DebugActiveProcess API request. You may choose OK to
        # terminate the process, or Cancel to ignore the error.
        :DEBUG_ATTACH_FAILED, 590,
        # MessageId: ERROR_SYSTEM_PROCESS_TERMINATED
        # MessageText:
        # {Fatal System Error}
        # The %hs system process terminated unexpectedly with a status of 0x%08x (0x%08x 0x%08x).
        # The system has been shut down.
        :SYSTEM_PROCESS_TERMINATED, 591,
        # MessageId: ERROR_DATA_NOT_ACCEPTED
        # MessageText:
        # {Data Not Accepted}
        # The TDI client could not handle the data received during an indication.
        :DATA_NOT_ACCEPTED, 592,
        # MessageId: ERROR_VDM_HARD_ERROR
        # MessageText:
        # NTVDM encountered a hard error.
        :VDM_HARD_ERROR, 593,
        # MessageId: ERROR_DRIVER_CANCEL_TIMEOUT
        # MessageText:
        # {Cancel Timeout}
        # The driver %hs failed to complete a cancelled I/O request in the allotted time.
        :DRIVER_CANCEL_TIMEOUT, 594,
        # MessageId: ERROR_REPLY_MESSAGE_MISMATCH
        # MessageText:
        # {Reply Message Mismatch}
        # An attempt was made to reply to an LPC message, but the thread specified by the client ID in the message was
        # not waiting on that message.
        :REPLY_MESSAGE_MISMATCH, 595,
        # MessageId: ERROR_LOST_WRITEBEHIND_DATA
        # MessageText:
        # {Delayed Write Failed}
        # Windows was unable to save all the data for the file %hs. The data has been lost.
        # This error may be caused by a failure of your computer hardware or network connection. Please try to save this
        # file elsewhere.
        :LOST_WRITEBEHIND_DATA, 596,
        # MessageId: ERROR_CLIENT_SERVER_PARAMETERS_INVALID
        # MessageText:
        # The parameter(s) passed to the server in the client/server shared memory window were invalid. Too much data
        # may have been put in the shared memory window.
        :CLIENT_SERVER_PARAMETERS_INVALID, 597,
        # MessageId: ERROR_NOT_TINY_STREAM
        # MessageText:
        # The stream is not a tiny stream.
        :NOT_TINY_STREAM, 598,
        # MessageId: ERROR_STACK_OVERFLOW_READ
        # MessageText:
        # The request must be handled by the stack overflow code.
        :STACK_OVERFLOW_READ, 599,
        # MessageId: ERROR_CONVERT_TO_LARGE
        # MessageText:
        # Internal OFS status codes indicating how an allocation operation is handled. Either it is retried after the
        # containing onode is moved or the extent stream is converted to a large stream.
        :CONVERT_TO_LARGE, 600,
        # MessageId: ERROR_FOUND_OUT_OF_SCOPE
        # MessageText:
        # The attempt to find the object found an object matching by ID on the volume but it is out of the scope of the
        # handle used for the operation.
        :FOUND_OUT_OF_SCOPE, 601,
        # MessageId: ERROR_ALLOCATE_BUCKET
        # MessageText:
        # The bucket array must be grown. Retry transaction after doing so.
        :ALLOCATE_BUCKET, 602,
        # MessageId: ERROR_MARSHALL_OVERFLOW
        # MessageText:
        # The user/kernel marshalling buffer has overflowed.
        :MARSHALL_OVERFLOW, 603,
        # MessageId: ERROR_INVALID_VARIANT
        # MessageText:
        # The supplied variant structure contains invalid data.
        :INVALID_VARIANT, 604,
        # MessageId: ERROR_BAD_COMPRESSION_BUFFER
        # MessageText:
        # The specified buffer contains ill-formed data.
        :BAD_COMPRESSION_BUFFER, 605,
        # MessageId: ERROR_AUDIT_FAILED
        # MessageText:
        # {Audit Failed}
        # An attempt to generate a security audit failed.
        :AUDIT_FAILED, 606,
        # MessageId: ERROR_TIMER_RESOLUTION_NOT_SET
        # MessageText:
        # The timer resolution was not previously set by the current process.
        :TIMER_RESOLUTION_NOT_SET, 607,
        # MessageId: ERROR_INSUFFICIENT_LOGON_INFO
        # MessageText:
        # There is insufficient account information to log you on.
        :INSUFFICIENT_LOGON_INFO, 608,
        # MessageId: ERROR_BAD_DLL_ENTRYPOINT
        # MessageText:
        # {Invalid DLL Entrypoint}
        # The dynamic link library %hs is not written correctly. The stack pointer has been left in an inconsistent
        # state.
        # The entrypoint should be declared as WINAPI or STDCALL. Select YES to fail the DLL load. Select NO to continue
        # execution. Selecting NO may cause the application to operate incorrectly.
        :BAD_DLL_ENTRYPOINT, 609,
        # MessageId: ERROR_BAD_SERVICE_ENTRYPOINT
        # MessageText:
        # {Invalid Service Callback Entrypoint}
        # The %hs service is not written correctly. The stack pointer has been left in an inconsistent state.
        # The callback entrypoint should be declared as WINAPI or STDCALL. Selecting OK will cause the service to
        # continue operation. However, the service process may operate incorrectly.
        :BAD_SERVICE_ENTRYPOINT, 610,
        # MessageId: ERROR_IP_ADDRESS_CONFLICT1
        # MessageText:
        # There is an IP address conflict with another system on the network
        :IP_ADDRESS_CONFLICT1, 611,
        # MessageId: ERROR_IP_ADDRESS_CONFLICT2
        # MessageText:
        # There is an IP address conflict with another system on the network
        :IP_ADDRESS_CONFLICT2, 612,
        # MessageId: ERROR_REGISTRY_QUOTA_LIMIT
        # MessageText:
        # {Low On Registry Space}
        # The system has reached the maximum size allowed for the system part of the registry. Additional storage
        # requests will be ignored.
        :REGISTRY_QUOTA_LIMIT, 613,
        # MessageId: ERROR_NO_CALLBACK_ACTIVE
        # MessageText:
        # A callback return system service cannot be executed when no callback is active.
        :NO_CALLBACK_ACTIVE, 614,
        # MessageId: ERROR_PWD_TOO_SHORT
        # MessageText:
        # The password provided is too short to meet the policy of your user account.
        # Please choose a longer password.
        :PWD_TOO_SHORT, 615,
        # MessageId: ERROR_PWD_TOO_RECENT
        # MessageText:
        # The policy of your user account does not allow you to change passwords too frequently.
        # This is done to prevent users from changing back to a familiar, but potentially discovered, password.
        # If you feel your password has been compromised then please contact your administrator immediately to have a
        # new one assigned.
        :PWD_TOO_RECENT, 616,
        # MessageId: ERROR_PWD_HISTORY_CONFLICT
        # MessageText:
        # You have attempted to change your password to one that you have used in the past.
        # The policy of your user account does not allow this. Please select a password that you have not previously
        # used.
        :PWD_HISTORY_CONFLICT, 617,
        # MessageId: ERROR_UNSUPPORTED_COMPRESSION
        # MessageText:
        # The specified compression format is unsupported.
        :UNSUPPORTED_COMPRESSION, 618,
        # MessageId: ERROR_INVALID_HW_PROFILE
        # MessageText:
        # The specified hardware profile configuration is invalid.
        :INVALID_HW_PROFILE, 619,
        # MessageId: ERROR_INVALID_PLUGPLAY_DEVICE_PATH
        # MessageText:
        # The specified Plug and Play registry device path is invalid.
        :INVALID_PLUGPLAY_DEVICE_PATH, 620,
        # MessageId: ERROR_QUOTA_LIST_INCONSISTENT
        # MessageText:
        # The specified quota list is internally inconsistent with its descriptor.
        :QUOTA_LIST_INCONSISTENT, 621,
        # MessageId: ERROR_EVALUATION_EXPIRATION
        # MessageText:
        # {Windows Evaluation Notification}
        # The evaluation period for this installation of Windows has expired. This system will shutdown in 1 hour. To
        # restore access to this installation of Windows, please upgrade this installation using a licensed distribution
        # of this product.
        :EVALUATION_EXPIRATION, 622,
        # MessageId: ERROR_ILLEGAL_DLL_RELOCATION
        # MessageText:
        # {Illegal System DLL Relocation}
        # The system DLL %hs was relocated in memory. The application will not run properly.
        # The relocation occurred because the DLL %hs occupied an address range reserved for Windows system DLLs. The
        # vendor supplying the DLL should be contacted for a new DLL.
        :ILLEGAL_DLL_RELOCATION, 623,
        # MessageId: ERROR_DLL_INIT_FAILED_LOGOFF
        # MessageText:
        # {DLL Initialization Failed}
        # The application failed to initialize because the window station is shutting down.
        :DLL_INIT_FAILED_LOGOFF, 624,
        # MessageId: ERROR_VALIDATE_CONTINUE
        # MessageText:
        # The validation process needs to continue on to the next step.
        :VALIDATE_CONTINUE, 625,
        # MessageId: ERROR_NO_MORE_MATCHES
        # MessageText:
        # There are no more matches for the current index enumeration.
        :NO_MORE_MATCHES, 626,
        # MessageId: ERROR_RANGE_LIST_CONFLICT
        # MessageText:
        # The range could not be added to the range list because of a conflict.
        :RANGE_LIST_CONFLICT, 627,
        # MessageId: ERROR_SERVER_SID_MISMATCH
        # MessageText:
        # The server process is running under a SID different than that required by client.
        :SERVER_SID_MISMATCH, 628,
        # MessageId: ERROR_CANT_ENABLE_DENY_ONLY
        # MessageText:
        # A group marked use for deny only cannot be enabled.
        :CANT_ENABLE_DENY_ONLY, 629,
        # MessageId: ERROR_FLOAT_MULTIPLE_FAULTS
        # MessageText:
        # {EXCEPTION}
        # Multiple floating point faults.
        :FLOAT_MULTIPLE_FAULTS, 630,    # winnt# MessageId: ERROR_FLOAT_MULTIPLE_TRAPS
        # MessageText:
        # {EXCEPTION}
        # Multiple floating point traps.
        :FLOAT_MULTIPLE_TRAPS, 631,    # winnt# MessageId: ERROR_NOINTERFACE
        # MessageText:
        # The requested interface is not supported.
        :NOINTERFACE, 632,
        # MessageId: ERROR_DRIVER_FAILED_SLEEP
        # MessageText:
        # {System Standby Failed}
        # The driver %hs does not support standby mode. Updating this driver may allow the system to go to standby mode.
        :DRIVER_FAILED_SLEEP, 633,
        # MessageId: ERROR_CORRUPT_SYSTEM_FILE
        # MessageText:
        # The system file %1 has become corrupt and has been replaced.
        :CORRUPT_SYSTEM_FILE, 634,
        # MessageId: ERROR_COMMITMENT_MINIMUM
        # MessageText:
        # {Virtual Memory Minimum Too Low}
        # Your system is low on virtual memory. Windows is increasing the size of your virtual memory paging file.
        # During this process, memory requests for some applications may be denied. For more information, see Help.
        :COMMITMENT_MINIMUM, 635,
        # MessageId: ERROR_PNP_RESTART_ENUMERATION
        # MessageText:
        # A device was removed so enumeration must be restarted.
        :PNP_RESTART_ENUMERATION, 636,
        # MessageId: ERROR_SYSTEM_IMAGE_BAD_SIGNATURE
        # MessageText:
        # {Fatal System Error}
        # The system image %s is not properly signed.
        # The file has been replaced with the signed file.
        # The system has been shut down.
        :SYSTEM_IMAGE_BAD_SIGNATURE, 637,
        # MessageId: ERROR_PNP_REBOOT_REQUIRED
        # MessageText:
        # Device will not start without a reboot.
        :PNP_REBOOT_REQUIRED, 638,
        # MessageId: ERROR_INSUFFICIENT_POWER
        # MessageText:
        # There is not enough power to complete the requested operation.
        :INSUFFICIENT_POWER, 639,
        # MessageId: ERROR_MULTIPLE_FAULT_VIOLATION
        # MessageText:
        #  ERROR_MULTIPLE_FAULT_VIOLATION
        :MULTIPLE_FAULT_VIOLATION, 640,
        # MessageId: ERROR_SYSTEM_SHUTDOWN
        # MessageText:
        # The system is in the process of shutting down.
        :SYSTEM_SHUTDOWN, 641,
        # MessageId: ERROR_PORT_NOT_SET
        # MessageText:
        # An attempt to remove a processes DebugPort was made, but a port was not already associated with the process.
        :PORT_NOT_SET, 642,
        # MessageId: ERROR_DS_VERSION_CHECK_FAILURE
        # MessageText:
        # This version of Windows is not compatible with the behavior version of directory forest, domain or domain
        # controller.
        :DS_VERSION_CHECK_FAILURE, 643,
        # MessageId: ERROR_RANGE_NOT_FOUND
        # MessageText:
        # The specified range could not be found in the range list.
        :RANGE_NOT_FOUND, 644,
        # MessageId: ERROR_NOT_SAFE_MODE_DRIVER
        # MessageText:
        # The driver was not loaded because the system is booting into safe mode.
        :NOT_SAFE_MODE_DRIVER, 646,
        # MessageId: ERROR_FAILED_DRIVER_ENTRY
        # MessageText:
        # The driver was not loaded because it failed its initialization call.
        :FAILED_DRIVER_ENTRY, 647,
        # MessageId: ERROR_DEVICE_ENUMERATION_ERROR
        # MessageText:
        # The "%hs" encountered an error while applying power or reading the device configuration.
        # This may be caused by a failure of your hardware or by a poor connection.
        :DEVICE_ENUMERATION_ERROR, 648,
        # MessageId: ERROR_MOUNT_POINT_NOT_RESOLVED
        # MessageText:
        # The create operation failed because the name contained at least one mount point which resolves to a volume to
        # which the specified device object is not attached.
        :MOUNT_POINT_NOT_RESOLVED, 649,
        # MessageId: ERROR_INVALID_DEVICE_OBJECT_PARAMETER
        # MessageText:
        # The device object parameter is either not a valid device object or is not attached to the volume specified by
        # the file name.
        :INVALID_DEVICE_OBJECT_PARAMETER, 650,
        # MessageId: ERROR_MCA_OCCURED
        # MessageText:
        # A Machine Check Error has occurred. Please check the system eventlog for additional information.
        :MCA_OCCURED, 651,
        # MessageId: ERROR_DRIVER_DATABASE_ERROR
        # MessageText:
        # There was error [%2] processing the driver database.
        :DRIVER_DATABASE_ERROR, 652,
        # MessageId: ERROR_SYSTEM_HIVE_TOO_LARGE
        # MessageText:
        # System hive size has exceeded its limit.
        :SYSTEM_HIVE_TOO_LARGE, 653,
        # MessageId: ERROR_DRIVER_FAILED_PRIOR_UNLOAD
        # MessageText:
        # The driver could not be loaded because a previous version of the driver is still in memory.
        :DRIVER_FAILED_PRIOR_UNLOAD, 654,
        # MessageId: ERROR_VOLSNAP_PREPARE_HIBERNATE
        # MessageText:
        # {Volume Shadow Copy Service}
        # Please wait while the Volume Shadow Copy Service prepares volume %hs for hibernation.
        :VOLSNAP_PREPARE_HIBERNATE, 655,
        # MessageId: ERROR_HIBERNATION_FAILURE
        # MessageText:
        # The system has failed to hibernate (The error code is %hs). Hibernation will be disabled until the system is
        # restarted.
        :HIBERNATION_FAILURE, 656,
        # MessageId: ERROR_PWD_TOO_LONG
        # MessageText:
        # The password provided is too long to meet the policy of your user account.
        # Please choose a shorter password.
        :PWD_TOO_LONG, 657,
        # MessageId: ERROR_FILE_SYSTEM_LIMITATION
        # MessageText:
        # The requested operation could not be completed due to a file system limitation
        :FILE_SYSTEM_LIMITATION, 665,
        # MessageId: ERROR_ASSERTION_FAILURE
        # MessageText:
        # An assertion failure has occurred.
        :ASSERTION_FAILURE, 668,
        # MessageId: ERROR_ACPI_ERROR
        # MessageText:
        # An error occurred in the ACPI subsystem.
        :ACPI_ERROR, 669,
        # MessageId: ERROR_WOW_ASSERTION
        # MessageText:
        # WOW Assertion Error.
        :WOW_ASSERTION, 670,
        # MessageId: ERROR_PNP_BAD_MPS_TABLE
        # MessageText:
        # A device is missing in the system BIOS MPS table. This device will not be used.
        # Please contact your system vendor for system BIOS update.
        :PNP_BAD_MPS_TABLE, 671,
        # MessageId: ERROR_PNP_TRANSLATION_FAILED
        # MessageText:
        # A translator failed to translate resources.
        :PNP_TRANSLATION_FAILED, 672,
        # MessageId: ERROR_PNP_IRQ_TRANSLATION_FAILED
        # MessageText:
        # A IRQ translator failed to translate resources.
        :PNP_IRQ_TRANSLATION_FAILED, 673,
        # MessageId: ERROR_PNP_INVALID_ID
        # MessageText:
        # Driver %2 returned invalid ID for a child device (%3).
        :PNP_INVALID_ID, 674,
        # MessageId: ERROR_WAKE_SYSTEM_DEBUGGER
        # MessageText:
        # {Kernel Debugger Awakened}
        # the system debugger was awakened by an interrupt.
        :WAKE_SYSTEM_DEBUGGER, 675,
        # MessageId: ERROR_HANDLES_CLOSED
        # MessageText:
        # {Handles Closed}
        # Handles to objects have been automatically closed as a result of the requested operation.
        :HANDLES_CLOSED, 676,
        # MessageId: ERROR_EXTRANEOUS_INFORMATION
        # MessageText:
        # {Too Much Information}
        # The specified access control list (ACL) contained more information than was expected.
        :EXTRANEOUS_INFORMATION, 677,
        # MessageId: ERROR_RXACT_COMMIT_NECESSARY
        # MessageText:
        # This warning level status indicates that the transaction state already exists for the registry sub-tree, but
        # that a transaction commit was previously aborted.
        # The commit has NOT been completed, but has not been rolled back either (so it may still be committed if
        # desired).
        :RXACT_COMMIT_NECESSARY, 678,
        # MessageId: ERROR_MEDIA_CHECK
        # MessageText:
        # {Media Changed}
        # The media may have changed.
        :MEDIA_CHECK, 679,
        # MessageId: ERROR_GUID_SUBSTITUTION_MADE
        # MessageText:
        # {GUID Substitution}
        # During the translation of a global identifier (GUID) to a Windows security ID (SID), no
        # administratively-defined GUID prefix was found.
        # A substitute prefix was used, which will not compromise system security. However, this may provide a more
        # restrictive access than intended.
        :GUID_SUBSTITUTION_MADE, 680,
        # MessageId: ERROR_STOPPED_ON_SYMLINK
        # MessageText:
        # The create operation stopped after reaching a symbolic link
        :STOPPED_ON_SYMLINK, 681,
        # MessageId: ERROR_LONGJUMP
        # MessageText:
        # A long jump has been executed.
        :LONGJUMP, 682,
        # MessageId: ERROR_PLUGPLAY_QUERY_VETOED
        # MessageText:
        # The Plug and Play query operation was not successful.
        :PLUGPLAY_QUERY_VETOED, 683,
        # MessageId: ERROR_UNWIND_CONSOLIDATE
        # MessageText:
        # A frame consolidation has been executed.
        :UNWIND_CONSOLIDATE, 684,
        # MessageId: ERROR_REGISTRY_HIVE_RECOVERED
        # MessageText:
        # {Registry Hive Recovered}
        # Registry hive (file):
        # %hs
        # was corrupted and it has been recovered. Some data might have been lost.
        :REGISTRY_HIVE_RECOVERED, 685,
        # MessageId: ERROR_DLL_MIGHT_BE_INSECURE
        # MessageText:
        # The application is attempting to run executable code from the module %hs. This may be insecure.
        # An alternative, %hs, is available. Should the application use the secure module %hs?
        :DLL_MIGHT_BE_INSECURE, 686,
        # MessageId: ERROR_DLL_MIGHT_BE_INCOMPATIBLE
        # MessageText:
        # The application is loading executable code from the module %hs. This is secure, but may be incompatible with
        # previous releases of the operating system. An alternative, %hs, is available. Should the application use the
        # secure module %hs?
        :DLL_MIGHT_BE_INCOMPATIBLE, 687,
        # MessageId: ERROR_DBG_EXCEPTION_NOT_HANDLED
        # MessageText:
        # Debugger did not handle the exception.
        :DBG_EXCEPTION_NOT_HANDLED, 688,
        # winnt
        # # MessageId: ERROR_DBG_REPLY_LATER
        # MessageText:
        # Debugger will reply later.
        :DBG_REPLY_LATER, 689,
        # MessageId: ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE
        # MessageText:
        # Debugger cannot provide handle.
        :DBG_UNABLE_TO_PROVIDE_HANDLE, 690,
        # MessageId: ERROR_DBG_TERMINATE_THREAD
        # MessageText:
        # Debugger terminated thread.
        :DBG_TERMINATE_THREAD, 691,
        # winnt
        # # MessageId: ERROR_DBG_TERMINATE_PROCESS
        # MessageText:
        # Debugger terminated process.
        :DBG_TERMINATE_PROCESS, 692,
        # winnt
        # # MessageId: ERROR_DBG_CONTROL_C
        # MessageText:
        # Debugger got control C.
        :DBG_CONTROL_C, 693,
        # winnt
        # # MessageId: ERROR_DBG_PRINTEXCEPTION_C
        # MessageText:
        # Debugger printed exception on control C.
        :DBG_PRINTEXCEPTION_C, 694,
        # MessageId: ERROR_DBG_RIPEXCEPTION
        # MessageText:
        # Debugger received RIP exception.
        :DBG_RIPEXCEPTION, 695,
        # MessageId: ERROR_DBG_CONTROL_BREAK
        # MessageText:
        # Debugger received control break.
        :DBG_CONTROL_BREAK, 696,
        # winnt
        # MessageId: ERROR_DBG_COMMAND_EXCEPTION
        # MessageText:
        # Debugger command communication exception.
        :DBG_COMMAND_EXCEPTION, 697,
        # winnt
        # MessageId: ERROR_OBJECT_NAME_EXISTS
        # MessageText:
        # {Object Exists}
        # An attempt was made to create an object and the object name already existed.
        :OBJECT_NAME_EXISTS, 698,
        # MessageId: ERROR_THREAD_WAS_SUSPENDED
        # MessageText:
        # {Thread Suspended}
        # A thread termination occurred while the thread was suspended. The thread was resumed, and termination
        # proceeded.
        :THREAD_WAS_SUSPENDED, 699,
        # MessageId: ERROR_IMAGE_NOT_AT_BASE
        # MessageText:
        # {Image Relocated}
        # An image file could not be mapped at the address specified in the image file. Local fixups must be performed
        # on this image.
        :IMAGE_NOT_AT_BASE, 700,
        # MessageId: ERROR_RXACT_STATE_CREATED
        # MessageText:
        # This informational level status indicates that a specified registry sub-tree transaction state did not yet
        # exist and had to be created.
        :RXACT_STATE_CREATED, 701,
        # MessageId: ERROR_SEGMENT_NOTIFICATION
        # MessageText:
        # {Segment Load}
        # A virtual DOS machine (VDM) is loading, unloading, or moving an MS-DOS or Win16 program segment image.
        # An exception is raised so a debugger can load, unload or track symbols and breakpoints within these 16-bit
        # segments.
        :SEGMENT_NOTIFICATION, 702,
        # winnt
        # MessageId: ERROR_BAD_CURRENT_DIRECTORY
        # MessageText:
        # {Invalid Current Directory}
        # The process cannot switch to the startup current directory %hs.
        # Select OK to set current directory to %hs, or select CANCEL to exit.
        :BAD_CURRENT_DIRECTORY, 703,
        # MessageId: ERROR_FT_READ_RECOVERY_FROM_BACKUP
        # MessageText:
        # {Redundant Read}
        # To satisfy a read request, the NT fault-tolerant file system successfully read the requested data from a
        # redundant copy.
        # This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was
        # unable to reassign the failing area of the device.
        :FT_READ_RECOVERY_FROM_BACKUP, 704,
        # MessageId: ERROR_FT_WRITE_RECOVERY
        # MessageText:
        # {Redundant Write}
        # To satisfy a write request, the NT fault-tolerant file system successfully wrote a redundant copy of the
        # information.
        # This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was
        # not able to reassign the failing area of the device.
        :FT_WRITE_RECOVERY, 705,
        # MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH
        # MessageText:
        # {Machine Type Mismatch}
        # The image file %hs is valid, but is for a machine type other than the current machine. Select OK to continue,
        # or CANCEL to fail the DLL load.
        :IMAGE_MACHINE_TYPE_MISMATCH, 706,
        # MessageId: ERROR_RECEIVE_PARTIAL
        # MessageText:
        # {Partial Data Received}
        # The network transport returned partial data to its client. The remaining data will be sent later.
        :RECEIVE_PARTIAL, 707,
        # MessageId: ERROR_RECEIVE_EXPEDITED
        # MessageText:
        # {Expedited Data Received}
        # The network transport returned data to its client that was marked as expedited by the remote system.
        :RECEIVE_EXPEDITED, 708,
        # MessageId: ERROR_RECEIVE_PARTIAL_EXPEDITED
        # MessageText:
        # {Partial Expedited Data Received}
        # The network transport returned partial data to its client and this data was marked as expedited by the remote
        # system. The remaining data will be sent later.
        :RECEIVE_PARTIAL_EXPEDITED, 709,
        # MessageId: ERROR_EVENT_DONE
        # MessageText:
        # {TDI Event Done}
        # The TDI indication has completed successfully.
        :EVENT_DONE, 710,
        # MessageId: ERROR_EVENT_PENDING
        # MessageText:
        # {TDI Event Pending}
        # The TDI indication has entered the pending state.
        :EVENT_PENDING, 711,
        # MessageId: ERROR_CHECKING_FILE_SYSTEM
        # MessageText:
        # Checking file system on %wZ
        :CHECKING_FILE_SYSTEM, 712,
        # MessageId: ERROR_FATAL_APP_EXIT
        # MessageText:
        # {Fatal Application Exit}
        # %hs
        :FATAL_APP_EXIT, 713,
        # MessageId: ERROR_PREDEFINED_HANDLE
        # MessageText:
        # The specified registry key is referenced by a predefined handle.
        :PREDEFINED_HANDLE, 714,
        # MessageId: ERROR_WAS_UNLOCKED
        # MessageText:
        # {Page Unlocked}
        # The page protection of a locked page was changed to 'No Access' and the page was unlocked from memory and from
        # the process.
        :WAS_UNLOCKED, 715,
        # MessageId: ERROR_SERVICE_NOTIFICATION
        # MessageText:
        # %hs
        :SERVICE_NOTIFICATION, 716,
        # MessageId: ERROR_WAS_LOCKED
        # MessageText:
        # {Page Locked}
        # One of the pages to lock was already locked.
        :WAS_LOCKED, 717,
        # MessageId: ERROR_LOG_HARD_ERROR
        # MessageText:
        # Application popup: %1 : %2
        :LOG_HARD_ERROR, 718,
        # MessageId: ERROR_ALREADY_WIN32
        # MessageText:
        #  ERROR_ALREADY_WIN32
        :ALREADY_WIN32, 719,
        # MessageId: ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE
        # MessageText:
        # {Machine Type Mismatch}
        # The image file %hs is valid, but is for a machine type other than the current machine.
        :IMAGE_MACHINE_TYPE_MISMATCH_EXE, 720,
        # MessageId: ERROR_NO_YIELD_PERFORMED
        # MessageText:
        # A yield execution was performed and no thread was available to run.
        :NO_YIELD_PERFORMED, 721,
        # MessageId: ERROR_TIMER_RESUME_IGNORED
        # MessageText:
        # The resumable flag to a timer API was ignored.
        :TIMER_RESUME_IGNORED, 722,
        # MessageId: ERROR_ARBITRATION_UNHANDLED
        # MessageText:
        # The arbiter has deferred arbitration of these resources to its parent
        :ARBITRATION_UNHANDLED, 723,
        # MessageId: ERROR_CARDBUS_NOT_SUPPORTED
        # MessageText:
        # The inserted CardBus device cannot be started because of a configuration error on "%hs".
        :CARDBUS_NOT_SUPPORTED, 724,
        # MessageId: ERROR_MP_PROCESSOR_MISMATCH
        # MessageText:
        # The CPUs in this multiprocessor system are not all the same revision level. To use all processors the
        # operating system restricts itself to the features of the least capable processor in the system. Should
        # problems occur with this system, contact the CPU manufacturer to see if this mix of processors is supported.
        :MP_PROCESSOR_MISMATCH, 725,
        # MessageId: ERROR_HIBERNATED
        # MessageText:
        # The system was put into hibernation.
        :HIBERNATED, 726,    # MessageId: ERROR_RESUME_HIBERNATION
        # MessageText:
        # The system was resumed from hibernation.
        :RESUME_HIBERNATION, 727,    # MessageId: ERROR_FIRMWARE_UPDATED
        # MessageText:
        # Windows has detected that the system firmware (BIOS) was updated [previous firmware date = %2, current
        # firmware date %3].
        :FIRMWARE_UPDATED, 728,
        # MessageId: ERROR_DRIVERS_LEAKING_LOCKED_PAGES
        # MessageText:
        # A device driver is leaking locked I/O pages causing system degradation. The system has automatically enabled
        # tracking code in order to try and catch the culprit.
        :DRIVERS_LEAKING_LOCKED_PAGES, 729,
        # MessageId: ERROR_WAKE_SYSTEM
        # MessageText:
        # The system has awoken
        :WAKE_SYSTEM, 730,
        # MessageId: ERROR_WAIT_1
        # MessageText:
        #  ERROR_WAIT_1
        :WAIT_1, 731,
        # MessageId: ERROR_WAIT_2
        # MessageText:
        #  ERROR_WAIT_2
        :WAIT_2, 732,
        # MessageId: ERROR_WAIT_3
        # MessageText:
        #  ERROR_WAIT_3
        :WAIT_3, 733,
        # MessageId: ERROR_WAIT_63
        # MessageText:
        #  ERROR_WAIT_63
        :WAIT_63, 734,
        # MessageId: ERROR_ABANDONED_WAIT_0
        # MessageText:
        #  ERROR_ABANDONED_WAIT_0
        :ABANDONED_WAIT_0, 735,
        # winnt
        # MessageId: ERROR_ABANDONED_WAIT_63
        # MessageText:
        #  ERROR_ABANDONED_WAIT_63
        :ABANDONED_WAIT_63, 736,
        # MessageId: ERROR_USER_APC
        # MessageText:
        #  ERROR_USER_APC
        :USER_APC, 737,
        # winnt
        # MessageId: ERROR_KERNEL_APC
        # MessageText:
        #  ERROR_KERNEL_APC
        :KERNEL_APC, 738,
        # MessageId: ERROR_ALERTED
        # MessageText:
        #  ERROR_ALERTED
        :ALERTED, 739,
        # MessageId: ERROR_ELEVATION_REQUIRED
        # MessageText:
        # The requested operation requires elevation.
        :ELEVATION_REQUIRED, 740,
        # MessageId: ERROR_REPARSE
        # MessageText:
        # A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
        :REPARSE, 741,
        # MessageId: ERROR_OPLOCK_BREAK_IN_PROGRESS
        # MessageText:
        # An open/create operation completed while an oplock break is underway.
        :OPLOCK_BREAK_IN_PROGRESS, 742,
        # MessageId: ERROR_VOLUME_MOUNTED
        # MessageText:
        # A new volume has been mounted by a file system.
        :VOLUME_MOUNTED, 743,
        # MessageId: ERROR_RXACT_COMMITTED
        # MessageText:
        # This success level status indicates that the transaction state already exists for the registry sub-tree, but
        # that a transaction commit was previously aborted.
        # The commit has now been completed.
        :RXACT_COMMITTED, 744,
        # MessageId: ERROR_NOTIFY_CLEANUP
        # MessageText:
        # This indicates that a notify change request has been completed due to closing the handle which made the notify
        # change request.
        :NOTIFY_CLEANUP, 745,
        # MessageId: ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED
        # MessageText:
        # {Connect Failure on Primary Transport}
        # An attempt was made to connect to the remote server %hs on the primary transport, but the connection failed.
        # The computer WAS able to connect on a secondary transport.
        :PRIMARY_TRANSPORT_CONNECT_FAILED, 746,
        # MessageId: ERROR_PAGE_FAULT_TRANSITION
        # MessageText:
        # Page fault was a transition fault.
        :PAGE_FAULT_TRANSITION, 747,
        # MessageId: ERROR_PAGE_FAULT_DEMAND_ZERO
        # MessageText:
        # Page fault was a demand zero fault.
        :PAGE_FAULT_DEMAND_ZERO, 748,
        # MessageId: ERROR_PAGE_FAULT_COPY_ON_WRITE
        # MessageText:
        # Page fault was a demand zero fault.
        :PAGE_FAULT_COPY_ON_WRITE, 749,
        # MessageId: ERROR_PAGE_FAULT_GUARD_PAGE
        # MessageText:
        # Page fault was a demand zero fault.
        :PAGE_FAULT_GUARD_PAGE, 750,
        # MessageId: ERROR_PAGE_FAULT_PAGING_FILE
        # MessageText:
        # Page fault was satisfied by reading from a secondary storage device.
        :PAGE_FAULT_PAGING_FILE, 751,
        # MessageId: ERROR_CACHE_PAGE_LOCKED
        # MessageText:
        # Cached page was locked during operation.
        :CACHE_PAGE_LOCKED, 752,
        # MessageId: ERROR_CRASH_DUMP
        # MessageText:
        # Crash dump exists in paging file.
        :CRASH_DUMP, 753,
        # MessageId: ERROR_BUFFER_ALL_ZEROS
        # MessageText:
        # Specified buffer contains all zeros.
        :BUFFER_ALL_ZEROS, 754,
        # MessageId: ERROR_REPARSE_OBJECT
        # MessageText:
        # A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
        :REPARSE_OBJECT, 755,
        # MessageId: ERROR_RESOURCE_REQUIREMENTS_CHANGED
        # MessageText:
        # The device has succeeded a query-stop and its resource requirements have changed.
        :RESOURCE_REQUIREMENTS_CHANGED, 756,
        # MessageId: ERROR_TRANSLATION_COMPLETE
        # MessageText:
        # The translator has translated these resources into the global space and no further translations should be
        # performed.
        :TRANSLATION_COMPLETE, 757,
        # MessageId: ERROR_NOTHING_TO_TERMINATE
        # MessageText:
        # A process being terminated has no threads to terminate.
        :NOTHING_TO_TERMINATE, 758,
        # MessageId: ERROR_PROCESS_NOT_IN_JOB
        # MessageText:
        # The specified process is not part of a job.
        :PROCESS_NOT_IN_JOB, 759,
        # MessageId: ERROR_PROCESS_IN_JOB
        # MessageText:
        # The specified process is part of a job.
        :PROCESS_IN_JOB, 760,
        # MessageId: ERROR_VOLSNAP_HIBERNATE_READY
        # MessageText:
        # {Volume Shadow Copy Service}
        # The system is now ready for hibernation.
        :VOLSNAP_HIBERNATE_READY, 761,
        # MessageId: ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY
        # MessageText:
        # A file system or file system filter driver has successfully completed an FsFilter operation.
        :FSFILTER_OP_COMPLETED_SUCCESSFULLY, 762,
        # MessageId: ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED
        # MessageText:
        # The specified interrupt vector was already connected.
        :INTERRUPT_VECTOR_ALREADY_CONNECTED, 763,
        # MessageId: ERROR_INTERRUPT_STILL_CONNECTED
        # MessageText:
        # The specified interrupt vector is still connected.
        :INTERRUPT_STILL_CONNECTED, 764,
        # MessageId: ERROR_WAIT_FOR_OPLOCK
        # MessageText:
        # An operation is blocked waiting for an oplock.
        :WAIT_FOR_OPLOCK, 765,
        # MessageId: ERROR_DBG_EXCEPTION_HANDLED
        # MessageText:
        # Debugger handled exception
        :DBG_EXCEPTION_HANDLED, 766,
        # winnt
        # MessageId: ERROR_DBG_CONTINUE
        # MessageText:
        # Debugger continued
        :DBG_CONTINUE, 767,
        # winnt
        # MessageId: ERROR_CALLBACK_POP_STACK
        # MessageText:
        # An exception occurred in a user mode callback and the kernel callback frame should be removed.
        :CALLBACK_POP_STACK, 768,
        # MessageId: ERROR_COMPRESSION_DISABLED
        # MessageText:
        # Compression is disabled for this volume.
        :COMPRESSION_DISABLED, 769,
        # MessageId: ERROR_CANTFETCHBACKWARDS
        # MessageText:
        # The data provider cannot fetch backwards through a result set.
        :CANTFETCHBACKWARDS, 770,
        # MessageId: ERROR_CANTSCROLLBACKWARDS
        # MessageText:
        # The data provider cannot scroll backwards through a result set.
        :CANTSCROLLBACKWARDS, 771,
        # MessageId: ERROR_ROWSNOTRELEASED
        # MessageText:
        # The data provider requires that previously fetched data is released before asking for more data.
        :ROWSNOTRELEASED, 772,
        # MessageId: ERROR_BAD_ACCESSOR_FLAGS
        # MessageText:
        # The data provider was not able to interpret the flags set for a column binding in an accessor.
        :BAD_ACCESSOR_FLAGS, 773,
        # MessageId: ERROR_ERRORS_ENCOUNTERED
        # MessageText:
        # One or more errors occurred while processing the request.
        :ERRORS_ENCOUNTERED, 774,
        # MessageId: ERROR_NOT_CAPABLE
        # MessageText:
        # The implementation is not capable of performing the request.
        :NOT_CAPABLE, 775,
        # MessageId: ERROR_REQUEST_OUT_OF_SEQUENCE
        # MessageText:
        # The client of a component requested an operation which is not valid given the state of the component instance.
        :REQUEST_OUT_OF_SEQUENCE, 776,
        # MessageId: ERROR_VERSION_PARSE_ERROR
        # MessageText:
        # A version number could not be parsed.
        :VERSION_PARSE_ERROR, 777,
        # MessageId: ERROR_BADSTARTPOSITION
        # MessageText:
        # The iterator's start position is invalid.
        :BADSTARTPOSITION, 778,
        # MessageId: ERROR_MEMORY_HARDWARE
        # MessageText:
        # The hardware has reported an uncorrectable memory error.
        :MEMORY_HARDWARE, 779,
        # MessageId: ERROR_DISK_REPAIR_DISABLED
        # MessageText:
        # The attempted operation required self healing to be enabled.
        :DISK_REPAIR_DISABLED, 780,
        # MessageId: ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE
        # MessageText:
        # The Desktop heap encountered an error while allocating session memory. There is more information in the system
        # event log.
        :INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE, 781,
        # MessageId: ERROR_SYSTEM_POWERSTATE_TRANSITION
        # MessageText:
        # The system power state is transitioning from %2 to %3.
        :SYSTEM_POWERSTATE_TRANSITION, 782,
        # MessageId: ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION
        # MessageText:
        # The system power state is transitioning from %2 to %3 but could enter %4.
        :SYSTEM_POWERSTATE_COMPLEX_TRANSITION, 783,
        # MessageId: ERROR_MCA_EXCEPTION
        # MessageText:
        # A thread is getting dispatched with MCA EXCEPTION because of MCA.
        :MCA_EXCEPTION, 784,
        # MessageId: ERROR_ACCESS_AUDIT_BY_POLICY
        # MessageText:
        # Access to %1 is monitored by policy rule %2.
        :ACCESS_AUDIT_BY_POLICY, 785,
        # MessageId: ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY
        # MessageText:
        # Access to %1 has been restricted by your Administrator by policy rule %2.
        :ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY, 786,
        # MessageId: ERROR_ABANDON_HIBERFILE
        # MessageText:
        # A valid hibernation file has been invalidated and should be abandoned.
        :ABANDON_HIBERFILE, 787,
        # MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED
        # MessageText:
        # {Delayed Write Failed}
        # Windows was unable to save all the data for the file %hs; the data has been lost.
        # This error may be caused by network connectivity issues. Please try to save this file elsewhere.
        :LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED, 788,
        # MessageId: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR
        # MessageText:
        # {Delayed Write Failed}
        # Windows was unable to save all the data for the file %hs; the data has been lost.
        # This error was returned by the server on which the file exists. Please try to save this file elsewhere.
        :LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR, 789,
        # MessageId: ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR
        # MessageText:
        # {Delayed Write Failed}
        # Windows was unable to save all the data for the file %hs; the data has been lost.
        # This error may be caused if the device has been removed or the media is write-protected.
        :LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR, 790,
        # MessageId: ERROR_BAD_MCFG_TABLE
        # MessageText:
        # The resources required for this device conflict with the MCFG table.
        :BAD_MCFG_TABLE, 791,
        # MessageId: ERROR_DISK_REPAIR_REDIRECTED
        # MessageText:
        # The volume repair could not be performed while it is online.
        # Please schedule to take the volume offline so that it can be repaired.
        :DISK_REPAIR_REDIRECTED, 792,
        # MessageId: ERROR_DISK_REPAIR_UNSUCCESSFUL
        # MessageText:
        # The volume repair was not successful.
        :DISK_REPAIR_UNSUCCESSFUL, 793,
        # MessageId: ERROR_CORRUPT_LOG_OVERFULL
        # MessageText:
        # One of the volume corruption logs is full. Further corruptions that may be detected won't be logged.
        :CORRUPT_LOG_OVERFULL, 794,
        # MessageId: ERROR_CORRUPT_LOG_CORRUPTED
        # MessageText:
        # One of the volume corruption logs is internally corrupted and needs to be recreated. The volume may contain
        # undetected corruptions and must be scanned.
        :CORRUPT_LOG_CORRUPTED, 795,
        # MessageId: ERROR_CORRUPT_LOG_UNAVAILABLE
        # MessageText:
        # One of the volume corruption logs is unavailable for being operated on.
        :CORRUPT_LOG_UNAVAILABLE, 796,
        # MessageId: ERROR_CORRUPT_LOG_DELETED_FULL
        # MessageText:
        # One of the volume corruption logs was deleted while still having corruption records in them. The volume
        # contains detected corruptions and must be scanned.
        :CORRUPT_LOG_DELETED_FULL, 797,
        # MessageId: ERROR_CORRUPT_LOG_CLEARED
        # MessageText:
        # One of the volume corruption logs was cleared by chkdsk and no longer contains real corruptions.
        :CORRUPT_LOG_CLEARED, 798,
        # MessageId: ERROR_ORPHAN_NAME_EXHAUSTED
        # MessageText:
        # Orphaned files exist on the volume but could not be recovered because no more new names could be created in
        # the recovery directory. Files must be moved from the recovery directory.
        :ORPHAN_NAME_EXHAUSTED, 799,
        # MessageId: ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE
        # MessageText:
        # The oplock that was associated with this handle is now associated with a different handle.
        :OPLOCK_SWITCHED_TO_NEW_HANDLE, 800,
        # MessageId: ERROR_CANNOT_GRANT_REQUESTED_OPLOCK
        # MessageText:
        # An oplock of the requested level cannot be granted.  An oplock of a lower level may be available.
        :CANNOT_GRANT_REQUESTED_OPLOCK, 801,
        # MessageId: ERROR_CANNOT_BREAK_OPLOCK
        # MessageText:
        # The operation did not complete successfully because it would cause an oplock to be broken. The caller has
        # requested that existing oplocks not be broken.
        :CANNOT_BREAK_OPLOCK, 802,
        # MessageId: ERROR_OPLOCK_HANDLE_CLOSED
        # MessageText:
        # The handle with which this oplock was associated has been closed.  The oplock is now broken.
        :OPLOCK_HANDLE_CLOSED, 803,
        # MessageId: ERROR_NO_ACE_CONDITION
        # MessageText:
        # The specified access control entry (ACE) does not contain a condition.
        :NO_ACE_CONDITION, 804,
        # MessageId: ERROR_INVALID_ACE_CONDITION
        # MessageText:
        # The specified access control entry (ACE) contains an invalid condition.
        :INVALID_ACE_CONDITION, 805,
        # MessageId: ERROR_FILE_HANDLE_REVOKED
        # MessageText:
        # Access to the specified file handle has been revoked.
        :FILE_HANDLE_REVOKED, 806,
        # MessageId: ERROR_IMAGE_AT_DIFFERENT_BASE
        # MessageText:
        # {Image Relocated}
        # An image file was mapped at a different address from the one specified in the image file but fixups will still
        # be automatically performed on the image.
        :IMAGE_AT_DIFFERENT_BASE, 807,
        # MessageId: ERROR_ENCRYPTED_IO_NOT_POSSIBLE
        # MessageText:
        # The read or write operation to an encrypted file could not be completed because the file has not been opened
        # for data access.
        :ENCRYPTED_IO_NOT_POSSIBLE, 808,
        # MessageId: ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS
        # MessageText:
        # File metadata optimization is already in progress.
        :FILE_METADATA_OPTIMIZATION_IN_PROGRESS, 809,
        # MessageId: ERROR_QUOTA_ACTIVITY
        # MessageText:
        # The requested operation failed due to quota operation is still in progress.
        :QUOTA_ACTIVITY, 810,
        # MessageId: ERROR_HANDLE_REVOKED
        # MessageText:
        # Access to the specified handle has been revoked.
        :HANDLE_REVOKED, 811,
        # MessageId: ERROR_CALLBACK_INVOKE_INLINE
        # MessageText:
        # The callback function must be invoked inline.
        :CALLBACK_INVOKE_INLINE, 812,
        # MessageId: ERROR_CPU_SET_INVALID
        # MessageText:
        # The specified CPU Set IDs are invalid.
        :CPU_SET_INVALID, 813,
        # **** Available SYSTEM error codes ****
        # MessageId: ERROR_EA_ACCESS_DENIED
        # MessageText:
        # Access to the extended attribute was denied.
        :EA_ACCESS_DENIED, 994,
        # MessageId: ERROR_OPERATION_ABORTED
        # MessageText:
        # The I/O operation has been aborted because of either a thread exit or an application request.
        :OPERATION_ABORTED, 995,
        # MessageId: ERROR_IO_INCOMPLETE
        # MessageText:
        # Overlapped I/O event is not in a signaled state.
        :IO_INCOMPLETE, 996,
        # MessageId: ERROR_IO_PENDING
        # MessageText:
        # Overlapped I/O operation is in progress.
        :IO_PENDING, 997,    # dderror# MessageId: ERROR_NOACCESS
        # MessageText:
        # Invalid access to memory location.
        :NOACCESS, 998,
        # MessageId: ERROR_SWAPERROR
        # MessageText:
        # Error performing inpage operation.
        :SWAPERROR, 999,
        # MessageId: ERROR_STACK_OVERFLOW
        # MessageText:
        # Recursion too deep; the stack overflowed.
        :STACK_OVERFLOW, 1001,
        # MessageId: ERROR_INVALID_MESSAGE
        # MessageText:
        # The window cannot act on the sent message.
        :INVALID_MESSAGE, 1002,
        # MessageId: ERROR_CAN_NOT_COMPLETE
        # MessageText:
        # Cannot complete this function.
        :CAN_NOT_COMPLETE, 1003,
        # MessageId: ERROR_INVALID_FLAGS
        # MessageText:
        # Invalid flags.
        :INVALID_FLAGS, 1004,
        # MessageId: ERROR_UNRECOGNIZED_VOLUME
        # MessageText:
        # The volume does not contain a recognized file system.
        # Please make sure that all required file system drivers are loaded and that the volume is not corrupted.
        :UNRECOGNIZED_VOLUME, 1005,
        # MessageId: ERROR_FILE_INVALID
        # MessageText:
        # The volume for a file has been externally altered so that the opened file is no longer valid.
        :FILE_INVALID, 1006,
        # MessageId: ERROR_FULLSCREEN_MODE
        # MessageText:
        # The requested operation cannot be performed in full-screen mode.
        :FULLSCREEN_MODE, 1007,
        # MessageId: ERROR_NO_TOKEN
        # MessageText:
        # An attempt was made to reference a token that does not exist.
        :NO_TOKEN, 1008,
        # MessageId: ERROR_BADDB
        # MessageText:
        # The configuration registry database is corrupt.
        :BADDB, 1009,
        # MessageId: ERROR_BADKEY
        # MessageText:
        # The configuration registry key is invalid.
        :BADKEY, 1010,
        # MessageId: ERROR_CANTOPEN
        # MessageText:
        # The configuration registry key could not be opened.
        :CANTOPEN, 1011,
        # MessageId: ERROR_CANTREAD
        # MessageText:
        # The configuration registry key could not be read.
        :CANTREAD, 1012,
        # MessageId: ERROR_CANTWRITE
        # MessageText:
        # The configuration registry key could not be written.
        :CANTWRITE, 1013,
        # MessageId: ERROR_REGISTRY_RECOVERED
        # MessageText:
        # One of the files in the registry database had to be recovered by use of a log or alternate copy. The recovery
        # was successful.
        :REGISTRY_RECOVERED, 1014,
        # MessageId: ERROR_REGISTRY_CORRUPT
        # MessageText:
        # The registry is corrupted. The structure of one of the files containing registry data is corrupted, or the
        # system's memory image of the file is corrupted, or the file could not be recovered because the alternate copy
        # or log was absent or corrupted.
        :REGISTRY_CORRUPT, 1015,
        # MessageId: ERROR_REGISTRY_IO_FAILED
        # MessageText:
        # An I/O operation initiated by the registry failed unrecoverably. The registry could not read in, or write out,
        # or flush, one of the files that contain the system's image of the registry.
        :REGISTRY_IO_FAILED, 1016,
        # MessageId: ERROR_NOT_REGISTRY_FILE
        # MessageText:
        # The system has attempted to load or restore a file into the registry, but the specified file is not in a
        # registry file format.
        :NOT_REGISTRY_FILE, 1017,
        # MessageId: ERROR_KEY_DELETED
        # MessageText:
        # Illegal operation attempted on a registry key that has been marked for deletion.
        :KEY_DELETED, 1018,
        # MessageId: ERROR_NO_LOG_SPACE
        # MessageText:
        # System could not allocate the required space in a registry log.
        :NO_LOG_SPACE, 1019,
        # MessageId: ERROR_KEY_HAS_CHILDREN
        # MessageText:
        # Cannot create a symbolic link in a registry key that already has subkeys or values.
        :KEY_HAS_CHILDREN, 1020,
        # MessageId: ERROR_CHILD_MUST_BE_VOLATILE
        # MessageText:
        # Cannot create a stable subkey under a volatile parent key.
        :CHILD_MUST_BE_VOLATILE, 1021,
        # MessageId: ERROR_NOTIFY_ENUM_DIR
        # MessageText:
        # A notify change request is being completed and the information is not being returned in the caller's buffer.
        # The caller now needs to enumerate the files to find the changes.
        :NOTIFY_ENUM_DIR, 1022,
        # MessageId: ERROR_DEPENDENT_SERVICES_RUNNING
        # MessageText:
        # A stop control has been sent to a service that other running services are dependent on.
        :DEPENDENT_SERVICES_RUNNING, 1051,
        # MessageId: ERROR_INVALID_SERVICE_CONTROL
        # MessageText:
        # The requested control is not valid for this service.
        :INVALID_SERVICE_CONTROL, 1052,
        # MessageId: ERROR_SERVICE_REQUEST_TIMEOUT
        # MessageText:
        # The service did not respond to the start or control request in a timely fashion.
        :SERVICE_REQUEST_TIMEOUT, 1053,
        # MessageId: ERROR_SERVICE_NO_THREAD
        # MessageText:
        # A thread could not be created for the service.
        :SERVICE_NO_THREAD, 1054,
        # MessageId: ERROR_SERVICE_DATABASE_LOCKED
        # MessageText:
        # The service database is locked.
        :SERVICE_DATABASE_LOCKED, 1055,
        # MessageId: ERROR_SERVICE_ALREADY_RUNNING
        # MessageText:
        # An instance of the service is already running.
        :SERVICE_ALREADY_RUNNING, 1056,
        # MessageId: ERROR_INVALID_SERVICE_ACCOUNT
        # MessageText:
        # The account name is invalid or does not exist, or the password is invalid for the account name specified.
        :INVALID_SERVICE_ACCOUNT, 1057,
        # MessageId: ERROR_SERVICE_DISABLED
        # MessageText:
        # The service cannot be started, either because it is disabled or because it has no enabled devices associated
        # with it.
        :SERVICE_DISABLED, 1058,
        # MessageId: ERROR_CIRCULAR_DEPENDENCY
        # MessageText:
        # Circular service dependency was specified.
        :CIRCULAR_DEPENDENCY, 1059,
        # MessageId: ERROR_SERVICE_DOES_NOT_EXIST
        # MessageText:
        # The specified service does not exist as an installed service.
        :SERVICE_DOES_NOT_EXIST, 1060,
        # MessageId: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
        # MessageText:
        # The service cannot accept control messages at this time.
        :SERVICE_CANNOT_ACCEPT_CTRL, 1061,
        # MessageId: ERROR_SERVICE_NOT_ACTIVE
        # MessageText:
        # The service has not been started.
        :SERVICE_NOT_ACTIVE, 1062,
        # MessageId: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
        # MessageText:
        # The service process could not connect to the service controller.
        :FAILED_SERVICE_CONTROLLER_CONNECT, 1063,
        # MessageId: ERROR_EXCEPTION_IN_SERVICE
        # MessageText:
        # An exception occurred in the service when handling the control request.
        :EXCEPTION_IN_SERVICE, 1064,
        # MessageId: ERROR_DATABASE_DOES_NOT_EXIST
        # MessageText:
        # The database specified does not exist.
        :DATABASE_DOES_NOT_EXIST, 1065,
        # MessageId: ERROR_SERVICE_SPECIFIC_ERROR
        # MessageText:
        # The service has returned a service-specific error code.
        :SERVICE_SPECIFIC_ERROR, 1066,
        # MessageId: ERROR_PROCESS_ABORTED
        # MessageText:
        # The process terminated unexpectedly.
        :PROCESS_ABORTED, 1067,
        # MessageId: ERROR_SERVICE_DEPENDENCY_FAIL
        # MessageText:
        # The dependency service or group failed to start.
        :SERVICE_DEPENDENCY_FAIL, 1068,
        # MessageId: ERROR_SERVICE_LOGON_FAILED
        # MessageText:
        # The service did not start due to a logon failure.
        :SERVICE_LOGON_FAILED, 1069,
        # MessageId: ERROR_SERVICE_START_HANG
        # MessageText:
        # After starting, the service hung in a start-pending state.
        :SERVICE_START_HANG, 1070,
        # MessageId: ERROR_INVALID_SERVICE_LOCK
        # MessageText:
        # The specified service database lock is invalid.
        :INVALID_SERVICE_LOCK, 1071,
        # MessageId: ERROR_SERVICE_MARKED_FOR_DELETE
        # MessageText:
        # The specified service has been marked for deletion.
        :SERVICE_MARKED_FOR_DELETE, 1072,
        # MessageId: ERROR_SERVICE_EXISTS
        # MessageText:
        # The specified service already exists.
        :SERVICE_EXISTS, 1073,
        # MessageId: ERROR_ALREADY_RUNNING_LKG
        # MessageText:
        # The system is currently running with the last-known-good configuration.
        :ALREADY_RUNNING_LKG, 1074,
        # MessageId: ERROR_SERVICE_DEPENDENCY_DELETED
        # MessageText:
        # The dependency service does not exist or has been marked for deletion.
        :SERVICE_DEPENDENCY_DELETED, 1075,
        # MessageId: ERROR_BOOT_ALREADY_ACCEPTED
        # MessageText:
        # The current boot has already been accepted for use as the last-known-good control set.
        :BOOT_ALREADY_ACCEPTED, 1076,
        # MessageId: ERROR_SERVICE_NEVER_STARTED
        # MessageText:
        # No attempts to start the service have been made since the last boot.
        :SERVICE_NEVER_STARTED, 1077,
        # MessageId: ERROR_DUPLICATE_SERVICE_NAME
        # MessageText:
        # The name is already in use as either a service name or a service display name.
        :DUPLICATE_SERVICE_NAME, 1078,
        # MessageId: ERROR_DIFFERENT_SERVICE_ACCOUNT
        # MessageText:
        # The account specified for this service is different from the account specified for other services running in
        # the same process.
        :DIFFERENT_SERVICE_ACCOUNT, 1079,
        # MessageId: ERROR_CANNOT_DETECT_DRIVER_FAILURE
        # MessageText:
        # Failure actions can only be set for Win32 services, not for drivers.
        :CANNOT_DETECT_DRIVER_FAILURE, 1080,
        # MessageId: ERROR_CANNOT_DETECT_PROCESS_ABORT
        # MessageText:
        # This service runs in the same process as the service control manager.
        # Therefore, the service control manager cannot take action if this service's process terminates unexpectedly.
        :CANNOT_DETECT_PROCESS_ABORT, 1081,
        # MessageId: ERROR_NO_RECOVERY_PROGRAM
        # MessageText:
        # No recovery program has been configured for this service.
        :NO_RECOVERY_PROGRAM, 1082,
        # MessageId: ERROR_SERVICE_NOT_IN_EXE
        # MessageText:
        # The executable program that this service is configured to run in does not implement the service.
        :SERVICE_NOT_IN_EXE, 1083,
        # MessageId: ERROR_NOT_SAFEBOOT_SERVICE
        # MessageText:
        # This service cannot be started in Safe Mode
        :NOT_SAFEBOOT_SERVICE, 1084,
        # MessageId: ERROR_END_OF_MEDIA
        # MessageText:
        # The physical end of the tape has been reached.
        :END_OF_MEDIA, 1100,
        # MessageId: ERROR_FILEMARK_DETECTED
        # MessageText:
        # A tape access reached a filemark.
        :FILEMARK_DETECTED, 1101,
        # MessageId: ERROR_BEGINNING_OF_MEDIA
        # MessageText:
        # The beginning of the tape or a partition was encountered.
        :BEGINNING_OF_MEDIA, 1102,
        # MessageId: ERROR_SETMARK_DETECTED
        # MessageText:
        # A tape access reached the end of a set of files.
        :SETMARK_DETECTED, 1103,
        # MessageId: ERROR_NO_DATA_DETECTED
        # MessageText:
        # No more data is on the tape.
        :NO_DATA_DETECTED, 1104,
        # MessageId: ERROR_PARTITION_FAILURE
        # MessageText:
        # Tape could not be partitioned.
        :PARTITION_FAILURE, 1105,
        # MessageId: ERROR_INVALID_BLOCK_LENGTH
        # MessageText:
        # When accessing a new tape of a multivolume partition, the current block size is incorrect.
        :INVALID_BLOCK_LENGTH, 1106,
        # MessageId: ERROR_DEVICE_NOT_PARTITIONED
        # MessageText:
        # Tape partition information could not be found when loading a tape.
        :DEVICE_NOT_PARTITIONED, 1107,
        # MessageId: ERROR_UNABLE_TO_LOCK_MEDIA
        # MessageText:
        # Unable to lock the media eject mechanism.
        :UNABLE_TO_LOCK_MEDIA, 1108,
        # MessageId: ERROR_UNABLE_TO_UNLOAD_MEDIA
        # MessageText:
        # Unable to unload the media.
        :UNABLE_TO_UNLOAD_MEDIA, 1109,
        # MessageId: ERROR_MEDIA_CHANGED
        # MessageText:
        # The media in the drive may have changed.
        :MEDIA_CHANGED, 1110,
        # MessageId: ERROR_BUS_RESET
        # MessageText:
        # The I/O bus was reset.
        :BUS_RESET, 1111,
        # MessageId: ERROR_NO_MEDIA_IN_DRIVE
        # MessageText:
        # No media in drive.
        :NO_MEDIA_IN_DRIVE, 1112,
        # MessageId: ERROR_NO_UNICODE_TRANSLATION
        # MessageText:
        # No mapping for the Unicode character exists in the target multi-byte code page.
        :NO_UNICODE_TRANSLATION, 1113,
        # MessageId: ERROR_DLL_INIT_FAILED
        # MessageText:
        # A dynamic link library (DLL) initialization routine failed.
        :DLL_INIT_FAILED, 1114,
        # MessageId: ERROR_SHUTDOWN_IN_PROGRESS
        # MessageText:
        # A system shutdown is in progress.
        :SHUTDOWN_IN_PROGRESS, 1115,
        # MessageId: ERROR_NO_SHUTDOWN_IN_PROGRESS
        # MessageText:
        # Unable to abort the system shutdown because no shutdown was in progress.
        :NO_SHUTDOWN_IN_PROGRESS, 1116,
        # MessageId: ERROR_IO_DEVICE
        # MessageText:
        # The request could not be performed because of an I/O device error.
        :IO_DEVICE, 1117,
        # MessageId: ERROR_SERIAL_NO_DEVICE
        # MessageText:
        # No serial device was successfully initialized. The serial driver will unload.
        :SERIAL_NO_DEVICE, 1118,
        # MessageId: ERROR_IRQ_BUSY
        # MessageText:
        # Unable to open a device that was sharing an interrupt request (IRQ) with other devices. At least one other
        # device that uses that IRQ was already opened.
        :IRQ_BUSY, 1119,
        # MessageId: ERROR_MORE_WRITES
        # MessageText:
        # A serial I/O operation was completed by another write to the serial port.
        # (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
        :MORE_WRITES, 1120,
        # MessageId: ERROR_COUNTER_TIMEOUT
        # MessageText:
        # A serial I/O operation completed because the timeout period expired.
        # (The IOCTL_SERIAL_XOFF_COUNTER did not reach zero.)
        :COUNTER_TIMEOUT, 1121,
        # MessageId: ERROR_FLOPPY_ID_MARK_NOT_FOUND
        # MessageText:
        # No ID address mark was found on the floppy disk.
        :FLOPPY_ID_MARK_NOT_FOUND, 1122,
        # MessageId: ERROR_FLOPPY_WRONG_CYLINDER
        # MessageText:
        # Mismatch between the floppy disk sector ID field and the floppy disk controller track address.
        :FLOPPY_WRONG_CYLINDER, 1123,
        # MessageId: ERROR_FLOPPY_UNKNOWN_ERROR
        # MessageText:
        # The floppy disk controller reported an error that is not recognized by the floppy disk driver.
        :FLOPPY_UNKNOWN_ERROR, 1124,
        # MessageId: ERROR_FLOPPY_BAD_REGISTERS
        # MessageText:
        # The floppy disk controller returned inconsistent results in its registers.
        :FLOPPY_BAD_REGISTERS, 1125,
        # MessageId: ERROR_DISK_RECALIBRATE_FAILED
        # MessageText:
        # While accessing the hard disk, a recalibrate operation failed, even after retries.
        :DISK_RECALIBRATE_FAILED, 1126,
        # MessageId: ERROR_DISK_OPERATION_FAILED
        # MessageText:
        # While accessing the hard disk, a disk operation failed even after retries.
        :DISK_OPERATION_FAILED, 1127,
        # MessageId: ERROR_DISK_RESET_FAILED
        # MessageText:
        # While accessing the hard disk, a disk controller reset was needed, but even that failed.
        :DISK_RESET_FAILED, 1128,
        # MessageId: ERROR_EOM_OVERFLOW
        # MessageText:
        # Physical end of tape encountered.
        :EOM_OVERFLOW, 1129,
        # MessageId: ERROR_NOT_ENOUGH_SERVER_MEMORY
        # MessageText:
        # Not enough server storage is available to process this command.
        :NOT_ENOUGH_SERVER_MEMORY, 1130,
        # MessageId: ERROR_POSSIBLE_DEADLOCK
        # MessageText:
        # A potential deadlock condition has been detected.
        :POSSIBLE_DEADLOCK, 1131,
        # MessageId: ERROR_MAPPED_ALIGNMENT
        # MessageText:
        # The base address or the file offset specified does not have the proper alignment.
        :MAPPED_ALIGNMENT, 1132,
        # MessageId: ERROR_SET_POWER_STATE_VETOED
        # MessageText:
        # An attempt to change the system power state was vetoed by another application or driver.
        :SET_POWER_STATE_VETOED, 1140,
        # MessageId: ERROR_SET_POWER_STATE_FAILED
        # MessageText:
        # The system BIOS failed an attempt to change the system power state.
        :SET_POWER_STATE_FAILED, 1141,
        # MessageId: ERROR_TOO_MANY_LINKS
        # MessageText:
        # An attempt was made to create more links on a file than the file system supports.
        :TOO_MANY_LINKS, 1142,
        # MessageId: ERROR_OLD_WIN_VERSION
        # MessageText:
        # The specified program requires a newer version of Windows.
        :OLD_WIN_VERSION, 1150,
        # MessageId: ERROR_APP_WRONG_OS
        # MessageText:
        # The specified program is not a Windows or MS-DOS program.
        :APP_WRONG_OS, 1151,
        # MessageId: ERROR_SINGLE_INSTANCE_APP
        # MessageText:
        # Cannot start more than one instance of the specified program.
        :SINGLE_INSTANCE_APP, 1152,
        # MessageId: ERROR_RMODE_APP
        # MessageText:
        # The specified program was written for an earlier version of Windows.
        :RMODE_APP, 1153,
        # MessageId: ERROR_INVALID_DLL
        # MessageText:
        # One of the library files needed to run this application is damaged.
        :INVALID_DLL, 1154,
        # MessageId: ERROR_NO_ASSOCIATION
        # MessageText:
        # No application is associated with the specified file for this operation.
        :NO_ASSOCIATION, 1155,
        # MessageId: ERROR_DDE_FAIL
        # MessageText:
        # An error occurred in sending the command to the application.
        :DDE_FAIL, 1156,
        # MessageId: ERROR_DLL_NOT_FOUND
        # MessageText:
        # One of the library files needed to run this application cannot be found.
        :DLL_NOT_FOUND, 1157,
        # MessageId: ERROR_NO_MORE_USER_HANDLES
        # MessageText:
        # The current process has used all of its system allowance of handles for Window Manager objects.
        :NO_MORE_USER_HANDLES, 1158,
        # MessageId: ERROR_MESSAGE_SYNC_ONLY
        # MessageText:
        # The message can be used only with synchronous operations.
        :MESSAGE_SYNC_ONLY, 1159,
        # MessageId: ERROR_SOURCE_ELEMENT_EMPTY
        # MessageText:
        # The indicated source element has no media.
        :SOURCE_ELEMENT_EMPTY, 1160,
        # MessageId: ERROR_DESTINATION_ELEMENT_FULL
        # MessageText:
        # The indicated destination element already contains media.
        :DESTINATION_ELEMENT_FULL, 1161,
        # MessageId: ERROR_ILLEGAL_ELEMENT_ADDRESS
        # MessageText:
        # The indicated element does not exist.
        :ILLEGAL_ELEMENT_ADDRESS, 1162,
        # MessageId: ERROR_MAGAZINE_NOT_PRESENT
        # MessageText:
        # The indicated element is part of a magazine that is not present.
        :MAGAZINE_NOT_PRESENT, 1163,
        # MessageId: ERROR_DEVICE_REINITIALIZATION_NEEDED
        # MessageText:
        # The indicated device requires reinitialization due to hardware errors.
        :DEVICE_REINITIALIZATION_NEEDED, 1164,    # dderror# MessageId: ERROR_DEVICE_REQUIRES_CLEANING
        # MessageText:
        # The device has indicated that cleaning is required before further operations are attempted.
        :DEVICE_REQUIRES_CLEANING, 1165,
        # MessageId: ERROR_DEVICE_DOOR_OPEN
        # MessageText:
        # The device has indicated that its door is open.
        :DEVICE_DOOR_OPEN, 1166,
        # MessageId: ERROR_DEVICE_NOT_CONNECTED
        # MessageText:
        # The device is not connected.
        :DEVICE_NOT_CONNECTED, 1167,
        # MessageId: ERROR_NOT_FOUND
        # MessageText:
        # Element not found.
        :NOT_FOUND, 1168,
        # MessageId: ERROR_NO_MATCH
        # MessageText:
        # There was no match for the specified key in the index.
        :NO_MATCH, 1169,
        # MessageId: ERROR_SET_NOT_FOUND
        # MessageText:
        # The property set specified does not exist on the object.
        :SET_NOT_FOUND, 1170,
        # MessageId: ERROR_POINT_NOT_FOUND
        # MessageText:
        # The point passed to GetMouseMovePoints is not in the buffer.
        :POINT_NOT_FOUND, 1171,
        # MessageId: ERROR_NO_TRACKING_SERVICE
        # MessageText:
        # The tracking (workstation) service is not running.
        :NO_TRACKING_SERVICE, 1172,
        # MessageId: ERROR_NO_VOLUME_ID
        # MessageText:
        # The Volume ID could not be found.
        :NO_VOLUME_ID, 1173,
        # MessageId: ERROR_UNABLE_TO_REMOVE_REPLACED
        # MessageText:
        # Unable to remove the file to be replaced.
        :UNABLE_TO_REMOVE_REPLACED, 1175,
        # MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT
        # MessageText:
        # Unable to move the replacement file to the file to be replaced. The file to be replaced has retained its
        # original name.
        :UNABLE_TO_MOVE_REPLACEMENT, 1176,
        # MessageId: ERROR_UNABLE_TO_MOVE_REPLACEMENT_2
        # MessageText:
        # Unable to move the replacement file to the file to be replaced. The file to be replaced has been renamed using
        # the backup name.
        :UNABLE_TO_MOVE_REPLACEMENT_2, 1177,
        # MessageId: ERROR_JOURNAL_DELETE_IN_PROGRESS
        # MessageText:
        # The volume change journal is being deleted.
        :JOURNAL_DELETE_IN_PROGRESS, 1178,
        # MessageId: ERROR_JOURNAL_NOT_ACTIVE
        # MessageText:
        # The volume change journal is not active.
        :JOURNAL_NOT_ACTIVE, 1179,
        # MessageId: ERROR_POTENTIAL_FILE_FOUND
        # MessageText:
        # A file was found, but it may not be the correct file.
        :POTENTIAL_FILE_FOUND, 1180,
        # MessageId: ERROR_JOURNAL_ENTRY_DELETED
        # MessageText:
        # The journal entry has been deleted from the journal.
        :JOURNAL_ENTRY_DELETED, 1181,
        # MessageId: ERROR_SHUTDOWN_IS_SCHEDULED
        # MessageText:
        # A system shutdown has already been scheduled.
        :SHUTDOWN_IS_SCHEDULED, 1190,
        # MessageId: ERROR_SHUTDOWN_USERS_LOGGED_ON
        # MessageText:
        # The system shutdown cannot be initiated because there are other users logged on to the computer.
        :SHUTDOWN_USERS_LOGGED_ON, 1191,
        # MessageId: ERROR_BAD_DEVICE
        # MessageText:
        # The specified device name is invalid.
        :BAD_DEVICE, 1200,
        # MessageId: ERROR_CONNECTION_UNAVAIL
        # MessageText:
        # The device is not currently connected but it is a remembered connection.
        :CONNECTION_UNAVAIL, 1201,
        # MessageId: ERROR_DEVICE_ALREADY_REMEMBERED
        # MessageText:
        # The local device name has a remembered connection to another network resource.
        :DEVICE_ALREADY_REMEMBERED, 1202,
        # MessageId: ERROR_NO_NET_OR_BAD_PATH
        # MessageText:
        # The network path was either typed incorrectly, does not exist, or the network provider is not currently
        # available. Please try retyping the path or contact your network administrator.
        :NO_NET_OR_BAD_PATH, 1203,
        # MessageId: ERROR_BAD_PROVIDER
        # MessageText:
        # The specified network provider name is invalid.
        :BAD_PROVIDER, 1204,
        # MessageId: ERROR_CANNOT_OPEN_PROFILE
        # MessageText:
        # Unable to open the network connection profile.
        :CANNOT_OPEN_PROFILE, 1205,
        # MessageId: ERROR_BAD_PROFILE
        # MessageText:
        # The network connection profile is corrupted.
        :BAD_PROFILE, 1206,
        # MessageId: ERROR_NOT_CONTAINER
        # MessageText:
        # Cannot enumerate a noncontainer.
        :NOT_CONTAINER, 1207,
        # MessageId: ERROR_EXTENDED_ERROR
        # MessageText:
        # An extended error has occurred.
        :EXTENDED_ERROR, 1208,
        # MessageId: ERROR_INVALID_GROUPNAME
        # MessageText:
        # The format of the specified group name is invalid.
        :INVALID_GROUPNAME, 1209,
        # MessageId: ERROR_INVALID_COMPUTERNAME
        # MessageText:
        # The format of the specified computer name is invalid.
        :INVALID_COMPUTERNAME, 1210,
        # MessageId: ERROR_INVALID_EVENTNAME
        # MessageText:
        # The format of the specified event name is invalid.
        :INVALID_EVENTNAME, 1211,
        # MessageId: ERROR_INVALID_DOMAINNAME
        # MessageText:
        # The format of the specified domain name is invalid.
        :INVALID_DOMAINNAME, 1212,
        # MessageId: ERROR_INVALID_SERVICENAME
        # MessageText:
        # The format of the specified service name is invalid.
        :INVALID_SERVICENAME, 1213,
        # MessageId: ERROR_INVALID_NETNAME
        # MessageText:
        # The format of the specified network name is invalid.
        :INVALID_NETNAME, 1214,
        # MessageId: ERROR_INVALID_SHARENAME
        # MessageText:
        # The format of the specified share name is invalid.
        :INVALID_SHARENAME, 1215,
        # MessageId: ERROR_INVALID_PASSWORDNAME
        # MessageText:
        # The format of the specified password is invalid.
        :INVALID_PASSWORDNAME, 1216,
        # MessageId: ERROR_INVALID_MESSAGENAME
        # MessageText:
        # The format of the specified message name is invalid.
        :INVALID_MESSAGENAME, 1217,
        # MessageId: ERROR_INVALID_MESSAGEDEST
        # MessageText:
        # The format of the specified message destination is invalid.
        :INVALID_MESSAGEDEST, 1218,
        # MessageId: ERROR_SESSION_CREDENTIAL_CONFLICT
        # MessageText:
        # Multiple connections to a server or shared resource by the same user, using more than one user name, are not
        # allowed. Disconnect all previous connections to the server or shared resource and try again.
        :SESSION_CREDENTIAL_CONFLICT, 1219,
        # MessageId: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
        # MessageText:
        # An attempt was made to establish a session to a network server, but there are already too many sessions
        # established to that server.
        :REMOTE_SESSION_LIMIT_EXCEEDED, 1220,
        # MessageId: ERROR_DUP_DOMAINNAME
        # MessageText:
        # The workgroup or domain name is already in use by another computer on the network.
        :DUP_DOMAINNAME, 1221,
        # MessageId: ERROR_NO_NETWORK
        # MessageText:
        # The network is not present or not started.
        :NO_NETWORK, 1222,
        # MessageId: ERROR_CANCELLED
        # MessageText:
        # The operation was canceled by the user.
        :CANCELLED, 1223,
        # MessageId: ERROR_USER_MAPPED_FILE
        # MessageText:
        # The requested operation cannot be performed on a file with a user-mapped section open.
        :USER_MAPPED_FILE, 1224,
        # MessageId: ERROR_CONNECTION_REFUSED
        # MessageText:
        # The remote computer refused the network connection.
        :CONNECTION_REFUSED, 1225,
        # MessageId: ERROR_GRACEFUL_DISCONNECT
        # MessageText:
        # The network connection was gracefully closed.
        :GRACEFUL_DISCONNECT, 1226,
        # MessageId: ERROR_ADDRESS_ALREADY_ASSOCIATED
        # MessageText:
        # The network transport endpoint already has an address associated with it.
        :ADDRESS_ALREADY_ASSOCIATED, 1227,
        # MessageId: ERROR_ADDRESS_NOT_ASSOCIATED
        # MessageText:
        # An address has not yet been associated with the network endpoint.
        :ADDRESS_NOT_ASSOCIATED, 1228,
        # MessageId: ERROR_CONNECTION_INVALID
        # MessageText:
        # An operation was attempted on a nonexistent network connection.
        :CONNECTION_INVALID, 1229,
        # MessageId: ERROR_CONNECTION_ACTIVE
        # MessageText:
        # An invalid operation was attempted on an active network connection.
        :CONNECTION_ACTIVE, 1230,
        # MessageId: ERROR_NETWORK_UNREACHABLE
        # MessageText:
        # The network location cannot be reached. For information about network troubleshooting, see Windows Help.
        :NETWORK_UNREACHABLE, 1231,
        # MessageId: ERROR_HOST_UNREACHABLE
        # MessageText:
        # The network location cannot be reached. For information about network troubleshooting, see Windows Help.
        :HOST_UNREACHABLE, 1232,
        # MessageId: ERROR_PROTOCOL_UNREACHABLE
        # MessageText:
        # The network location cannot be reached. For information about network troubleshooting, see Windows Help.
        :PROTOCOL_UNREACHABLE, 1233,
        # MessageId: ERROR_PORT_UNREACHABLE
        # MessageText:
        # No service is operating at the destination network endpoint on the remote system.
        :PORT_UNREACHABLE, 1234,
        # MessageId: ERROR_REQUEST_ABORTED
        # MessageText:
        # The request was aborted.
        :REQUEST_ABORTED, 1235,
        # MessageId: ERROR_CONNECTION_ABORTED
        # MessageText:
        # The network connection was aborted by the local system.
        :CONNECTION_ABORTED, 1236,
        # MessageId: ERROR_RETRY
        # MessageText:
        # The operation could not be completed. A retry should be performed.
        :RETRY, 1237,
        # MessageId: ERROR_CONNECTION_COUNT_LIMIT
        # MessageText:
        # A connection to the server could not be made because the limit on the number of concurrent connections for
        # this account has been reached.
        :CONNECTION_COUNT_LIMIT, 1238,
        # MessageId: ERROR_LOGIN_TIME_RESTRICTION
        # MessageText:
        # Attempting to log in during an unauthorized time of day for this account.
        :LOGIN_TIME_RESTRICTION, 1239,
        # MessageId: ERROR_LOGIN_WKSTA_RESTRICTION
        # MessageText:
        # The account is not authorized to log in from this station.
        :LOGIN_WKSTA_RESTRICTION, 1240,
        # MessageId: ERROR_INCORRECT_ADDRESS
        # MessageText:
        # The network address could not be used for the operation requested.
        :INCORRECT_ADDRESS, 1241,
        # MessageId: ERROR_ALREADY_REGISTERED
        # MessageText:
        # The service is already registered.
        :ALREADY_REGISTERED, 1242,
        # MessageId: ERROR_SERVICE_NOT_FOUND
        # MessageText:
        # The specified service does not exist.
        :SERVICE_NOT_FOUND, 1243,
        # MessageId: ERROR_NOT_AUTHENTICATED
        # MessageText:
        # The operation being requested was not performed because the user has not been authenticated.
        :NOT_AUTHENTICATED, 1244,
        # MessageId: ERROR_NOT_LOGGED_ON
        # MessageText:
        # The operation being requested was not performed because the user has not logged on to the network. The
        # specified service does not exist.
        :NOT_LOGGED_ON, 1245,
        # MessageId: ERROR_CONTINUE
        # MessageText:
        # Continue with work in progress.
        :CONTINUE, 1246,    # dderror# MessageId: ERROR_ALREADY_INITIALIZED
        # MessageText:
        # An attempt was made to perform an initialization operation when initialization has already been completed.
        :ALREADY_INITIALIZED, 1247,
        # MessageId: ERROR_NO_MORE_DEVICES
        # MessageText:
        # No more local devices.
        :NO_MORE_DEVICES, 1248,    # dderror# MessageId: ERROR_NO_SUCH_SITE
        # MessageText:
        # The specified site does not exist.
        :NO_SUCH_SITE, 1249,
        # MessageId: ERROR_DOMAIN_CONTROLLER_EXISTS
        # MessageText:
        # A domain controller with the specified name already exists.
        :DOMAIN_CONTROLLER_EXISTS, 1250,
        # MessageId: ERROR_ONLY_IF_CONNECTED
        # MessageText:
        # This operation is supported only when you are connected to the server.
        :ONLY_IF_CONNECTED, 1251,
        # MessageId: ERROR_OVERRIDE_NOCHANGES
        # MessageText:
        # The group policy framework should call the extension even if there are no changes.
        :OVERRIDE_NOCHANGES, 1252,
        # MessageId: ERROR_BAD_USER_PROFILE
        # MessageText:
        # The specified user does not have a valid profile.
        :BAD_USER_PROFILE, 1253,
        # MessageId: ERROR_NOT_SUPPORTED_ON_SBS
        # MessageText:
        # This operation is not supported on a computer running Windows Server 2003 for Small Business Server
        :NOT_SUPPORTED_ON_SBS, 1254,
        # MessageId: ERROR_SERVER_SHUTDOWN_IN_PROGRESS
        # MessageText:
        # The server machine is shutting down.
        :SERVER_SHUTDOWN_IN_PROGRESS, 1255,
        # MessageId: ERROR_HOST_DOWN
        # MessageText:
        # The remote system is not available. For information about network troubleshooting, see Windows Help.
        :HOST_DOWN, 1256,
        # MessageId: ERROR_NON_ACCOUNT_SID
        # MessageText:
        # The security identifier provided is not from an account domain.
        :NON_ACCOUNT_SID, 1257,
        # MessageId: ERROR_NON_DOMAIN_SID
        # MessageText:
        # The security identifier provided does not have a domain component.
        :NON_DOMAIN_SID, 1258,
        # MessageId: ERROR_APPHELP_BLOCK
        # MessageText:
        # AppHelp dialog canceled thus preventing the application from starting.
        :APPHELP_BLOCK, 1259,
        # MessageId: ERROR_ACCESS_DISABLED_BY_POLICY
        # MessageText:
        # This program is blocked by group policy. For more information, contact your system administrator.
        :ACCESS_DISABLED_BY_POLICY, 1260,
        # MessageId: ERROR_REG_NAT_CONSUMPTION
        # MessageText:
        # A program attempt to use an invalid register value. Normally caused by an uninitialized register. This error
        # is Itanium specific.
        :REG_NAT_CONSUMPTION, 1261,
        # MessageId: ERROR_CSCSHARE_OFFLINE
        # MessageText:
        # The share is currently offline or does not exist.
        :CSCSHARE_OFFLINE, 1262,
        # MessageId: ERROR_PKINIT_FAILURE
        # MessageText:
        # The Kerberos protocol encountered an error while validating the KDC certificate during smartcard logon. There
        # is more information in the system event log.
        :PKINIT_FAILURE, 1263,
        # MessageId: ERROR_SMARTCARD_SUBSYSTEM_FAILURE
        # MessageText:
        # The Kerberos protocol encountered an error while attempting to utilize the smartcard subsystem.
        :SMARTCARD_SUBSYSTEM_FAILURE, 1264,
        # MessageId: ERROR_DOWNGRADE_DETECTED
        # MessageText:
        # The system cannot contact a domain controller to service the authentication request. Please try again later.
        :DOWNGRADE_DETECTED, 1265,
        # Do not use ID's 1266 - 1270 as the symbolicNames have been moved to SEC_E_*
        # MessageId: ERROR_MACHINE_LOCKED
        # MessageText:
        # The machine is locked and cannot be shut down without the force option.
        :MACHINE_LOCKED, 1271,
        # MessageId: ERROR_SMB_GUEST_LOGON_BLOCKED
        # MessageText:
        # You can't access this shared folder because your organization's security policies block unauthenticated guest
        # access. These policies help protect your PC from unsafe or malicious devices on the network.
        :SMB_GUEST_LOGON_BLOCKED, 1272,
        # MessageId: ERROR_CALLBACK_SUPPLIED_INVALID_DATA
        # MessageText:
        # An application-defined callback gave invalid data when called.
        :CALLBACK_SUPPLIED_INVALID_DATA, 1273,
        # MessageId: ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED
        # MessageText:
        # The group policy framework should call the extension in the synchronous foreground policy refresh.
        :SYNC_FOREGROUND_REFRESH_REQUIRED, 1274,
        # MessageId: ERROR_DRIVER_BLOCKED
        # MessageText:
        # This driver has been blocked from loading
        :DRIVER_BLOCKED, 1275,
        # MessageId: ERROR_INVALID_IMPORT_OF_NON_DLL
        # MessageText:
        # A dynamic link library (DLL) referenced a module that was neither a DLL nor the process's executable image.
        :INVALID_IMPORT_OF_NON_DLL, 1276,
        # MessageId: ERROR_ACCESS_DISABLED_WEBBLADE
        # MessageText:
        # Windows cannot open this program since it has been disabled.
        :ACCESS_DISABLED_WEBBLADE, 1277,
        # MessageId: ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER
        # MessageText:
        # Windows cannot open this program because the license enforcement system has been tampered with or become
        # corrupted.
        :ACCESS_DISABLED_WEBBLADE_TAMPER, 1278,
        # MessageId: ERROR_RECOVERY_FAILURE
        # MessageText:
        # A transaction recover failed.
        :RECOVERY_FAILURE, 1279,
        # MessageId: ERROR_ALREADY_FIBER
        # MessageText:
        # The current thread has already been converted to a fiber.
        :ALREADY_FIBER, 1280,
        # MessageId: ERROR_ALREADY_THREAD
        # MessageText:
        # The current thread has already been converted from a fiber.
        :ALREADY_THREAD, 1281,
        # MessageId: ERROR_STACK_BUFFER_OVERRUN
        # MessageText:
        # The system detected an overrun of a stack-based buffer in this application. This overrun could potentially
        # allow a malicious user to gain control of this application.
        :STACK_BUFFER_OVERRUN, 1282,
        # MessageId: ERROR_PARAMETER_QUOTA_EXCEEDED
        # MessageText:
        # Data present in one of the parameters is more than the function can operate on.
        :PARAMETER_QUOTA_EXCEEDED, 1283,
        # MessageId: ERROR_DEBUGGER_INACTIVE
        # MessageText:
        # An attempt to do an operation on a debug object failed because the object is in the process of being deleted.
        :DEBUGGER_INACTIVE, 1284,
        # MessageId: ERROR_DELAY_LOAD_FAILED
        # MessageText:
        # An attempt to delay-load a .dll or get a function address in a delay-loaded .dll failed.
        :DELAY_LOAD_FAILED, 1285,
        # MessageId: ERROR_VDM_DISALLOWED
        # MessageText:
        # %1 is a 16-bit application. You do not have permissions to execute 16-bit applications. Check your permissions
        # with your system administrator.
        :VDM_DISALLOWED, 1286,
        # MessageId: ERROR_UNIDENTIFIED_ERROR
        # MessageText:
        # Insufficient information exists to identify the cause of failure.
        :UNIDENTIFIED_ERROR, 1287,
        # MessageId: ERROR_INVALID_CRUNTIME_PARAMETER
        # MessageText:
        # The parameter passed to a C runtime function is incorrect.
        :INVALID_CRUNTIME_PARAMETER, 1288,
        # MessageId: ERROR_BEYOND_VDL
        # MessageText:
        # The operation occurred beyond the valid data length of the file.
        :BEYOND_VDL, 1289,
        # MessageId: ERROR_INCOMPATIBLE_SERVICE_SID_TYPE
        # MessageText:
        # The service start failed since one or more services in the same process have an incompatible service SID type
        # setting. A service with restricted service SID type can only coexist in the same process with other services
        # with a restricted SID type. If the service SID type for this service was just configured, the hosting process
        # must be restarted in order to start this service.
        :INCOMPATIBLE_SERVICE_SID_TYPE, 1290,
        # MessageId: ERROR_DRIVER_PROCESS_TERMINATED
        # MessageText:
        # The process hosting the driver for this device has been terminated.
        :DRIVER_PROCESS_TERMINATED, 1291,
        # MessageId: ERROR_IMPLEMENTATION_LIMIT
        # MessageText:
        # An operation attempted to exceed an implementation-defined limit.
        :IMPLEMENTATION_LIMIT, 1292,
        # MessageId: ERROR_PROCESS_IS_PROTECTED
        # MessageText:
        # Either the target process, or the target thread's containing process, is a protected process.
        :PROCESS_IS_PROTECTED, 1293,
        # MessageId: ERROR_SERVICE_NOTIFY_CLIENT_LAGGING
        # MessageText:
        # The service notification client is lagging too far behind the current state of services in the machine.
        :SERVICE_NOTIFY_CLIENT_LAGGING, 1294,
        # MessageId: ERROR_DISK_QUOTA_EXCEEDED
        # MessageText:
        # The requested file operation failed because the storage quota was exceeded.
        # To free up disk space, move files to a different location or delete unnecessary files. For more information,
        # contact your system administrator.
        :DISK_QUOTA_EXCEEDED, 1295,
        # MessageId: ERROR_CONTENT_BLOCKED
        # MessageText:
        # The requested file operation failed because the storage policy blocks that type of file. For more information,
        # contact your system administrator.
        :CONTENT_BLOCKED, 1296,
        # MessageId: ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE
        # MessageText:
        # A privilege that the service requires to function properly does not exist in the service account configuration
        # You may use the Services Microsoft Management Console (MMC) snap-in (services.msc) and the Local Security
        # Settings MMC snap-in (secpol.msc) to view the service configuration and the account configuration.
        :INCOMPATIBLE_SERVICE_PRIVILEGE, 1297,
        # MessageId: ERROR_APP_HANG
        # MessageText:
        # A thread involved in this operation appears to be unresponsive.
        :APP_HANG, 1298,

        #=== CopyFile ext. Error codes  3050 to 3059 ===#
        # MessageId: ERROR_REQUEST_PAUSED
        # MessageText:
        # The operation was paused.
        :REQUEST_PAUSED, 3050,

        #=== Available 3060 to 3199 ===#

        # the message range 3200 to 3299 is reserved and used in isolation lib

        #=== Available 3300 to 3899 ===#

        #=== IO Error Codes  3900 to 3999 ===#
        # MessageId: ERROR_IO_REISSUE_AS_CACHED
        # MessageText:
        # Reissue the given operation as a cached IO operation
        :IO_REISSUE_AS_CACHED, 3950,

        #=== DHCP Error codes 4100 to 4149 ===#
        # MessageId: ERROR_DHCP_ADDRESS_CONFLICT
        # MessageText:
        # The DHCP client has obtained an IP address that is already in use on the network. The local interface will be
        # disabled until the DHCP client can obtain a new address.
        :DHCP_ADDRESS_CONFLICT, 4100,

        #=== Available 4150 to 4199 ===#

        #=== Single Instance Store (SIS) Error codes 4500 to 4549 ===#
        # MessageId: ERROR_VOLUME_NOT_SIS_ENABLED
        # MessageText:
        # Single Instance Storage is not available on this volume.
        :VOLUME_NOT_SIS_ENABLED, 4500,

        #=== VSM Error codes 4560 to 4569 ===#
        # MessageId: ERROR_VSM_NOT_INITIALIZED
        # MessageText:
        # Virtual Secure Mode (VSM) is not initialized. The hypervisor or VSM may not be present or enabled.
        :VSM_NOT_INITIALIZED, 4560,
        # MessageId: ERROR_VSM_DMA_PROTECTION_NOT_IN_USE
        # MessageText:
        # The hypervisor is not protecting DMA because an IOMMU is not present or not enabled in the BIOS.
        :VSM_DMA_PROTECTION_NOT_IN_USE, 4561,

        #=== Available 4570 to 4599 ===#

        #=== BROWSER Error codes 6100 to 6199 ===#
        # This message number is for historical purposes and cannot be changed or re-used.
        # MessageId: ERROR_NO_BROWSER_SERVERS_FOUND
        # MessageText:
        # The list of servers for this workgroup is not currently available
        :NO_BROWSER_SERVERS_FOUND, 6118,

        #=== Task Scheduler Error codes NET START must understand 6200 to 6249 ===#
        # MessageId: SCHED_E_SERVICE_NOT_LOCALSYSTEM
        # MessageText:
        # The Task Scheduler service must be configured to run in the System account to function properly. Individual
        # tasks may be configured to run in other accounts.
        :SCHED_E_SERVICE_NOT_LOCALSYSTEM, 6200,

        #=== Available 6250 to 6599 ===#

        #=== Available 6900 to 6999 ===#

        #=== Windows Fabric Error Codes  7100 to 7499  defined in FabricCommon.idl ===#

        #=== Traffic Control Error Codes 7500 to 7999 defined in: tcerror.h ===#

        #=== Available 12000 to 12999 ===#


        #=== Start of Syspart error codes 15250 - 15299 ===#
        # MessageId: ERROR_AMBIGUOUS_SYSTEM_DEVICE
        # MessageText:
        # The requested system device cannot be identified due to multiple indistinguishable devices potentially matching the identification criteria.
        :AMBIGUOUS_SYSTEM_DEVICE, 15250,
        # MessageId: ERROR_SYSTEM_DEVICE_NOT_FOUND
        # MessageText:
        # The requested system device cannot be found.
        :SYSTEM_DEVICE_NOT_FOUND, 15299,

        #=== Start of Vortex error codes 15300 - 15320 ===#
        # MessageId: ERROR_HASH_NOT_SUPPORTED
        # MessageText:
        # Hash generation for the specified hash version and hash type is not enabled on the server.
        :HASH_NOT_SUPPORTED, 15300,
        # MessageId: ERROR_HASH_NOT_PRESENT
        # MessageText:
        # The hash requested from the server is not available or no longer valid.
        :HASH_NOT_PRESENT, 15301,

        #=== Start of Com Task error codes 15501 - 15510 ===#
        # MessageId: ERROR_COM_TASK_STOP_PENDING
        # MessageText:
        # The task stop request cannot be completed immediately since
        # task needs more time to shutdown.
        :COM_TASK_STOP_PENDING, 15501,

        #=== Application Partition Codes #     15841-15860             #                             ################/ MessageId: ERROR_API_UNAVAILABLE
        # MessageText:
        # This API cannot be used in the context of the caller's application type.
        :API_UNAVAILABLE, 15841,
    )

   remove_const :Error if const_defined? :Error
    Error = enum :error, ErrorBuffer
  end
end