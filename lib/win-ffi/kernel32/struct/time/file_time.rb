require 'win-ffi/kernel32'

require 'win-ffi/kernel32/struct/time/system_time'

module WinFFI
  module Kernel32
    # File System time stamps are represented with the following structure:
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms724284(v=vs.85).aspx
    class FILETIME < FFIAdditions::Struct
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