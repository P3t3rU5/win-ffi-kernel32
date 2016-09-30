require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    # Define CopyFileEx callback routine state change values
    CopyFileExState = enum :copy_file_ex_state, [
        :CHUNK_FINISHED, 0x00000000,
        :STREAM_SWITCH,  0x00000001,
    ]

    define_prefix(:CALLBACK, CopyFileExState)
  end
end