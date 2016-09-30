require 'win-ffi/kernel32'

module WinFFI
  if WindowsVersion >= :xp
    module Kernel32

      class COMSTAT < FFIAdditions::Struct
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
