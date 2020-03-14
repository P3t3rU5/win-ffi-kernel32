module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/win32/api/winbase/ns-winbase-dcb
    class DCB < FFIAdditions::Struct
      attr_accessor :DCBlength,
                    :BaudRate,
                    :flag,
                    :wReserved,
                    :XonLim,
                    :XoffLim,
                    :ByteSize,
                    :Parity,
                    :StopBits,
                    :XonChar,
                    :XoffChar,
                    :ErrorChar,
                    :EofChar,
                    :EvtChar,
                    :wReserved1

      layout DCBlength:  :dword,
             BaudRate:   :dword,
             flag:       :dword,
             wReserved:  :word,
             XonLim:     :word,
             XoffLim:    :word,
             ByteSize:   :byte,
             Parity:     :byte,
             StopBits:   :byte,
             XonChar:    :char,
             XoffChar:   :char,
             ErrorChar:  :char,
             EofChar:    :char,
             EvtChar:    :char,
             wReserved1: :word

    # DWORD fBinary: 1;     /* Binary Mode (skip EOF check)    */
    # DWORD fParity: 1;     /* Enable parity checking          */
    # DWORD fOutxCtsFlow:1; /* CTS handshaking on output       */
    # DWORD fOutxDsrFlow:1; /* DSR handshaking on output       */
    # DWORD fDtrControl:2;  /* DTR Flow control                */
    # DWORD fDsrSensitivity:1; /* DSR Sensitivity              */
    # DWORD fTXContinueOnXoff: 1; /* Continue TX when Xoff sent */
    # DWORD fOutX: 1;       /* Enable output X-ON/X-OFF        */
    # DWORD fInX: 1;        /* Enable input X-ON/X-OFF         */
    # DWORD fErrorChar: 1;  /* Enable Err Replacement          */
    # DWORD fNull: 1;       /* Enable Null stripping           */
    # DWORD fRtsControl:2;  /* Rts Flow control                */
    # DWORD fAbortOnError:1; /* Abort all reads and writes on Error */
    # DWORD fDummy2:17;     /* Reserved                        */
    end
  end
end