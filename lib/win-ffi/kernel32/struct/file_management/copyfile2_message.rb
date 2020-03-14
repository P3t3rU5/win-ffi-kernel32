require 'win-ffi/core/struct/ularge_integer'

require_relative '../../enum/file_management/copyfile2_copy_phase'
require_relative '../../enum/file_management/copyfile2_message_type'

module WinFFI
  module Kernel32
    class COPYFILE2_MESSAGE_CHUNK_STARTED < FFIAdditions::Struct
      attr_accessor :dwStreamNumber,
                    :dwReserved,
                    :hSourceFile,
                    :hDestinationFile,
                    :uliChunkNumber,
                    :uliChunkSize,
                    :uliStreamSize,
                    :uliTotalFileSize

      layout dwStreamNumber:   :dword,
             dwReserved:       :dword,
             hSourceFile:      :handle,
             hDestinationFile: :handle,
             uliChunkNumber:   ULARGE_INTEGER,
             uliChunkSize:     ULARGE_INTEGER,
             uliStreamSize:    ULARGE_INTEGER,
             uliTotalFileSize: ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_CHUNK_FINISHED < FFIAdditions::Struct
      attr_accessor :dwStreamNumber,
                    :dwReserved,
                    :hSourceFile,
                    :hDestinationFile,
                    :uliChunkNumber,
                    :uliChunkSize,
                    :uliStreamSize,
                    :uliStreamBytesTransferred,
                    :uliTotalFileSize,
                    :uliTotalBytesTransferred

      layout dwStreamNumber:            :dword,
             dwReserved:                :dword,
             hSourceFile:               :handle,
             hDestinationFile:          :handle,
             uliChunkNumber:            ULARGE_INTEGER,
             uliChunkSize:              ULARGE_INTEGER,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_STREAM_STARTED < FFIAdditions::Struct
      attr_accessor :dwStreamNumber,
                    :dwReserved,
                    :hSourceFile,
                    :hDestinationFile,
                    :uliStreamSize,
                    :uliTotalFileSize

      layout dwStreamNumber:   :dword,
             dwReserved:       :dword,
             hSourceFile:      :handle,
             hDestinationFile: :handle,
             uliStreamSize:    ULARGE_INTEGER,
             uliTotalFileSize: ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_STREAM_FINISHED  < FFIAdditions::Struct
      attr_accessor :dwStreamNumber,
                    :dwReserved,
                    :hSourceFile,
                    :hDestinationFile,
                    :uliStreamSize,
                    :uliStreamBytesTransferred,
                    :uliTotalFileSize,
                    :uliTotalBytesTransferred

      layout dwStreamNumber:            :dword,
             dwReserved:                :dword,
             hSourceFile:               :handle,
             hDestinationFile:          :handle,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_POLL_CONTINUE < FFIAdditions::Struct
      attr_accessor :dwReserved

      layout dwReserved: :dword
    end

    class COPYFILE2_MESSAGE_ERROR < FFIAdditions::Struct
      attr_accessor :CopyPhase,
                    :dwStreamNumber,
                    :hrFailure,
                    :dwReserved,
                    :uliChunkNumber,
                    :uliStreamSize,
                    :uliStreamBytesTransferred,
                    :uliTotalFileSize,
                    :uliTotalBytesTransferred

      layout CopyPhase:                 COPYFILE2_COPY_PHASE,
             dwStreamNumber:            :dword,
             hrFailure:                 :hresult,
             dwReserved:                :dword,
             uliChunkNumber:            ULARGE_INTEGER,
             uliStreamSize:             ULARGE_INTEGER,
             uliStreamBytesTransferred: ULARGE_INTEGER,
             uliTotalFileSize:          ULARGE_INTEGER,
             uliTotalBytesTransferred:  ULARGE_INTEGER
    end

    class COPYFILE2_MESSAGE_UNION < FFIAdditions::Union
      attr_accessor :ChunkStarted,
                    :ChunkFinished,
                    :StreamStarted,
                    :StreamFinished,
                    :PollContinue,
                    :Error

      layout ChunkStarted:   COPYFILE2_MESSAGE_CHUNK_STARTED,
             ChunkFinished:  COPYFILE2_MESSAGE_CHUNK_FINISHED,
             StreamStarted:  COPYFILE2_MESSAGE_STREAM_STARTED,
             StreamFinished: COPYFILE2_MESSAGE_STREAM_FINISHED,
             PollContinue:   COPYFILE2_MESSAGE_POLL_CONTINUE,
             Error:          COPYFILE2_MESSAGE_ERROR
    end

    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-copyfile2_message
    class COPYFILE2_MESSAGE < FFIAdditions::Struct
      attr_accessor :Type, :dwPadding, :Info

      layout Type:      COPYFILE2_MESSAGE_TYPE,
             dwPadding: :dword,
             Info:      COPYFILE2_MESSAGE_UNION
    end
  end
end