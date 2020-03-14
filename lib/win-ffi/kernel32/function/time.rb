require_relative '../enum/time/time_zone_id'

require_relative '../struct/time/file_time'
require_relative '../struct/time/system_time'
require_relative '../struct/time/time_zone_information'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/SysInfo/time-functions

    # https://docs.microsoft.com/en-us/windows/desktop/api/Winbase/nf-winbase-dosdatetimetofiletime
    # BOOL DosDateTimeToFileTime( _In_   WORD wFatDate, _In_   WORD wFatTime, _Out_  LPFILETIME lpFileTime )
    def self.DosDateTimeToFileTime(wFatDate, wFatTime, lpFileTime) end
    attach_function 'DosDateTimeToFileTime', [:word, :word, FILETIME.ptr(:out)], :bool

    # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-filetimetodosdatetime
    # BOOL FileTimeToDosDateTime(_In_ const FILETIME *lpFileTime, _Out_ LPWORD lpFatDate, _Out_ LPWORD lpFatTime)
    def self.FileTimeToDosDateTime(lpFileTime, lpFatDate, lpFatTime) end
    attach_function 'FileTimeToDosDateTime', [FILETIME.ptr(:in), :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724338
    # void GetLocalTime( _Out_  LPSYSTEMTIME lpSystemTime )
    def self.GetLocalTime(lpSystemTime) end
    attach_function 'GetLocalTime', [SYSTEMTIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724390
    # void GetSystemTime( _Out_  LPSYSTEMTIME lpSystemTime )
    def self.GetSystemTime(lpSystemTime) end
    attach_function 'GetSystemTime', [SYSTEMTIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724394
    # BOOL GetSystemTimeAdjustment(
    #   _Out_  PDWORD lpTimeAdjustment,
    #   _Out_  PDWORD lpTimeIncrement,
    #   _Out_  PBOOL lpTimeAdjustmentDisabled )
    def self.GetSystemTimeAdjustment(lpTimeAdjustment, lpTimeIncrement, lpTimeAdjustmentDisabled) end
    attach_function 'GetSystemTimeAdjustment', [:pointer, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724397
    # void GetSystemTimeAsFileTime( _Out_  LPFILETIME lpSystemTimeAsFileTime )
    def self.GetSystemTimeAsFileTime(lpSystemTimeAsFileTime) end
    attach_function 'GetSystemTimeAsFileTime', [FILETIME.ptr(:out)], :void

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724408
    # DWORD GetTickCount(void)
    def self.GetTickCount; end
    attach_function 'GetTickCount', [], :ulong

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724421
    # @param [FFI::Pointer] lpTimeZoneInformation
    # @return [Integer]
    def self.GetTimeZoneInformation(lpTimeZoneInformation) end
    attach_function 'GetTimeZoneInformation', [TIME_ZONE_INFORMATION.ptr(:out)], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724936
    # BOOL SetLocalTime( _In_  const SYSTEMTIME *lpSystemTime )
    def self.SetLocalTime(lpSystemTime) end
    attach_function 'SetLocalTime', [SYSTEMTIME.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724942
    # BOOL SetSystemTime( _In_  const SYSTEMTIME *lpSystemTime )
    def self.SetSystemTime(lpSystemTime) end
    attach_function 'SetSystemTime', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724944
    # BOOL SetTimeZoneInformation( _In_  const TIME_ZONE_INFORMATION *lpTimeZoneInformation )
    def self.SetTimeZoneInformation(lpTimeZoneInformation) end
    attach_function 'SetTimeZoneInformation', [TIME_ZONE_INFORMATION.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724943
    # BOOL SetSystemTimeAdjustment( _In_  DWORD dwTimeAdjustment, _In_  BOOL bTimeAdjustmentDisabled )
    def self.SetSystemTimeAdjustment(dwTimeAdjustment, bTimeAdjustmentDisabled) end
    attach_function 'SetSystemTimeAdjustment', [:dword, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724948
    # BOOL SystemTimeToFileTime( _In_   const SYSTEMTIME *lpSystemTime, _Out_  LPFILETIME lpFileTime )
    def self.SystemTimeToFileTime(lpSystemTime, lpFileTime) end
    attach_function 'SystemTimeToFileTime', [SYSTEMTIME.ptr(:in), FILETIME.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724949
    # BOOL SystemTimeToTzSpecificLocalTime(
    #   _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZone,
    #   _In_      LPSYSTEMTIME lpUniversalTime,
    #   _Out_     LPSYSTEMTIME lpLocalTime )
    def self.SystemTimeToTzSpecificLocalTime(lpTimeZone, lpUniversalTime, lpLocalTime) end
    attach_function 'SystemTimeToTzSpecificLocalTime', [TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

    if WINDOWS_VERSION >= :xp
      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-comparefiletime
      # LONG CompareFileTime( _In_  const FILETIME *lpFileTime1, _In_  const FILETIME *lpFileTime2 )
      def self.CompareFileTime(lpFileTime1, lpFileTime2) end
      attach_function 'CompareFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:in)], :long

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime
      # BOOL FileTimeToLocalFileTime( _In_   const FILETIME *lpFileTime, _Out_  LPFILETIME lpLocalFileTime )
      def self.FileTimeToLocalFileTime(lpFileTime, lpLocalFileTime) end
      attach_function 'FileTimeToLocalFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724280
      # BOOL FileTimeToSystemTime( _In_   const FILETIME *lpFileTime, _Out_  LPSYSTEMTIME lpSystemTime )
      def self.FileTimeToSystemTime(lpFileTime, lpSystemTime) end
      attach_function 'FileTimeToSystemTime', [FILETIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-getfiletime
      # BOOL GetFileTime(
      #   _In_       HANDLE hFile,
      #   _Out_opt_  LPFILETIME lpCreationTime,
      #   _Out_opt_  LPFILETIME lpLastAccessTime,
      #   _Out_opt_  LPFILETIME lpLastWriteTime )
      def self.GetFileTime(hFile, lpCreationTime, lpLastAccessTime, lpLastWriteTime) end
      attach_function 'GetFileTime', [:handle, FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-localfiletimetofiletime
      # BOOL LocalFileTimeToFileTime( _In_   const FILETIME *lpLocalFileTime, _Out_  LPFILETIME lpFileTime )
      def self.LocalFileTimeToFileTime(lpLocalFileTime, lpFileTime) end
      attach_function 'LocalFileTimeToFileTime', [FILETIME.ptr(:in), FILETIME.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms725485
      # BOOL TzSpecificLocalTimeToSystemTime(
      #   _In_opt_  LPTIME_ZONE_INFORMATION lpTimeZoneInformation,
      #   _In_      LPSYSTEMTIME lpLocalTime,
      #   _Out_     LPSYSTEMTIME lpUniversalTime )
      def self.TzSpecificLocalTimeToSystemTime(lpTimeZoneInformation, lpLocalTime, lpUniversalTime) end
      attach_function 'TzSpecificLocalTimeToSystemTime',
                      [TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-setfiletime
      # BOOL SetFileTime(
      #   _In_      HANDLE hFile,
      #   _In_opt_  const FILETIME *lpCreationTime,
      #   _In_opt_  const FILETIME *lpLastAccessTime,
      #   _In_opt_  const FILETIME *lpLastWriteTime )
      def self.SetFileTime(hFile, lpCreationTime, lpLastAccessTime, lpLastWriteTime) end
      attach_function 'SetFileTime', [:handle, FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

      if (WINDOWS_VERSION == :xp && WINDOWS_VERSION.sp >= 1) || WINDOWS_VERSION >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724400
        # BOOL GetSystemTimes(
        #   _Out_opt_  LPFILETIME lpIdleTime,
        #   _Out_opt_  LPFILETIME lpKernelTime,
        #   _Out_opt_  LPFILETIME lpUserTime )
        def self.GetSystemTimes(lpIdleTime, lpKernelTime, lpUserTime) end
        attach_function 'GetSystemTimes', [FILETIME.ptr, FILETIME.ptr, FILETIME.ptr], :bool

        if WINDOWS_VERSION >= :vista
          require_relative '../struct/time/dynamic_time_zone_information'

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724318
          # DWORD GetDynamicTimeZoneInformation( _Out_  PDYNAMIC_TIME_ZONE_INFORMATION pTimeZoneInformation )
          def self.GetDynamicTimeZoneInformation(pTimeZoneInformation) end
          attach_function 'GetDynamicTimeZoneInformation', [DYNAMIC_TIME_ZONE_INFORMATION.ptr(:out)], :dword

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724411
          # ULONGLONG GetTickCount64(void)
          def self.GetTickCount64; end
          attach_function 'GetTickCount64', [], :ulong

          # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724932
          # BOOL SetDynamicTimeZoneInformation( _In_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation )
          def self.SetDynamicTimeZoneInformation(lpTimeZoneInformation) end
          attach_function 'SetDynamicTimeZoneInformation', [DYNAMIC_TIME_ZONE_INFORMATION.ptr(:in)], :bool

          if WINDOWS_VERSION >= 7
            # https://msdn.microsoft.com/en-us/library/windows/desktop/bb540851
            # BOOL GetTimeZoneInformationForYear(
            #   _In_      USHORT wYear,
            #   _In_opt_  PDYNAMIC_TIME_ZONE_INFORMATION pdtzi,
            #   _Out_     LPTIME_ZONE_INFORMATION ptzi )
            def self.GetTimeZoneInformationForYear(wYear, pdtzi, ptzi) end
            attach_function 'GetTimeZoneInformationForYear',
                            [:ushort, DYNAMIC_TIME_ZONE_INFORMATION.ptr, TIME_ZONE_INFORMATION.ptr(:out)], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/ee662307
            # BOOL QueryUnbiasedInterruptTime( _Out_  PULONGLONG UnbiasedTime )
            def self.QueryUnbiasedInterruptTime(unbiasedTime) end
            attach_function 'QueryUnbiasedInterruptTime', [:pointer], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/jj206642
            # BOOL SystemTimeToTzSpecificLocalTimeEx(
            #   _In_opt_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation,
            #   _In_      const SYSTEMTIME *lpUniversalTime,
            #   _Out_     LPSYSTEMTIME lpLocalTime )
            def self.SystemTimeToTzSpecificLocalTimeEx(lpTimeZoneInformation, lpUniversalTime, lpLocalTime) end
            attach_function 'SystemTimeToTzSpecificLocalTimeEx',
                            [DYNAMIC_TIME_ZONE_INFORMATION.ptr, SYSTEMTIME.ptr(:in), SYSTEMTIME.ptr(:out)], :bool

            # https://msdn.microsoft.com/en-us/library/windows/desktop/jj206643
            # BOOL TzSpecificLocalTimeToSystemTimeEx(
            #   _In_opt_  const DYNAMIC_TIME_ZONE_INFORMATION *lpTimeZoneInformation,
            #   _In_      const SYSTEMTIME *lpLocalTime,
            #   _Out_     LPSYSTEMTIME lpUniversalTime )
            def self.TzSpecificLocalTimeToSystemTimeEx(lpTimeZoneInformation, lpLocalTime, lpUniversalTime) end
            attach_function 'TzSpecificLocalTimeToSystemTimeEx', [:pointer, :pointer, :pointer], :bool

            if WINDOWS_VERSION >= 8
              # https://msdn.microsoft.com/en-us/library/windows/desktop/hh706895
              # VOID GetSystemTimePreciseAsFileTime( _Out_  LPFILETIME lpSystemTimeAsFileTime )
              def self.GetSystemTimePreciseAsFileTime(lpSystemTimeAsFileTime) end
              attach_function 'GetSystemTimePreciseAsFileTime', [:pointer], :void

              if WINDOWS_VERSION >= 10
                # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryinterrupttime
                # VOID QueryInterruptTime(_Out_ PULONGLONG lpInterruptTime)
                def self.QueryInterruptTime(lpInterruptTime) end
                attach_function 'QueryInterruptTime', [:pointer], :void

                # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryinterrupttimeprecise
                # VOID QueryInterruptTimePrecise(_Out_ PULONGLONG lpInterruptTimePrecise)
                def self.QueryInterruptTimePrecise(lpInterruptTimePrecise) end
                attach_function 'QueryInterruptTimePrecise', [:pointer], :void

                # https://docs.microsoft.com/en-us/windows/desktop/api/realtimeapiset/nf-realtimeapiset-queryunbiasedinterrupttimeprecise
                # VOID QueryUnbiasedInterruptTimePrecise(_Out_ PULONGLONG lpUnbiasedInterruptTimePrecise)
                def self.QueryUnbiasedInterruptTimePrecise(lpUnbiasedInterruptTimePrecise) end
                attach_function 'QueryUnbiasedInterruptTimePrecise', [:pointer], :void
              end
            end
          end
        end
      end
    end
  end
end