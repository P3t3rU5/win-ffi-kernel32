require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Define possible return codes from the CopyFileEx callback routine
    CopyFileExProgress = enum :copy_file_ex_progress, [
        :CONTINUE, 0,
        :CANCEL,   1,
        :STOP,     2,
        :QUIET,    3,
    ]

    define_prefix(:CALLBACK, CopyFileExProgress)
  end
end