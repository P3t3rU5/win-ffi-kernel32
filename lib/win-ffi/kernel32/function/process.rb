require 'win-ffi/core/struct/security_attributes'
require 'win-ffi/core/struct/guid'

require_relative '../enum/process/information_class'
require_relative '../enum/process/mitigation_policy'
require_relative '../enum/priority_class'
require_relative '../enum/process/quota_limits'
require_relative '../enum/process/job_object_info_class'

require_relative '../struct/process/process_information'
require_relative '../struct/process/startup_info'
require_relative '../struct/process/startup_info_ex'
require_relative '../struct/time/file_time'
require_relative '../struct/processor/group_affinity'

module WinFFI
  # The Process module includes process related functions and constants,
  # including some tool help functions that relate to processes.
  module Kernel32

    # Process creation flags

    DEBUG_ONLY_THIS_PROCESS          = 0x00000002
    DEBUG_PROCESS                    = 0x00000001
    DETACHED_PROCESS                 = 0x00000008

    # Job Object Classes

    JOB_OBJECT_BASIC_LIMIT_INFORMATION               =  2
    JOB_OBJECT_BASIC_UI_RESTRICTIONS                 =  4
    JOB_OBJECT_SECURITY_LIMIT_INFORMATION            =  5
    JOB_OBJECT_END_OF_JOB_TIME_INFORMATION           =  6
    JOB_OBJECT_ASSOCIATE_COMPLETION_PORT_INFORMATION =  7
    JOB_OBJECT_EXTENDED_LIMIT_INFORMATION            =  9
    JOB_OBJECT_GROUP_INFORMATION                     = 11

    # https://docs.microsoft.com/en-us/windows/desktop/api/psapi/nf-psapi-enumprocesses
    # psapi, maybe
    # BOOL EnumProcesses(
    #   _Out_  DWORD *pProcessIds,
    #   _In_   DWORD cb,
    #   _Out_  DWORD *pBytesReturned )
    def self.EnumProcesses(pProcessIds, cb, pBytesReturned) end
    attach_function 'EnumProcesses', [:pointer, :dword, :pointer], :bool

    if WINDOWS_VERSION >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681949
      # BOOL AssignProcessToJobObject( _In_  HANDLE hJob, _In_  HANDLE hProcess )
      def self.AssignProcessToJobObject(hJob, hProcess) end
      attach_function 'AssignProcessToJobObject', [:handle, :handle], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createjobobjecta
      # HANDLE CreateJobObject( _In_opt_ LPSECURITY_ATTRIBUTES lpJobAttributes, _In_opt_ LPCTSTR lpName)
      def self.CreateJobObject(lpJobAttributes, lpName) end
      encoded_function 'CreateJobObject', [SECURITY_ATTRIBUTES.ptr, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa
      # BOOL CreateProcess(
      #   _In_opt_     LPCTSTR lpApplicationName,
      #   _Inout_opt_  LPTSTR lpCommandLine,
      #   _In_opt_     LPSECURITY_ATTRIBUTES lpProcessAttributes,
      #   _In_opt_     LPSECURITY_ATTRIBUTES lpThreadAttributes,
      #   _In_         BOOL bInheritHandles,
      #   _In_         DWORD dwCreationFlags,
      #   _In_opt_     LPVOID lpEnvironment,
      #   _In_opt_     LPCTSTR lpCurrentDirectory,
      #   _In_         LPSTARTUPINFO lpStartupInfo,
      #   _Out_        LPPROCESS_INFORMATION lpProcessInformation )
      def self.CreateProcess(lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes, bInheritHandles,
          dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation) end
      encoded_function 'CreateProcess',
                       [:string, :pointer, :pointer, :pointer, :bool, :dword, :pointer, :pointer, :pointer, :pointer],
                       :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess
      # VOID ExitProcess( _In_  UINT uExitCode )
      def self.ExitProcess(uExitCode) end
      attach_function 'ExitProcess', [:uint], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683151
      # BOOL FreeEnvironmentStrings( _In_  LPTCH lpszEnvironmentBlock )
      def self.FreeEnvironmentStrings(lpszEnvironmentBlock) end
      encoded_function 'FreeEnvironmentStrings', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683156
      # LPTSTR GetCommandLine(void)
      def self.GetCommandLine; end
      encoded_function 'GetCommandLine', [], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess
      # HANDLE GetCurrentProcess(void)
      def self.GetCurrentProcess; end
      attach_function 'GetCurrentProcess', [], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid
      # DWORD GetCurrentProcessId(void)
      def self.GetCurrentProcessId; end
      attach_function 'GetCurrentProcessId', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683187
      # LPTCH GetEnvironmentStrings(void)
      def self.GetEnvironmentStrings; end
      encoded_function 'GetEnvironmentStrings',  [], :pointer

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getenvironmentvariable
      # DWORD GetEnvironmentVariable(_In_opt_ LPCTSTR lpName, _Out_opt_ LPTSTR lpBuffer, _In_ DWORD nSize )
      def self.GetEnvironmentVariable(lpName, lpBuffer, nSize) end
      encoded_function 'GetEnvironmentVariable', [:string, :string, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess
      # BOOL GetExitCodeProcess( _In_   HANDLE hProcess, _Out_  LPDWORD lpExitCode )
      def self.GetExitCodeProcess(hProcess, lpExitCode) end
      attach_function 'GetExitCodeProcess', [:handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getpriorityclass
      # DWORD GetPriorityClass( _In_  HANDLE hProcess )
      def self.GetPriorityClass(hProcess) end
      attach_function 'GetPriorityClass', [:handle], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprocessiocounters
      # BOOL GetProcessIoCounters( _In_   HANDLE hProcess, _Out_  PIO_COUNTERS lpIoCounters )
      def self.GetProcessIoCounters(hProcess, lpIoCounters) end
      attach_function 'GetProcessIoCounters', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683220
      # BOOL GetProcessPriorityBoost( _In_   HANDLE hProcess, _Out_  PBOOL pDisablePriorityBoost )
      def self.GetProcessPriorityBoost(hProcess, pDisablePriorityBoost) end
      attach_function 'GetProcessPriorityBoost', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683221
      # BOOL GetProcessShutdownParameters( _Out_  LPDWORD lpdwLevel, _Out_  LPDWORD lpdwFlags )
      def self.GetProcessShutdownParameters(lpdwLevel, lpdwFlags) end
      attach_function 'GetProcessShutdownParameters', [:pointer, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocesstimes
      # BOOL GetProcessTimes(
      #   _In_   HANDLE hProcess,
      #   _Out_  LPFILETIME lpCreationTime,
      #   _Out_  LPFILETIME lpExitTime,
      #   _Out_  LPFILETIME lpKernelTime,
      #   _Out_  LPFILETIME lpUserTime )
      def self.GetProcessTimes(hProcess, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime) end
      attach_function 'GetProcessTimes',
                      [:handle, FILETIME.ptr(:out),  FILETIME.ptr(:out),  FILETIME.ptr(:out),  FILETIME.ptr(:out)],
                      :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessversion
      # DWORD GetProcessVersion( _In_  DWORD ProcessId )
      def self.GetProcessVersion(processId) end
      attach_function 'GetProcessVersion', [:dword], :dword

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprocessworkingsetsize
      # BOOL GetProcessWorkingSetSize(
      #   _In_   HANDLE hProcess,
      #   _Out_  PSIZE_T lpMinimumWorkingSetSize,
      #   _Out_  PSIZE_T lpMaximumWorkingSetSize )
      def self.GetProcessWorkingSetSize(hProcess, lpMinimumWorkingSetSize, lpMaximumWorkingSetSize) end
      attach_function 'GetProcessWorkingSetSize', [:handle, :pointer, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getstartupinfoa
      # VOID GetStartupInfo( _Out_  LPSTARTUPINFO lpStartupInfo )
      def self.GetStartupInfo(lpStartupInfo) end
      encoded_function 'GetStartupInfo', [STARTUPINFO.ptr(:out)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684127
      # BOOL IsProcessInJob( _In_      HANDLE ProcessHandle, _In_opt_  HANDLE JobHandle, _Out_     PBOOL Result )
      def self.IsProcessInJob(processHandle, jobHandle, result) end
      attach_function 'IsProcessInJob', [:handle, :handle, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-openjobobjecta
      # HANDLE OpenJobObject( _In_  DWORD dwDesiredAccess, _In_  BOOL bInheritHandles, _In_  LPCTSTR lpName )
      def self.OpenJobObject(dwDesiredAccess, bInheritHandles, lpName) end
      encoded_function 'OpenJobObject', [:dword, :bool, :string], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess
      # HANDLE OpenProcess( _In_  DWORD dwDesiredAccess, _In_  BOOL bInheritHandle, _In_  DWORD dwProcessId )
      def self.OpenProcess(dwDesiredAccess, bInheritHandle, dwProcessId) end
      attach_function 'OpenProcess', [:dword, :bool, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684925
      # BOOL QueryInformationJobObject(
      #   _In_opt_   HANDLE hJob,
      #   _In_       JOBOBJECTINFOCLASS JobObjectInfoClass,
      #   _Out_      LPVOID lpJobObjectInfo,
      #   _In_       DWORD cbJobObjectInfoLength,
      #   _Out_opt_  LPDWORD lpReturnLength )
      def self.QueryInformationJobObject(hJob, jobObjectInfoClass, lpJobObjectInfo, cbJobObjectInfoLength,
          lpReturnLength) end
      attach_function 'QueryInformationJobObject', [:handle, JobObjectInfoClass, :pointer, :dword, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setenvironmentvariable
      # BOOL SetEnvironmentVariable( _In_      LPCTSTR lpName, _In_opt_  LPCTSTR lpValue )
      def self.SetEnvironmentVariable(lpName, lpValue) end
      encoded_function 'SetEnvironmentVariable', [:string, :string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686216
      #   _In_  HANDLE hJob,
      #   _In_  JOBOBJECTINFOCLASS JobObjectInfoClass,
      #   _In_  LPVOID lpJobObjectInfo,
      #   _In_  DWORD cbJobObjectInfoLength )
      def self.SetInformationJobObject(hJob, jobObjectInfoClass, lpJobObjectInfo, cbJobObjectInfoLength) end# BOOL SetInformationJobObject(
      attach_function 'SetInformationJobObject', [:handle, JobObjectInfoClass, :pointer, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setpriorityclass
      # BOOL SetPriorityClass( _In_  HANDLE hProcess, _In_  DWORD dwPriorityClass )
      def self.SetPriorityClass(hProcess, dwPriorityClass) end
      attach_function 'SetPriorityClass', [:handle, PriorityClass], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setprocessaffinitymask
      # BOOL SetProcessAffinityMask( _In_  HANDLE hProcess, _In_  DWORD_PTR dwProcessAffinityMask )
      def self.SetProcessAffinityMask(hProcess, dwProcessAffinityMask) end
      attach_function 'SetProcessAffinityMask', [:handle, :dword_ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686225
      # BOOL SetProcessPriorityBoost( _In_  HANDLE hProcess, _In_  BOOL DisablePriorityBoost )
      def self.SetProcessPriorityBoost(hProcess, disablePriorityBoost) end
      attach_function 'SetProcessPriorityBoost', [:handle, :bool], :bool

      SHUTDOWN_NORETRY = 0x00000001

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessshutdownparameters
      # BOOL SetProcessShutdownParameters( _In_  DWORD dwLevel, _In_  DWORD dwFlags )
      def self.SetProcessShutdownParameters(dwLevel, dwFlags) end
      attach_function 'SetProcessShutdownParameters', [:dword, :dword], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-setprocessworkingsetsize
      # BOOL SetProcessWorkingSetSize(
      #   _In_  HANDLE hProcess,
      #   _In_  SIZE_T dwMinimumWorkingSetSize,
      #   _In_  SIZE_T dwMaximumWorkingSetSize )
      def self.SetProcessWorkingSetSize(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize) end
      attach_function 'SetProcessWorkingSetSize', [:handle, :size_t, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686709
      # BOOL TerminateJobObject( _In_  HANDLE hJob, _In_  UINT uExitCode )
      def self.TerminateJobObject(hJob, uExitCode) end
      attach_function 'TerminateJobObject', [:handle, :uint], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminateprocess
      # BOOL TerminateProcess( _In_  HANDLE hProcess, _In_  UINT uExitCode )
      def self.TerminateProcess(hProcess, uExitCode) end
      attach_function 'TerminateProcess', [:ulong, :uint], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-winexec
      # This function is provided only for compatibility with 16-bit Windows. Applications should use the CreateProcess
      # function.
      # UINT WinExec( _In_ LPCSTR lpCmdLine, _In_ UINT   uCmdShow)
      def self.WinExec(lpCmdLine, uCmdShow) end
      attach_function 'WinExec', [:string, :uint], :uint

      if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682429
        # BOOL CreateProcessAsUser(
        #   _In_opt_    HANDLE                hToken,
        #   _In_opt_    LPCTSTR               lpApplicationName,
        #   _Inout_opt_ LPTSTR                lpCommandLine,
        #   _In_opt_    LPSECURITY_ATTRIBUTES lpProcessAttributes,
        #   _In_opt_    LPSECURITY_ATTRIBUTES lpThreadAttributes,
        #   _In_        BOOL                  bInheritHandles,
        #   _In_        DWORD                 dwCreationFlags,
        #   _In_opt_    LPVOID                lpEnvironment,
        #   _In_opt_    LPCTSTR               lpCurrentDirectory,
        #   _In_        LPSTARTUPINFO         lpStartupInfo,
        #   _Out_       LPPROCESS_INFORMATION lpProcessInformation)
        def self.CreateProcessAsUser(hToken, lpApplicationName, lpCommandLine, lpProcessAttributes, lpThreadAttributes,
            bInheritHandles, dwCreationFlags, lpEnvironment, lpCurrentDirectory, lpStartupInfo, lpProcessInformation)
        end
        encoded_function 'CreateProcessAsUser',
                         [:handle, :string, :string, SECURITY_ATTRIBUTES.ptr, SECURITY_ATTRIBUTES.ptr, :bool, :dword,
                          :pointer, :string, :pointer, PROCESS_INFORMATION.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocesshandlecount
        # BOOL GetProcessHandleCount( _In_     HANDLE hProcess, _Inout_  PDWORD pdwHandleCount )
        def self.GetProcessHandleCount(hProcess, pdwHandleCount) end
        attach_function 'GetProcessHandleCount', [:handle, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessid
        # DWORD GetProcessId( _In_  HANDLE Process )
        def self.GetProcessId(process) end
        attach_function 'GetProcessId', [:handle], :ulong

        if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 2) || WINDOWS_VERSION >= :vista
          # https://docs.microsoft.com/en-us/windows/desktop/api/wow64apiset/nf-wow64apiset-iswow64process
          # BOOL IsWow64Process( _In_   HANDLE hProcess, _Out_  PBOOL Wow64Process )
          def self.IsWow64Process(hProcess, wow64Process) end
          attach_function 'IsWow64Process', [:ulong, :pointer], :bool

          if WINDOWS_VERSION >= :vista
            PROCESS_NAME_NATIVE = 0x00000001

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getprocessaffinitymask
            # BOOL GetProcessAffinityMask(
            #   _In_   HANDLE hProcess,
            #   _Out_  PDWORD_PTR lpProcessAffinityMask,
            #   _Out_  PDWORD_PTR lpSystemAffinityMask)
            def self.GetProcessAffinityMask(hProcess, lpProcessAffinityMask, lpSystemAffinityMask) end
            attach_function 'GetProcessAffinityMask', [:handle, :pointer, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-getprocessworkingsetsizeex
            # BOOL GetProcessWorkingSetSizeEx(
            #   _In_   HANDLE hProcess,
            #   _Out_  PSIZE_T lpMinimumWorkingSetSize,
            #   _Out_  PSIZE_T lpMaximumWorkingSetSize,
            #   _Out_  PDWORD Flags)
            def self.GetProcessWorkingSetSizeEx(hProcess,  lpMinimumWorkingSetSize, lpMaximumWorkingSetSize, flags) end
            attach_function 'GetProcessWorkingSetSizeEx', [:handle, :pointer, :pointer, :pointer], :ulong

            # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-flushprocesswritebuffers
            # VOID FlushProcessWriteBuffers(void)
            def self.FlushProcessWriteBuffers; end
            attach_function 'FlushProcessWriteBuffers', [], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684269
            # BOOL NeedCurrentDirectoryForExePath(_In_ LPCTSTR ExeName)
            def self.NeedCurrentDirectoryForExePath(exeName) end
            encoded_function 'NeedCurrentDirectoryForExePath', [:string], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-queryfullprocessimagenamea
            # BOOL QueryFullProcessImageName(
            #   _In_    HANDLE hProcess,
            #   _In_    DWORD  dwFlags,
            #   _Out_   LPTSTR lpExeName,
            #   _Inout_ PDWORD lpdwSize)
            def self.QueryFullProcessImageName(hProcess, dwFlags, lpExeName, lpdwSize) end
            encoded_function 'QueryFullProcessImageName', [:handle, :dword, :string, :dword], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryprocesscycletime
            # BOOL QueryProcessCycleTime( _In_  HANDLE   ProcessHandle, _Out_ PULONG64 CycleTime)
            def self.QueryProcessCycleTime(processHandle, cycleTime) end
            attach_function 'QueryProcessCycleTime', [:handle, :pointer], :bool

            # https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-setprocessworkingsetsizeex
            # BOOL SetProcessWorkingSetSizeEx(
            #   _In_ HANDLE hProcess,
            #   _In_ SIZE_T dwMinimumWorkingSetSize,
            #   _In_ SIZE_T dwMaximumWorkingSetSize,
            #   _In_ DWORD  Flags)
            def self.SetProcessWorkingSetSizeEx(hProcess, dwMinimumWorkingSetSize, dwMaximumWorkingSetSize, flags) end
            attach_function 'SetProcessWorkingSetSizeEx', [:handle, :size_t, :size_t, QuotaLimits], :bool

            if WINDOWS_VERSION >= 7 || (WINDOWS_VERSION == :vista && WINDOWS_VERSION.sp == 1)
              # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-queryprocessaffinityupdatemode
              # BOOL QueryProcessAffinityUpdateMode( _In_      HANDLE ProcessHandle, _Out_opt_ DWORD  lpdwFlags)
              def self.QueryProcessAffinityUpdateMode(processHandle, lpdwFlags) end
              attach_function 'QueryProcessAffinityUpdateMode', [:handle, :dword], :bool

              PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 0x00000001

              # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessaffinityupdatemode
              # BOOL SetProcessAffinityUpdateMode( _In_ HANDLE ProcessHandle, _In_ DWORD  dwFlags)
              def self.SetProcessAffinityUpdateMode(processHandle, dwFlags) end
              attach_function 'SetProcessAffinityUpdateMode', [:handle, :dword], :bool

              if WINDOWS_VERSION >= 7
                # https://msdn.microsoft.com/en-us/library/windows/desktop/dd405516(v=vs.85).aspx
                # BOOL SetThreadGroupAffinity(
                #   _In_            HANDLE          hThread,
                #   _In_      const GROUP_AFFINITY  *GroupAffinity,
                #   _Out_opt_       PGROUP_AFFINITY PreviousGroupAffinity)
                def self.SetThreadGroupAffinity(hThread, groupAffinity, previousGroupAffinity) end
                attach_function 'SetThreadGroupAffinity', [:handle, GROUP_AFFINITY.ptr(:in), GROUP_AFFINITY.ptr], :bool

                if WINDOWS_VERSION >= 8
                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448381
                  # BOOL GetProcessInformation(
                  #   _In_ HANDLE                                     hProcess,
                  #   _In_ PROCESS_INFORMATION_CLASS                  ProcessInformationClass,
                  #   _Out_writes_bytes_(ProcessInformationSize) ProcessInformation,
                  #   _In_ DWORD                                      ProcessInformationSize)
                  def self.GetProcessInformation(hProcess, processInformationClass, processInformation,
                      processInformationSize) end
                  attach_function 'GetProcessInformation', [:handle, ProcessInformationClass, :pointer, :dword], :bool

                  # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy
                  # BOOL GetProcessMitigationPolicy(
                  #   _In_  HANDLE                    hProcess,
                  #   _In_  PROCESS_MITIGATION_POLICY MitigationPolicy,
                  #   _Out_ PVOID                     lpBuffer,
                  #   _In_  SIZE_T                    dwLength)
                  def self.GetProcessMitigationPolicy(hProcess, mitigationPolicy, lpBuffer, dwLength) end
                  attach_function 'GetProcessMitigationPolicy', [:handle, ProcessMitigationPolicy, :pointer, :size_t], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448389
                  # BOOL SetProcessInformation(
                  #   _In_ HANDLE                                   hProcess,
                  #   _In_ PROCESS_INFORMATION_CLASS                ProcessInformationClass,
                  #   _In_reads_bytes_(ProcessInformationSize) ProcessInformation,
                  #   _In_ DWORD                                    ProcessInformationSize)
                  def self.SetProcessInformation(hProcess, processInformationClass, processInformation,
                      processInformationSize) end
                  attach_function 'SetProcessInformation', [:handle, ProcessInformationClass, :pointer, :dword], :bool

                  # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy
                  # BOOL SetProcessMitigationPolicy(
                  #   _In_ PROCESS_MITIGATION_POLICY MitigationPolicy,
                  #   _In_ PVOID                     lpBuffer,
                  #   _In_ SIZE_T                    dwLength)
                  def self.SetProcessMitigationPolicy(mitigationPolicy, lpBuffer, dwLength) end
                  attach_function 'SetProcessMitigationPolicy', [ProcessMitigationPolicy, :pointer, :size_t], :bool

                  if WINDOWS_VERSION >= 8.1
                    # https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-isprocesscritical
                    # BOOL IsProcessCritical( _In_  HANDLE hProcess, _Out_ PBOOL  Critical)
                    def self.IsProcessCritical(hProcess, critical) end
                    attach_function 'IsProcessCritical', [:handle, :pointer], :bool

                    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn893591
                    # BOOL QueryProtectedPolicy( _In_  LPCGUID    PolicyGuid, _Out_ PULONG_PTR PolicyValue)
                    def self.QueryProtectedPolicy(policyGuid, policyValue) end
                    attach_function 'QueryProtectedPolicy', [GUID.ptr(:in), :pointer], :bool

                    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn893592
                    # BOOL SetProtectedPolicy(
                    #   _In_  LPCGUID    PolicyGuid,
                    #   _In_  ULONG_PTR  PolicyValue,
                    #   _Out_ PULONG_PTR OldPolicyValue)
                    def self.SetProtectedPolicy(policyGuid, policyValue, oldPolicyValue) end
                    attach_function 'SetProtectedPolicy', [GUID.ptr(:in), :ulong_ptr, :pointer], :bool

                    if WINDOWS_VERSION >= 10
                      # https://docs.microsoft.com/en-us/windows/desktop/api/jobapi2/nf-jobapi2-freememoryjobobject
                      # VOID FreeMemoryJobObject(_In_ VOID *Buffer)
                      def self.FreeMemoryJobObject; end
                      attach_function 'FreeMemoryJobObject', [], :void

                      # https://docs.microsoft.com/en-us/windows/desktop/ProcThread/getprocessdefaultcpusets
                      # BOOL GetProcessDefaultCpuSets(
                      #   _In_      HANDLE Process,
                      #   _Out_opt_ PULONG CpuSetIds,
                      #   _In_      ULONG  CpuSetIdCount,
                      #   _Out_     PULONG RequiredIdCount)
                      def self.GetProcessDefaultCpuSets(process, cpuSetIds, cpuSetIdCount, requiredIdCount) end
                      attach_function 'GetProcessDefaultCpuSets', [:handle, :pointer, :ulong, :pointer], :bool

                      # https://docs.microsoft.com/en-us/windows/desktop/api/jobapi2/nf-jobapi2-queryioratecontrolinformationjobobject
                      # DWORD QueryIoRateControlInformationJobObject(
                      #   _In_opt_ HANDLE                                hJob,
                      #   _In_opt_ PCWSTR                                VolumeName,
                      #   _Out_    JOBOBJECT_IO_RATE_CONTROL_INFORMATION **InfoBlocks,
                      #   _Out_    ULONG                                 *InfoBlockCount)
                      def self.QueryIoRateControlInformationJobObject(hJob, volumeName, infoBlocks, infoBlockCount) end
                      attach_function 'QueryIoRateControlInformationJobObject', [:handle, :string, :pointer, :ulong], :dword

                      # https://docs.microsoft.com/en-us/windows/desktop/api/jobapi2/nf-jobapi2-setioratecontrolinformationjobobject
                      # DWORD SetIoRateControlInformationJobObject(
                      #   _In_ HANDLE                                hJob,
                      #   _In_ JOBOBJECT_IO_RATE_CONTROL_INFORMATION *IoRateControlInfo)
                      def self.SetIoRateControlInformationJobObject(hJob, ioRateControlInfo) end
                      attach_function 'SetIoRateControlInformationJobObject', [:handle, JobObjectInfoClass], :dword

                      # https://docs.microsoft.com/en-us/windows/desktop/ProcThread/setprocessdefaultcpusets
                      # BOOL SetProcessDefaultCpuSets(
                      #   _In_     HANDLE Process,
                      #   _In_opt_ ULONG  CpuSetIds,
                      #   _In_     ULONG  CpuSetIdCound)
                      def self.SetProcessDefaultCpuSets(process, cpuSetIds, cpuSetIdCound) end
                      attach_function 'SetProcessDefaultCpuSets', [:handle, :ulong, :ulong], :bool
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end