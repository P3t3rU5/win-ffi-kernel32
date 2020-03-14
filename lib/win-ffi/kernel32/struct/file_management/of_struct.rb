module WinFFI
  module Kernel32
    OFS_MAXPATHNAME = 128
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-ofstruct
    class OFSTRUCT < FFIAdditions::Struct
      attr_accessor :cBytes,
                    :fFixedDisk,
                    :nErrCode,
                    :Reserved1,
                    :Reserved2,
                    :szPathName

      layout cBytes:     :byte,
             fFixedDisk: :byte,
             nErrCode:   :word,
             Reserved1:  :word,
             Reserved2:  :word,
             szPathName: [:char, OFS_MAXPATHNAME]
    end
  end
end