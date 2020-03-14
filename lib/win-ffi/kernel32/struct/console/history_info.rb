module WinFFI
  if WINDOWS_VERSION >= :vista
    require_relative '../../enum/console/history_flag'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/console/console-history-info
      class CONSOLE_HISTORY_INFO < FFIAdditions::Struct
        attr_accessor :cbSize, :HistoryBufferSize, :NumberOfHistoryBuffers, :dwFlags

        layout cbSize:                 :uint,
               HistoryBufferSize:      :uint,
               NumberOfHistoryBuffers: :uint,
               dwFlags:                HistoryFlag

        def initialize
          super
          self.cbSize = self.size
        end

        private :cbSize=
      end
    end
  end
end