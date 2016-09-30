require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    OFS_MAXPATHNAME = 128
    # https://msdn.microsoft.com/en-us/library/windows/desktop/aa365282(v=vs.85).aspx
    class OFSTRUCT < FFIAdditions::Struct
      layout cBytes:     :byte,
             fFixedDisk: :byte,
             nErrCode:   :word,
             Reserved1:  :word,
             Reserved2:  :word,
             szPathName: [:char, OFS_MAXPATHNAME]
    end
  end
end