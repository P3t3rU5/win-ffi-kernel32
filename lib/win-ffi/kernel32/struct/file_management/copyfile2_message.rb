require 'win-ffi/core/struct/ularge_integer'
require 'win-ffi/kernel32/enum/file_management/copyfile2_copy_phase'
require 'win-ffi/kernel32/enum/file_management/copyfile2_message_type'

module WinFFI
  module Kernel32
    class COPYFILE2_MESSAGE_CHUNK_STARTED < FFIAdditions::Struct
      layout dwStreamNumber:           :dword,
             dwReserved:               :dword,
             hSourceFile:             :handle,
             hDestinationFile:        :handle,
             uliChunkNumber:   ULARGE_INTEGER,
             uliChunkSize:     ULARGE_INTEGER,
             uliStreamSize:    ULARGE_INTEGER,
             uliTotalFileSize: ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_CHUNK_FINISHED < FFIAdditions::Struct
      layout dwStreamNumber:                    :dword,
             dwReserved:                        :dword,
             hSourceFile:                      :handle,
             hDestinationFile:                 :handle,
             uliChunkNumber:            ULARGE_INTEGER,
             uliChunkSize:              ULARGE_INTEGER,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_STREAM_STARTED < FFIAdditions::Struct
      layout dwStreamNumber:                    :dword,
             dwReserved:                        :dword,
             hSourceFile:                      :handle,
             hDestinationFile:                 :handle,
             uliStreamSize:             ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_STREAM_FINISHED  < FFIAdditions::Struct
      layout dwStreamNumber:                    :dword,
             dwReserved:                        :dword,
             hSourceFile:                      :handle,
             hDestinationFile:                 :handle,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_POLL_CONTINUE < FFIAdditions::Struct
      layout dwReserved: :dword
    end

    class COPYFILE2_MESSAGE_ERROR < FFIAdditions::Struct
      layout CopyPhase:           COPYFILE2_COPY_PHASE,
             dwStreamNumber:                    :dword,
             hrFailure:                       :hresult,
             dwReserved:                        :dword,
             uliChunkNumber:            ULARGE_INTEGER,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_UNION < FFIAdditions::Union
      layout ChunkStarted:     COPYFILE2_MESSAGE_CHUNK_STARTED,
             ChunkFinished:   COPYFILE2_MESSAGE_CHUNK_FINISHED,
             StreamStarted:   COPYFILE2_MESSAGE_STREAM_STARTED,
             StreamFinished: COPYFILE2_MESSAGE_STREAM_FINISHED,
             PollContinue:     COPYFILE2_MESSAGE_POLL_CONTINUE,
             Error:                    COPYFILE2_MESSAGE_ERROR
    end

    # https://msdn.microsoft.com/en-us/library/windows/desktop/hh449413(v=vs.85).aspx
    class COPYFILE2_MESSAGE < FFIAdditions::Struct
      layout Type:  COPYFILE2_MESSAGE_TYPE,
             dwPadding:             :dword,
             Info: COPYFILE2_MESSAGE_UNION
    end
  end
end