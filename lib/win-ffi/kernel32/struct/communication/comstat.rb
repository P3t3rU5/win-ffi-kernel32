module WinFFI
  if WINDOWS_VERSION >= :xp
    module Kernel32
      # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-comstat
      class COMSTAT < FFIAdditions::Struct
        attr_accessor :flag, :cbInQue, :cbOutQue

        layout flag:     :dword,
               cbInQue:  :dword,
               cbOutQue: :dword

        # DWORD fCtsHold : 1;
        # DWORD fDsrHold : 1;
        # DWORD fRlsdHold : 1;
        # DWORD fXoffHold : 1;
        # DWORD fXoffSent : 1;
        # DWORD fEof : 1;
        # DWORD fTxim : 1;
        # DWORD fReserved : 25;
      end
    end
  end
end
