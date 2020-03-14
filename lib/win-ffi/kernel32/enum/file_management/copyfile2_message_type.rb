module WinFFI
  if WINDOWS_VERSION >= 7
    module Kernel32
      COPYFILE2_MESSAGE_TYPE = enum :copyfile2_message_type, [
          :NONE, 0,
          :CHUNK_STARTED,
          :CHUNK_FINISHED,
          :STREAM_STARTED,
          :STREAM_FINISHED,
          :POLL_CONTINUE,
          :ERROR,
          :MAX,
      ]

      define_prefix(:COPYFILE2_CALLBACK, COPYFILE2_MESSAGE_TYPE)
    end
  end
end