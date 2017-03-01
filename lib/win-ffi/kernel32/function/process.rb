require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/process/process_information_class'
require 'win-ffi/kernel32/enum/process/process_mitigation_policy'
require 'win-ffi/kernel32/enum/priority_class'
require 'win-ffi/kernel32/enum/process/quota_limits'
require 'win-ffi/kernel32/enum/process/job_object_info_class'

require 'win-ffi/core/struct/security_attributes'
require 'win-ffi/core/struct/guid'
require 'win-ffi/kernel32/struct/process/process_information'
require 'win-ffi/kernel32/struct/process/startup_info'
require 'win-ffi/kernel32/struct/process/startup_info_ex'
require 'win-ffi/kernel32/struct/time/file_time'
require 'win-ffi/kernel32/struct/processor/group_affinity'

module WinFFI
  # The Process module includes process related functions and constants,
  # including some tool help functions that relate to processes.
  module Kernel32
    extend LibBase

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


    begin

      # psapi, maybe
      # BOOL WINAPI EnumProcesses(
      #   _Out_  DWORD *pProcessIds,
      #   _In_   DWORD cb,
      #   _Out_  DWORD *pBytesReturned )
      attach_function 'EnumProcesses', [:pointer, :dword, :pointer], :bool
    rescue FFI::NotFoundError

    end

    if WINDOWS_VERSION >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681949(v=vs.85).aspx
      # BOOL WINAPI AssignProcessToJobObject(
      #   _In_  HANDLE hJob,
      #   _In_  HANDLE hProcess )
      attach_function 'AssignProcessToJobObject', [:handle, :handle], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682409(v=vs.85).aspx
      # HANDLE WINAPI CreateJobObject(
      #   _In_opt_ LPSECURITY_ATTRIBUTES lpJobAttributes,
      #   _In_opt_ LPCTSTR               lpName)
      encoded_function 'CreateJobObject', [SECURITY_ATTRIBUTES.ptr, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682425(v=vs.85).aspx
      # BOOL WINAPI CreateProcess(
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
      encoded_function 'CreateProcess',
                       [:string, :pointer, :pointer, :pointer, :bool, :dword, :pointer, :pointer, :pointer, :pointer],
                       :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682658(v=vs.85).aspx
      # VOID WINAPI ExitProcess( _In_  UINT uExitCode )
      attach_function 'ExitProcess', [:uint], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683151(v=vs.85).aspx
      # BOOL WINAPI FreeEnvironmentStrings( _In_  LPTCH lpszEnvironmentBlock )
      encoded_function 'FreeEnvironmentStrings', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683156(v=vs.85).aspx
      # LPTSTR WINAPI GetCommandLine(void)
      encoded_function 'GetCommandLine', [], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683179(v=vs.85).aspx
      # HANDLE WINAPI GetCurrentProcess(void)
      attach_function 'GetCurrentProcess', [], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683180(v=vs.85).aspx
      # DWORD WINAPI GetCurrentProcessId(void)
      attach_function 'GetCurrentProcessId', [], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683187(v=vs.85).aspx
      # LPTCH WINAPI GetEnvironmentStrings(void)
      encoded_function 'GetEnvironmentStrings',  [], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683188(v=vs.85).aspx
      # DWORD WINAPI GetEnvironmentVariable(
      #   _In_opt_   LPCTSTR lpName,
      #   _Out_opt_  LPTSTR lpBuffer,
      #   _In_       DWORD nSize )
      encoded_function 'GetEnvironmentVariable', [:string, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683189(v=vs.85).aspx
      # BOOL WINAPI GetExitCodeProcess(
      #   _In_   HANDLE hProcess,
      #   _Out_  LPDWORD lpExitCode )
      attach_function 'GetExitCodeProcess', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683211(v=vs.85).aspx
      # DWORD WINAPI GetPriorityClass( _In_  HANDLE hProcess )
      attach_function 'GetPriorityClass', [:handle], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683218(v=vs.85).aspx
      # BOOL WINAPI GetProcessIoCounters(
      #   _In_   HANDLE hProcess,
      #   _Out_  PIO_COUNTERS lpIoCounters )
      attach_function 'GetProcessIoCounters', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683220(v=vs.85).aspx
      # BOOL WINAPI GetProcessPriorityBoost(
      #   _In_   HANDLE hProcess,
      #   _Out_  PBOOL pDisablePriorityBoost )
      attach_function 'GetProcessPriorityBoost', [:handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683221(v=vs.85).aspx
      # BOOL WINAPI GetProcessShutdownParameters(
      #   _Out_  LPDWORD lpdwLevel,
      #   _Out_  LPDWORD lpdwFlags )
      attach_function 'GetProcessShutdownParameters', [:pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683223(v=vs.85).aspx
      # BOOL WINAPI GetProcessTimes(
      #   _In_   HANDLE hProcess,
      #   _Out_  LPFILETIME lpCreationTime,
      #   _Out_  LPFILETIME lpExitTime,
      #   _Out_  LPFILETIME lpKernelTime,
      #   _Out_  LPFILETIME lpUserTime )
      attach_function 'GetProcessTimes',
                      [:handle, FILETIME.ptr(:out),  FILETIME.ptr(:out),  FILETIME.ptr(:out),  FILETIME.ptr(:out)],
                      :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683224(v=vs.85).aspx
      # DWORD WINAPI GetProcessVersion( _In_  DWORD ProcessId )
      attach_function 'GetProcessVersion', [:dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683226(v=vs.85).aspx
      # BOOL WINAPI GetProcessWorkingSetSize(
      #   _In_   HANDLE hProcess,
      #   _Out_  PSIZE_T lpMinimumWorkingSetSize,
      #   _Out_  PSIZE_T lpMaximumWorkingSetSize )
      attach_function 'GetProcessWorkingSetSize', [:handle, :pointer, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683230(v=vs.85).aspx
      # VOID WINAPI GetStartupInfo( _Out_  LPSTARTUPINFO lpStartupInfo )
      encoded_function 'GetStartupInfo', [STARTUPINFO.ptr(:out)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684127(v=vs.85).aspx
      # BOOL WINAPI IsProcessInJob(
      #   _In_      HANDLE ProcessHandle,
      #   _In_opt_  HANDLE JobHandle,
      #   _Out_     PBOOL Result )
      attach_function 'IsProcessInJob', [:handle, :handle, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684312(v=vs.85).aspx
      # HANDLE WINAPI OpenJobObject(
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  BOOL bInheritHandles,
      #   _In_  LPCTSTR lpName )
      encoded_function 'OpenJobObject', [:dword, :bool, :string], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684320(v=vs.85).aspx
      # HANDLE WINAPI OpenProcess(
      #   _In_  DWORD dwDesiredAccess,
      #   _In_  BOOL bInheritHandle,
      #   _In_  DWORD dwProcessId )
      attach_function 'OpenProcess', [:dword, :bool, :dword], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684925(v=vs.85).aspx
      # BOOL WINAPI QueryInformationJobObject(
      #   _In_opt_   HANDLE hJob,
      #   _In_       JOBOBJECTINFOCLASS JobObjectInfoClass,
      #   _Out_      LPVOID lpJobObjectInfo,
      #   _In_       DWORD cbJobObjectInfoLength,
      #   _Out_opt_  LPDWORD lpReturnLength )
      attach_function 'QueryInformationJobObject', [:handle, JobObjectInfoClass, :pointer, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686206(v=vs.85).aspx
      # BOOL WINAPI SetEnvironmentVariable(
      #   _In_      LPCTSTR lpName,
      #   _In_opt_  LPCTSTR lpValue )
      encoded_function 'SetEnvironmentVariable', [:string, :string], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686216(v=vs.85).aspx
      # BOOL WINAPI SetInformationJobObject(
      #   _In_  HANDLE hJob,
      #   _In_  JOBOBJECTINFOCLASS JobObjectInfoClass,
      #   _In_  LPVOID lpJobObjectInfo,
      #   _In_  DWORD cbJobObjectInfoLength )
      attach_function 'SetInformationJobObject', [:handle, JobObjectInfoClass, :pointer, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686219(v=vs.85).aspx
      # BOOL WINAPI SetPriorityClass(
      #   _In_  HANDLE hProcess,
      #   _In_  DWORD dwPriorityClass )
      attach_function 'SetPriorityClass', [:handle, PriorityClass], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686223(v=vs.85).aspx
      # BOOL WINAPI SetProcessAffinityMask(
      #   _In_  HANDLE hProcess,
      #   _In_  DWORD_PTR dwProcessAffinityMask )
      attach_function 'SetProcessAffinityMask', [:handle, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686225(v=vs.85).aspx
      # BOOL WINAPI SetProcessPriorityBoost(
      #   _In_  HANDLE hProcess,
      #   _In_  BOOL DisablePriorityBoost )
      attach_function 'SetProcessPriorityBoost', [:handle, :bool], :bool

      SHUTDOWN_NORETRY = 0x00000001

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686227(v=vs.85).aspx
      # BOOL WINAPI SetProcessShutdownParameters(
      #   _In_  DWORD dwLevel,
      #   _In_  DWORD dwFlags )
      attach_function 'SetProcessShutdownParameters', [:dword, :dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686234(v=vs.85).aspx
      # BOOL WINAPI SetProcessWorkingSetSize(
      #   _In_  HANDLE hProcess,
      #   _In_  SIZE_T dwMinimumWorkingSetSize,
      #   _In_  SIZE_T dwMaximumWorkingSetSize )
      attach_function 'SetProcessWorkingSetSize', [:handle, :size_t, :size_t], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686709(v=vs.85).aspx
      # BOOL WINAPI TerminateJobObject(
      #   _In_  HANDLE hJob,
      #   _In_  UINT uExitCode )
      attach_function 'TerminateJobObject', [:handle, :uint], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686714(v=vs.85).aspx
      # BOOL WINAPI TerminateProcess(
      #   _In_  HANDLE hProcess,
      #   _In_  UINT uExitCode )
      attach_function 'TerminateProcess', [:ulong, :uint], :bool

      # This function is provided only for compatibility with 16-bit Windows. Applications should use the CreateProcess
      # function.
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687393(v=vs.85).aspx
      # UINT WINAPI WinExec(
      #   _In_ LPCSTR lpCmdLine,
      #   _In_ UINT   uCmdShow)
      attach_function 'WinExec', [:string, :uint], :uint

      if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682429(v=vs.85).aspx
        # BOOL WINAPI CreateProcessAsUser(
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
        encoded_function 'CreateProcessAsUser',
                         [:handle, :string, :string, SECURITY_ATTRIBUTES.ptr, SECURITY_ATTRIBUTES.ptr, :bool, :dword,
                          :pointer, :string, :pointer, Kernel32::PROCESS_INFORMATION.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683214(v=vs.85).aspx
        # BOOL WINAPI GetProcessHandleCount(
        #   _In_     HANDLE hProcess,
        #   _Inout_  PDWORD pdwHandleCount )
        attach_function 'GetProcessHandleCount', [:handle, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683215(v=vs.85).aspx
        # DWORD WINAPI GetProcessId( _In_  HANDLE Process )
        attach_function 'GetProcessId', [:handle], :ulong

        if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 2) || WINDOWS_VERSION >= :vista

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684139(v=vs.85).aspx
          # BOOL WINAPI IsWow64Process(
          #   _In_   HANDLE hProcess,
          #   _Out_  PBOOL Wow64Process )
          attach_function 'IsWow64Process', [:ulong, :pointer], :bool

          if WINDOWS_VERSION >= :vista

            PROCESS_NAME_NATIVE = 0x00000001

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683213(v=vs.85).aspx
            # BOOL WINAPI GetProcessAffinityMask(
            #   _In_   HANDLE hProcess,
            #   _Out_  PDWORD_PTR lpProcessAffinityMask,
            #   _Out_  PDWORD_PTR lpSystemAffinityMask)
            attach_function 'GetProcessAffinityMask', [:handle, :pointer, :pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683227(v=vs.85).aspx
            # BOOL WINAPI GetProcessWorkingSetSizeEx(
            #   _In_   HANDLE hProcess,
            #   _Out_  PSIZE_T lpMinimumWorkingSetSize,
            #   _Out_  PSIZE_T lpMaximumWorkingSetSize,
            #   _Out_  PDWORD Flags)
            attach_function 'GetProcessWorkingSetSizeEx', [:handle, :pointer, :pointer, :pointer], :ulong

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683148(v=vs.85).aspx
            # VOID WINAPI FlushProcessWriteBuffers(void)
            attach_function 'FlushProcessWriteBuffers', [], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684269(v=vs.85).aspx
            # BOOL WINAPI NeedCurrentDirectoryForExePath(_In_ LPCTSTR ExeName)
            encoded_function 'NeedCurrentDirectoryForExePath', [:string], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684919(v=vs.85).aspx
            # BOOL WINAPI QueryFullProcessImageName(
            #   _In_    HANDLE hProcess,
            #   _In_    DWORD  dwFlags,
            #   _Out_   LPTSTR lpExeName,
            #   _Inout_ PDWORD lpdwSize)
            encoded_function 'QueryFullProcessImageName', [:handle, :dword, :string, :dword], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684929(v=vs.85).aspx
            # BOOL WINAPI QueryProcessCycleTime(
            #   _In_  HANDLE   ProcessHandle,
            #   _Out_ PULONG64 CycleTime)
            attach_function 'QueryProcessCycleTime', [:handle, :pointer], :bool

            # BOOL WINAPI SetProcessWorkingSetSizeEx(
            #   _In_ HANDLE hProcess,
            #   _In_ SIZE_T dwMinimumWorkingSetSize,
            #   _In_ SIZE_T dwMaximumWorkingSetSize,
            #   _In_ DWORD  Flags)
            attach_function 'SetProcessWorkingSetSizeEx', [:handle, :size_t, :size_t, QuotaLimits], :bool

            if WINDOWS_VERSION >= 7 || (WINDOWS_VERSION == :vista && WINDOWS_VERSION.sp == 1)

              # https://msdn.microsoft.com/en-us/library/windows/desktop/bb309062(v=vs.85).aspx
              # BOOL WINAPI QueryProcessAffinityUpdateMode(
              #   _In_      HANDLE ProcessHandle,
              #   _Out_opt_ DWORD  lpdwFlags)
              attach_function 'QueryProcessAffinityUpdateMode', [:handle, :dword], :bool

              PROCESS_AFFINITY_ENABLE_AUTO_UPDATE = 0x00000001

              # https://msdn.microsoft.com/en-us/library/windows/desktop/bb309063(v=vs.85).aspx
              # BOOL WINAPI SetProcessAffinityUpdateMode(
              #   _In_ HANDLE ProcessHandle,
              #   _In_ DWORD  dwFlags)
              attach_function 'SetProcessAffinityUpdateMode', [:handle, :dword], :bool

              if WINDOWS_VERSION >= 7

                # BOOL SetThreadGroupAffinity(
                #   _In_            HANDLE          hThread,
                #   _In_      const GROUP_AFFINITY  *GroupAffinity,
                #   _Out_opt_       PGROUP_AFFINITY PreviousGroupAffinity)
                attach_function 'SetThreadGroupAffinity', [:handle, GROUP_AFFINITY.ptr(:in), GROUP_AFFINITY.ptr], :bool

                if WINDOWS_VERSION >= 8

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448381(v=vs.85).aspx
                  # BOOL WINAPI GetProcessInformation(
                  #   _In_ HANDLE                                     hProcess,
                  #   _In_ PROCESS_INFORMATION_CLASS                  ProcessInformationClass,
                  #   _Out_writes_bytes_(ProcessInformationSize) ProcessInformation,
                  #   _In_ DWORD                                      ProcessInformationSize)
                  attach_function 'GetProcessInformation', [:handle, ProcessInformationClass, :pointer, :dword], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh769085(v=vs.85).aspx
                  # BOOL WINAPI GetProcessMitigationPolicy(
                  #   _In_  HANDLE                    hProcess,
                  #   _In_  PROCESS_MITIGATION_POLICY MitigationPolicy,
                  #   _Out_ PVOID                     lpBuffer,
                  #   _In_  SIZE_T                    dwLength)
                  attach_function 'GetProcessMitigationPolicy', [:handle, ProcessMitigationPolicy, :pointer, :size_t], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448389(v=vs.85).aspx
                  # BOOL WINAPI SetProcessInformation(
                  #   _In_ HANDLE                                   hProcess,
                  #   _In_ PROCESS_INFORMATION_CLASS                ProcessInformationClass,
                  #   _In_reads_bytes_(ProcessInformationSize) ProcessInformation,
                  #   _In_ DWORD                                    ProcessInformationSize)
                  attach_function 'SetProcessInformation', [:handle, ProcessInformationClass, :pointer, :dword], :bool

                  # https://msdn.microsoft.com/en-us/library/windows/desktop/hh769088(v=vs.85).aspx
                  # BOOL WINAPI SetProcessMitigationPolicy(
                  #   _In_ PROCESS_MITIGATION_POLICY MitigationPolicy,
                  #   _In_ PVOID                     lpBuffer,
                  #   _In_ SIZE_T                    dwLength)
                  attach_function 'SetProcessMitigationPolicy', [ProcessMitigationPolicy, :pointer, :size_t], :bool

                  if WINDOWS_VERSION >= 8.1

                    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn386160(v=vs.85).aspx
                    # BOOL WINAPI IsProcessCritical(
                    #   _In_  HANDLE hProcess,
                    #   _Out_ PBOOL  Critical)
                    attach_function 'IsProcessCritical', [:handle, :pointer], :bool

                    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn893591(v=vs.85).aspx
                    # BOOL WINAPI QueryProtectedPolicy(
                    #   _In_  LPCGUID    PolicyGuid,
                    #   _Out_ PULONG_PTR PolicyValue)
                    attach_function 'QueryProtectedPolicy', [GUID.ptr(:in), :pointer], :bool

                    # https://msdn.microsoft.com/en-us/library/windows/desktop/dn893592(v=vs.85).aspx
                    # BOOL WINAPI SetProtectedPolicy(
                    #   _In_  LPCGUID    PolicyGuid,
                    #   _In_  ULONG_PTR  PolicyValue,
                    #   _Out_ PULONG_PTR OldPolicyValue)
                    attach_function 'SetProtectedPolicy', [GUID.ptr(:in), :pointer, :pointer], :bool

                    if WINDOWS_VERSION >= 10

                      # https://msdn.microsoft.com/en-us/library/windows/desktop/mt280121(v=vs.85).aspx
                      # VOID WINAPI FreeMemoryJobObject(_In_ VOID *Buffer)
                      attach_function 'FreeMemoryJobObject', [], :void

                      # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186424(v=vs.85).aspx
                      # BOOL WINAPI GetProcessDefaultCpuSets(
                      #   _In_      HANDLE Process,
                      #   _Out_opt_ PULONG CpuSetIds,
                      #   _In_      ULONG  CpuSetIdCount,
                      #   _Out_     PULONG RequiredIdCount)
                      attach_function 'GetProcessDefaultCpuSets', [:handle, :pointer, :ulong, :pointer], :bool

                      # https://msdn.microsoft.com/en-us/library/windows/desktop/mt280127(v=vs.85).aspx
                      # DWORD WINAPI QueryIoRateControlInformationJobObject(
                      #   _In_opt_ HANDLE                                hJob,
                      #   _In_opt_ PCWSTR                                VolumeName,
                      #   _Out_    JOBOBJECT_IO_RATE_CONTROL_INFORMATION **InfoBlocks,
                      #   _Out_    ULONG                                 *InfoBlockCount)
                      attach_function 'QueryIoRateControlInformationJobObject', [:handle, :string, :pointer, :ulong], :dword

                      # https://msdn.microsoft.com/en-us/library/windows/desktop/mt280128(v=vs.85).aspx
                      # DWORD WINAPI SetIoRateControlInformationJobObject(
                      #   _In_ HANDLE                                hJob,
                      #   _In_ JOBOBJECT_IO_RATE_CONTROL_INFORMATION *IoRateControlInfo)
                      attach_function 'SetIoRateControlInformationJobObject', [:handle, JobObjectInfoClass], :dword

                      # https://msdn.microsoft.com/en-us/library/windows/desktop/mt186427(v=vs.85).aspx
                      # BOOL WINAPI SetProcessDefaultCpuSets(
                      #   _In_     HANDLE Process,
                      #   _In_opt_ ULONG  CpuSetIds,
                      #   _In_     ULONG  CpuSetIdCound)
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