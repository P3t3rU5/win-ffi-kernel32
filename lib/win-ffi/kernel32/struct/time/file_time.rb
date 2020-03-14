require_relative 'system_time'

module WinFFI
  module Kernel32
    # File System time stamps are represented with the following structure:
    # https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-filetime
    class FILETIME < FFIAdditions::Struct
      attr_accessor :dwLowDateTime, :dwHighDateTime

      layout dwLowDateTime:  :dword,
             dwHighDateTime: :dword

      def to_system_time
        system_time = SYSTEMTIME.new
        GetSystemTimeAsFileTime(self, system_time)
        system_time
      end

      def to_local_time
        local_time = self.class.new
        FileTimeToLocalFileTime(self, local_time)
        local_time
      end

      def <=>(other)
        Kernel32.CompareFileTime(self, other)
      end

      def >(other)
        self.<=>(other) > 0
      end

      def <(other)
        self.<=>(other) < 0
      end

      def ==(other)
        self.<=>(other) == 0
      end
    end
  end
end