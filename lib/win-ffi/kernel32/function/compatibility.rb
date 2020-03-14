module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/DevNotes/baseflushappcompatcache
      # @return [true, false]
      def self.BaseFlushAppcompatCache; end
      attach_function 'BaseFlushAppcompatCache', [], :bool
    end
  end
end