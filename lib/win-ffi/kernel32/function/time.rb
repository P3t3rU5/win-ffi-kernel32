require 'win-ffi/kernel32'

require 'win-ffi/kernel32/enum/time/time_zone_id'

require 'win-ffi/kernel32/struct/time/file_time'
require 'win-ffi/kernel32/struct/time/system_time'
require 'win-ffi/kernel32/struct/time/dynamic_time_zone_information'
require 'win-ffi/kernel32/struct/time/time_zone_information'

module WinFFI
  module Kernel32

    # Routines to convert back and forth between system time and file time
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms725473(v=vs.85).aspx
    # BOOL WINAPI DosDateTimeToFileTime(
    #   _In_   WORD wFatDate,
    #   _In_   WORD wFatTime,
    #   _Out_  LPFILETIME lpFileTime )
    attach_function 'DosDateTimeToFileTime', [:word, :word, FILETIME.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724274(v=vs.85).aspx
    # BOOL WINAPI FileTimeToDosDateTime(
    #   _In_   const FILETIME *lpFileTime,
    #   _Out_  LPWORD lpFatDate,
    #   _Out_  LPWORD lpFatTime )
    attach_function 'FileTimeToDosDateTime', [FILETIME.ptr(:in), :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724338(v=vs.85).aspx
    # void WINAPI GetLocalTime( _Out_  LPSYSTEMTIME lpSystemTime )
    attach_function 'GetLocalTime', [SYSTEMTIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724390(v=vs.85).aspx
    # void WINAPI GetSystemTime( _Out_  LPSYSTEMTIME lpSystemTime )
    attach_function 'GetSystemTime', [SYSTEMTIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724394(v=vs.85).aspx
    # BOOL WINAPI GetSystemTimeAdjustment(
    #   _Out_  PDWORD lpTimeAdjustment,
    #   _Out_  PDWORD lpTimeIncrement,
    #   _Out_  PBOOL lpTimeAdjustmentDisabled )
    attach_function 'GetSystemTimeAdjustment', [:pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724397(v=vs.85).aspx
    # void WINAPI GetSystemTimeAsFileTime( _Out_  LPFILETIME lpSystemTimeAsFileTime )
    attach_function 'GetSystemTimeAsFileTime', [FILETIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724408(v=vs.85).aspx
    # DWORD WINAPI GetTickCount(void)
    attach_function 'GetTickCount', [], :ulong

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724421(v=vs.85).aspx
    # DWORD WINAPI GetTimeZoneInformation( _Out_  LPTIME_ZONE_INFORMATION lpTimeZoneInformation )
    attach_function 'GetTimeZoneInformation', [TIME_ZONE_INFORMATION.ptr(:out)], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724936(v=vs.85).aspx
    # BOOL WINAPI SetLocalTime( _In_  const SYSTEMTIME *lpSystemTime )
    attach_function 'SetLocalTime', [SYSTEMTIME.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724942(v=vs.85).aspx
    # BOOL WINAPI SetSystemTime( _In_  const SYSTEMTIME *lpSystemTime )
    attach_function 'SetSystemTime', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724944(v=vs.85).aspx
    # BOOL WINAPI SetTimeZoneInformation( _In_  const TIME_ZONE_INFORMATION *lpTimeZoneInformation )
    attach_function 'SetTimeZoneInformation', [TIME_ZONE_INFORMATION.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724943(v=vs.85).aspx
    # BOOL WINAPI SetSystemTimeAdjustment(
    #   _In_  DWORD dwTimeAdjustment,
    #   _In_  BOOL bTimeAdjustmentDisabled )
    attach_function 'SetSystemTimeAdjustment', [:dword, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724948(v=vs.85).aspx
    # BOOL WINAPI SystemTimeToFileTime(
    #   _In_   const SYSTEMTIME *lpSystemTime,
    #   _Out_  LPFILETIME lpFileTime )
    attach_function 'SystemTimeToFileTime', [SYSTEMTIME.ptr(:in), FILETIME.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724949(v=vs.85).aspx
    # BOOL WINAPI SystemTimeToTzSpecificLocalTime(
    #   _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZone,
    #   _In_      LPSYSTEMTIME lpUniversalTime,
    #   _Out_     LPSYSTEMTIME lpLocalTime )
    attach_function 'SystemTimeToTzSpecificLocalTime', [TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

    if WINDOWS_VERSION >= :xp

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724214(v=vs.85).aspx
      # LONG WINAPI CompareFileTime(
      #   _In_  const FILETIME *lpFileTime1,
      #   _In_  const FILETIME *lpFileTime2 )
      attach_function 'CompareFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:in)], :long

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724277(v=vs.85).aspx
      # BOOL WINAPI FileTimeToLocalFileTime(
      #   _In_   const FILETIME *lpFileTime,
      #   _Out_  LPFILETIME lpLocalFileTime )
      attach_function 'FileTimeToLocalFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724280(v=vs.85).aspx
      # BOOL WINAPI FileTimeToSystemTime(
      #   _In_   const FILETIME *lpFileTime,
      #   _Out_  LPSYSTEMTIME lpSystemTime )
      attach_function 'FileTimeToSystemTime', [FILETIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724320(v=vs.85).aspx
      # BOOL WINAPI GetFileTime(
      #   _In_       HANDLE hFile,
      #   _Out_opt_  LPFILETIME lpCreationTime,
      #   _Out_opt_  LPFILETIME lpLastAccessTime,
      #   _Out_opt_  LPFILETIME lpLastWriteTime )
      attach_function 'GetFileTime', [:handle, FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724490(v=vs.85).aspx
      # BOOL WINAPI LocalFileTimeToFileTime(
      #   _In_   const FILETIME *lpLocalFileTime,
      #   _Out_  LPFILETIME lpFileTime )
      attach_function 'LocalFileTimeToFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms725485(v=vs.85).aspx
      # BOOL WINAPI TzSpecificLocalTimeToSystemTime(
      #   _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZoneInformation,
      #   _In_      LPSYSTEMTIME lpLocalTime,
      #   _Out_     LPSYSTEMTIME lpUniversalTime )
      attach_function 'TzSpecificLocalTimeToSystemTime',
                      [TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724933(v=vs.85).aspx
      # BOOL WINAPI SetFileTime(
      #   _In_      HANDLE hFile,
      #   _In_opt_  const FILETIME *lpCreationTime,
      #   _In_opt_  const FILETIME *lpLastAccessTime,
      #   _In_opt_  const FILETIME *lpLastWriteTime )
      attach_function 'SetFileTime', [:handle, FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

      if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724400(v=vs.85).aspx
        # BOOL WINAPI GetSystemTimes(
        #   _Out_opt_  LPFILETIME lpIdleTime,
        #   _Out_opt_  LPFILETIME lpKernelTime,
        #   _Out_opt_  LPFILETIME lpUserTime )
        attach_function 'GetSystemTimes', [FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

        if WINDOWS_VERSION >= :vista

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724318(v=vs.85).aspx
          # DWORD WINAPI GetDynamicTimeZoneInformation( _Out_  PDYNAMIC_TIME_ZONE_INFORMATION pTimeZoneInformation )
          attach_function 'GetDynamicTimeZoneInformation', [DYNAMIC_TIME_ZONE_INFORMATION.ptr(:out)], :dword

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724411(v=vs.85).aspx
          # ULONGLONG WINAPI GetTickCount64(void)
          attach_function 'GetTickCount64', [], :ulong

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724932(v=vs.85).aspx
          # BOOL WINAPI SetDynamicTimeZoneInformation( _In_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation )
          attach_function 'SetDynamicTimeZoneInformation', [DYNAMIC_TIME_ZONE_INFORMATION.ptr(:in)], :bool

          if WINDOWS_VERSION >= 7

            # https://msdn.microsoft.com/en-us/library/windows/desktop/bb540851(v=vs.85).aspx
            # BOOL WINAPI GetTimeZoneInformationForYear(
            #   _In_      USHORT wYear,
            #   _In_opt_  PDYNAMIC_TIME_ZONE_INFORMATION pdtzi,
            #   _Out_     LPTIME_ZONE_INFORMATION ptzi )
            attach_function 'GetTimeZoneInformationForYear', [:ushort, DYNAMIC_TIME_ZONE_INFORMATION.ptr, TIME_ZONE_INFORMATION.ptr(:out)], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/dn903660(v=vs.85).aspx
            # VOID QueryInterruptTimePrecise(_Out_ PULONGLONG lpInterruptTimePrecise)
            # attach_function 'QueryInterruptTimePrecise', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ee662307(v=vs.85).aspx
            # BOOL QueryUnbiasedInterruptTime( _Out_  PULONGLONG UnbiasedTime )
            attach_function 'QueryUnbiasedInterruptTime', [:pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/dn891448(v=vs.85).aspx
            # VOID QueryUnbiasedInterruptTimePrecise(_Out_ PULONGLONG lpUnbiasedInterruptTimePrecise)
            # attach_function 'QueryUnbiasedInterruptTimePrecise', [:pointer], :void

            # https://msdn.microsoft.com/en-us/library/windows/desktop/jj206642(v=vs.85).aspx
            # BOOL WINAPI SystemTimeToTzSpecificLocalTimeEx(
            #   _In_opt_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation,
            #   _In_      const SYSTEMTIME *lpUniversalTime,
            #   _Out_     LPSYSTEMTIME lpLocalTime )
            attach_function 'SystemTimeToTzSpecificLocalTimeEx', [DYNAMIC_TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/jj206643(v=vs.85).aspx
            # BOOL WINAPI TzSpecificLocalTimeToSystemTimeEx(
            #   _In_opt_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation,
            #   _In_      const SYSTEMTIME *lpLocalTime,
            #   _Out_     LPSYSTEMTIME lpUniversalTime )
            attach_function 'TzSpecificLocalTimeToSystemTimeEx', [:pointer, :pointer, :pointer], :bool

            if WINDOWS_VERSION >= 8

              # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706895(v=vs.85).aspx
              # VOID WINAPI GetSystemTimePreciseAsFileTime( _Out_  LPFILETIME lpSystemTimeAsFileTime )
              attach_function 'GetSystemTimePreciseAsFileTime', [:pointer], :void

              if WINDOWS_VERSION >= 10
                # https://msdn.microsoft.com/en-us/library/windows/desktop/dn903659(v=vs.85).aspx
                # VOID QueryInterruptTime(_Out_ PULONGLONG lpInterruptTime)
                attach_function 'QueryInterruptTime', [:pointer], :void
              end
            end
          end
        end
      end
    end
  end
end