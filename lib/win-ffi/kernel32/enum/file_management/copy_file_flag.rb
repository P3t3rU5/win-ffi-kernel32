module WinFFI
  module Kernel32
    buffer = [
        :FAIL_IF_EXISTS,              0x00000001,
        :RESTARTABLE,                 0x00000002,
        :OPEN_SOURCE_FOR_WRITE,       0x00000004,
        :ALLOW_DECRYPTED_DESTINATION, 0x00000008,
    ]

    if WINDOWS_VERSION >= :vista
      buffer += [:COPY_SYMLINK, 0x00000800, :NO_BUFFERING, 0x00001000]
      buffer += [
          :REQUEST_SECURITY_PRIVILEGES, 0x00002000,
          :RESUME_FROM_PAUSE, 0x00004000,
          :NO_OFFLOAD, 0x00040000,
      ] if WINDOWS_VERSION >= 8
    end


    CopyFileFlag = enum :copy_file_flag, buffer

    define_prefix(:COPY_FILE, CopyFileFlag)
  end
end