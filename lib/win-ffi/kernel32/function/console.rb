require 'win-ffi/kernel32/enum/console/console_textmode_flag'
require 'win-ffi/kernel32/enum/console/console_display_mode'
require 'win-ffi/kernel32/enum/console/control_event'
require 'win-ffi/kernel32/enum/file_management/file_share_flag'
require 'win-ffi/kernel32/enum/generic_flag'
require 'win-ffi/kernel32/enum/console/standard_handle'

require 'win-ffi/kernel32/struct/console/coord'
require 'win-ffi/kernel32/struct/console/console_screen_buffer_info'
require 'win-ffi/kernel32/struct/console/console_cursor_info'
require 'win-ffi/kernel32/struct/console/console_history_info'
require 'win-ffi/kernel32/struct/console/console_selection_info'
require 'win-ffi/kernel32/struct/console/console_font_info'
require 'win-ffi/kernel32/struct/console/console_font_infoex'
require 'win-ffi/kernel32/struct/console/console_screen_buffer_infoex'
require 'win-ffi/kernel32/struct/console/input_record'
require 'win-ffi/kernel32/struct/console/char_info'
require 'win-ffi/kernel32/struct/console/small_rect'
require 'win-ffi/core/struct/security_attributes'

module WinFFI
  module Kernel32
    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683242(v=vs.85).aspx
    # BOOL WINAPI HandlerRoutine(_In_ DWORD dwCtrlType)
    HandlerRoutine = callback 'HandlerRoutine', [ControlEvent], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681935(v=vs.85).aspx
    # BOOL WINAPI AddConsoleAlias(_In_ LPCTSTR Source, _In_ LPCTSTR Target, _In_ LPCTSTR ExeName)
    encoded_function 'AddConsoleAlias', [:string, :string, :string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681944(v=vs.85).aspx
    # BOOL WINAPI AllocConsole(void)
    attach_function 'AllocConsole', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682122(v=vs.85).aspx
    # HANDLE WINAPI CreateConsoleScreenBuffer(
    #   _In_             DWORD               dwDesiredAccess,
    #   _In_             DWORD               dwShareMode,
    #   _In_opt_   const SECURITY_ATTRIBUTES *lpSecurityAttributes,
    #   _In_             DWORD               dwFlags,
    #   _Reserved_       LPVOID              lpScreenBufferData)
    attach_function 'CreateConsoleScreenBuffer',
                    [GenericFlag, FileShareFlag, SECURITY_ATTRIBUTES.ptr(:in), ConsoleTextmodeFlag, :pointer], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682662(v=vs.85).aspx
    # BOOL WINAPI FillConsoleOutputAttribute(
    #   _In_  HANDLE  hConsoleOutput,
    #   _In_  WORD    wAttribute,
    #   _In_  DWORD   nLength,
    #   _In_  COORD   dwWriteCoord,
    #   _Out_ LPDWORD lpNumberOfAttrsWritten)
    attach_function 'FillConsoleOutputAttribute', [:handle, :word, :dword, COORD.ptr(:in), :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682663(v=vs.85).aspx
    # BOOL WINAPI FillConsoleOutputCharacter(
    #   _In_  HANDLE  hConsoleOutput,
    #   _In_  TCHAR   cCharacter,
    #   _In_  DWORD   nLength,
    #   _In_  COORD   dwWriteCoord,
    #   _Out_ LPDWORD lpNumberOfCharsWritten)
    encoded_function 'FillConsoleOutputCharacter', [:handle, :tchar, :dword, COORD.ptr(:in), :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683147(v=vs.85).aspx
    # BOOL WINAPI FlushConsoleInputBuffer(_In_ HANDLE hConsoleInput)
    attach_function 'FlushConsoleInputBuffer', [:handle], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683150(v=vs.85).aspx
    # BOOL WINAPI FreeConsole(void)
    attach_function 'FreeConsole', [], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683155(v=vs.85).aspx
    # BOOL WINAPI GenerateConsoleCtrlEvent(_In_ DWORD dwCtrlEvent, _In_ DWORD dwProcessGroupId)
    attach_function 'GenerateConsoleCtrlEvent', [ControlEvent, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683157(v=vs.85).aspx
    # DWORD WINAPI GetConsoleAlias(
    #   _In_  LPTSTR lpSource,
    #   _Out_ LPTSTR lpTargetBuffer,
    #   _In_  DWORD  TargetBufferLength,
    #   _In_  LPTSTR lpExeName)
    encoded_function 'GetConsoleAlias', [:string, :string, :dword, :string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683158(v=vs.85).aspx
    # DWORD WINAPI GetConsoleAliases(
    #   _Out_ LPTSTR lpAliasBuffer,
    #   _In_  DWORD  AliasBufferLength,
    #   _In_  LPTSTR lpExeName)
    encoded_function 'GetConsoleAliases', [:string, :dword, :string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683159(v=vs.85).aspx
    # DWORD WINAPI GetConsoleAliasesLength(_In_ LPTSTR lpExeName)
    encoded_function 'GetConsoleAliasesLength', [:string], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683160(v=vs.85).aspx
    # DWORD WINAPI GetConsoleAliasExes(_Out_ LPTSTR lpExeNameBuffer, _In_  DWORD  ExeNameBufferLength)
    encoded_function 'GetConsoleAliasExes', [:string, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683161(v=vs.85).aspx
    # DWORD WINAPI GetConsoleAliasExesLength(void)
    encoded_function 'GetConsoleAliasExesLength', [], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683162(v=vs.85).aspx
    # UINT WINAPI GetConsoleCP(void)
    attach_function 'GetConsoleCP', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683163(v=vs.85).aspx
    # BOOL WINAPI GetConsoleCursorInfo(
    #   _In_  HANDLE               hConsoleOutput,
    #   _Out_ PCONSOLE_CURSOR_INFO lpConsoleCursorInfo)
    attach_function 'GetConsoleCursorInfo', [:handle, CONSOLE_CURSOR_INFO.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683167(v=vs.85).aspx
    # BOOL WINAPI GetConsoleMode(_In_  HANDLE  hConsoleHandle, _Out_ LPDWORD lpMode)
    attach_function 'GetConsoleMode', [:handle, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683169(v=vs.85).aspx
    # UINT WINAPI GetConsoleOutputCP(void)
    attach_function 'GetConsoleOutputCP', [], :uint

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683171(v=vs.85).aspx
    # BOOL WINAPI GetConsoleScreenBufferInfo(
    #   _In_  HANDLE                      hConsoleOutput,
    #   _Out_ PCONSOLE_SCREEN_BUFFER_INFO lpConsoleScreenBufferInfo)
    attach_function 'GetConsoleScreenBufferInfo', [:handle, CONSOLE_SCREEN_BUFFER_INFO.ptr(:out)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683174(v=vs.85).aspx
    # DWORD WINAPI GetConsoleTitle(_Out_ LPTSTR lpConsoleTitle, _In_  DWORD  nSize)
    encoded_function 'GetConsoleTitle', [:string, :dword], :dword

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683175(v=vs.85).aspx
    # HWND WINAPI GetConsoleWindow(void)
    attach_function 'GetConsoleWindow', [], :hwnd

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683193(v=vs.85).aspx
    # COORD WINAPI GetLargestConsoleWindowSize(_In_ HANDLE hConsoleOutput)
    attach_function 'GetLargestConsoleWindowSize', [:handle], COORD

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683207(v=vs.85).aspx
    # BOOL WINAPI GetNumberOfConsoleInputEvents(_In_  HANDLE  hConsoleInput, _Out_ LPDWORD lpcNumberOfEvents)
    attach_function 'GetNumberOfConsoleInputEvents', [:handle, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683208(v=vs.85).aspx
    # BOOL WINAPI GetNumberOfConsoleMouseButtons(_Out_ LPDWORD lpNumberOfMouseButtons)
    attach_function 'GetNumberOfConsoleMouseButtons', [:pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683231(v=vs.85).aspx
    # HANDLE WINAPI GetStdHandle(_In_ DWORD nStdHandle)
    attach_function 'GetStdHandle', [StandardHandle], :handle

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684344(v=vs.85).aspx
    # BOOL WINAPI PeekConsoleInput(
    #   _In_  HANDLE        hConsoleInput,
    #   _Out_ PINPUT_RECORD lpBuffer,
    #   _In_  DWORD         nLength,
    #   _Out_ LPDWORD       lpNumberOfEventsRead)
    encoded_function 'PeekConsoleInput', [:handle, INPUT_RECORD.ptr(:out), :dword, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684958(v=vs.85).aspx
    # BOOL WINAPI ReadConsole(
    #   _In_     HANDLE  hConsoleInput,
    #   _Out_    LPVOID  lpBuffer,
    #   _In_     DWORD   nNumberOfCharsToRead,
    #   _Out_    LPDWORD lpNumberOfCharsRead,
    #   _In_opt_ LPVOID  pInputControl)
    encoded_function 'ReadConsole', [:handle, :pointer, :dword, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684961(v=vs.85).aspx
    # BOOL WINAPI ReadConsoleInput(
    #   _In_  HANDLE        hConsoleInput,
    #   _Out_ PINPUT_RECORD lpBuffer,
    #   _In_  DWORD         nLength,
    #   _Out_ LPDWORD       lpNumberOfEventsRead)
    encoded_function 'ReadConsoleInput', [:handle, INPUT_RECORD.ptr(:out), :dword, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684965(v=vs.85).aspx
    # BOOL WINAPI ReadConsoleOutput(
    #   _In_    HANDLE      hConsoleOutput,
    #   _Out_   PCHAR_INFO  lpBuffer,
    #   _In_    COORD       dwBufferSize,
    #   _In_    COORD       dwBufferCoord,
    #   _Inout_ PSMALL_RECT lpReadRegion)
    encoded_function 'ReadConsoleOutput',
                     [:handle, CHAR_INFO.ptr(:out), COORD.ptr(:in), COORD.ptr(:in), SMALL_RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684968(v=vs.85).aspx
    # BOOL WINAPI ReadConsoleOutputAttribute(
    #   _In_  HANDLE  hConsoleOutput,
    #   _Out_ LPWORD  lpAttribute,
    #   _In_  DWORD   nLength,
    #   _In_  COORD   dwReadCoord,
    #   _Out_ LPDWORD lpNumberOfAttrsRead)
    attach_function 'ReadConsoleOutputAttribute', [:handle, :pointer, :dword, COORD.ptr(:in), :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684969(v=vs.85).aspx
    # BOOL WINAPI ReadConsoleOutputCharacter(
    #   _In_  HANDLE  hConsoleOutput,
    #   _Out_ LPTSTR  lpCharacter,
    #   _In_  DWORD   nLength,
    #   _In_  COORD   dwReadCoord,
    #   _Out_ LPDWORD lpNumberOfCharsRead)
    encoded_function 'ReadConsoleOutputCharacter', [:handle, :string, :dword, COORD.ptr(:in), :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms685107(v=vs.85).aspx
    # BOOL WINAPI ScrollConsoleScreenBuffer(
    #   _In_           HANDLE     hConsoleOutput,
    #   _In_     const SMALL_RECT *lpScrollRectangle,
    #   _In_opt_ const SMALL_RECT *lpClipRectangle,
    #   _In_           COORD      dwDestinationOrigin,
    #   _In_     const CHAR_INFO  *lpFill)
    encoded_function 'ScrollConsoleScreenBuffer',
                     [:handle, SMALL_RECT.ptr(:in), SMALL_RECT.ptr, COORD.ptr(:in), CHAR_INFO.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686010(v=vs.85).aspx
    # BOOL WINAPI SetConsoleActiveScreenBuffer(_In_ HANDLE hConsoleOutput)
    attach_function 'SetConsoleActiveScreenBuffer', [:handle], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686013(v=vs.85).aspx
    # BOOL WINAPI SetConsoleCP(_In_ UINT wCodePageID)
    attach_function 'SetConsoleCP', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686016(v=vs.85).aspx
    # BOOL WINAPI SetConsoleCtrlHandler(_In_opt_ PHANDLER_ROUTINE HandlerRoutine, _In_ BOOL Add)
    attach_function 'SetConsoleCtrlHandler', [HandlerRoutine, :bool], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686019(v=vs.85).aspx
    # BOOL WINAPI SetConsoleCursorInfo(
    #   _In_       HANDLE              hConsoleOutput,
    #   _In_ const CONSOLE_CURSOR_INFO *lpConsoleCursorInfo)
    attach_function 'SetConsoleCursorInfo', [:handle, CONSOLE_CURSOR_INFO.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686025(v=vs.85).aspx
    # BOOL WINAPI SetConsoleCursorPosition(_In_ HANDLE hConsoleOutput, _In_ COORD  dwCursorPosition)
    attach_function 'SetConsoleCursorPosition', [:handle, COORD.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686033(v=vs.85).aspx
    # BOOL WINAPI SetConsoleMode(_In_ HANDLE hConsoleHandle, _In_ DWORD  dwMode)
    attach_function 'SetConsoleMode', [:handle, :dword], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686036(v=vs.85).aspx
    # BOOL WINAPI SetConsoleOutputCP(_In_ UINT wCodePageID)
    attach_function 'SetConsoleOutputCP', [:uint], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686044(v=vs.85).aspx
    # BOOL WINAPI SetConsoleScreenBufferSize(_In_ HANDLE hConsoleOutput, _In_ COORD  dwSize)
    attach_function 'SetConsoleScreenBufferSize', [:handle, COORD.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686047(v=vs.85).aspx
    # BOOL WINAPI SetConsoleTextAttribute(_In_ HANDLE hConsoleOutput, _In_ WORD   wAttributes)
    attach_function 'SetConsoleTextAttribute', [:handle, :word], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686050(v=vs.85).aspx
    # BOOL WINAPI SetConsoleTitle(_In_ LPCTSTR lpConsoleTitle)
    encoded_function 'SetConsoleTitle', [:string], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686125(v=vs.85).aspx
    # BOOL WINAPI SetConsoleWindowInfo(
    #   _In_       HANDLE     hConsoleOutput,
    #   _In_       BOOL       bAbsolute,
    #   _In_ const SMALL_RECT *lpConsoleWindow)
    attach_function 'SetConsoleWindowInfo', [:handle, :bool, SMALL_RECT.ptr(:in)], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686244(v=vs.85).aspx
    # BOOL WINAPI SetStdHandle(_In_ DWORD  nStdHandle, _In_ HANDLE hHandle)
    attach_function 'SetStdHandle', [:dword, :handle], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687401(v=vs.85).aspx
    # BOOL WINAPI WriteConsole(
    #   _In_             HANDLE  hConsoleOutput,
    #   _In_       const VOID    *lpBuffer,
    #   _In_             DWORD   nNumberOfCharsToWrite,
    #   _Out_            LPDWORD lpNumberOfCharsWritten,
    #   _Reserved_       LPVOID  lpReserved)
    encoded_function 'WriteConsole', [:handle, :pointer, :dword, :pointer, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687403(v=vs.85).aspx
    # BOOL WINAPI WriteConsoleInput(
    #   _In_        HANDLE       hConsoleInput,
    #   _In_  const INPUT_RECORD *lpBuffer,
    #   _In_        DWORD        nLength,
    #   _Out_       LPDWORD      lpNumberOfEventsWritten)
    encoded_function 'WriteConsoleInput', [:handle, INPUT_RECORD.ptr(:in), :dword, :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687404(v=vs.85).aspx
    # BOOL WINAPI WriteConsoleOutput(
    #   _In_          HANDLE      hConsoleOutput,
    #   _In_    const CHAR_INFO   *lpBuffer,
    #   _In_          COORD       dwBufferSize,
    #   _In_          COORD       dwBufferCoord,
    #   _Inout_       PSMALL_RECT lpWriteRegion)
    encoded_function 'WriteConsoleOutput',
                     [:handle, CHAR_INFO.ptr(:in), COORD.ptr(:in), COORD.ptr(:in), SMALL_RECT.ptr], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687407(v=vs.85).aspx
    # BOOL WINAPI WriteConsoleOutputAttribute(
    #   _In_        HANDLE  hConsoleOutput,
    #   _In_  const WORD    *lpAttribute,
    #   _In_        DWORD   nLength,
    #   _In_        COORD   dwWriteCoord,
    #   _Out_       LPDWORD lpNumberOfAttrsWritten)
    attach_function 'WriteConsoleOutputAttribute', [:handle, :pointer, :dword, COORD.ptr(:in), :pointer], :bool

    # https://msdn.microsoft.com/en-us/library/windows/desktop/ms687410(v=vs.85).aspx
    # BOOL WINAPI WriteConsoleOutputCharacter(
    #   _In_  HANDLE  hConsoleOutput,
    #   _In_  LPCTSTR lpCharacter,
    #   _In_  DWORD   nLength,
    #   _In_  COORD   dwWriteCoord,
    #   _Out_ LPDWORD lpNumberOfCharsWritten)
    encoded_function 'WriteConsoleOutputCharacter', [:handle, :string, :dword, COORD.ptr(:in), :pointer], :bool

    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms681952(v=vs.85).aspx
      # BOOL WINAPI AttachConsole(_In_ DWORD dwProcessId)
      attach_function 'AttachConsole', [:dword], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683164(v=vs.85).aspx
      # BOOL WINAPI GetConsoleDisplayMode(_Out_ LPDWORD lpModeFlags)
      attach_function 'GetConsoleDisplayMode', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683165(v=vs.85).aspx
      # COORD WINAPI GetConsoleFontSize(_In_ HANDLE hConsoleOutput, _In_ DWORD  nFont)
      attach_function 'GetConsoleFontSize', [:handle, :dword], COORD

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683166(v=vs.85).aspx
      # BOOL WINAPI GetConsoleHistoryInfo(_Out_ PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo)
      attach_function 'GetConsoleHistoryInfo', [CONSOLE_HISTORY_INFO.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683170(v=vs.85).aspx
      # DWORD WINAPI GetConsoleProcessList(_Out_ LPDWORD lpdwProcessList, _In_  DWORD   dwProcessCount)
      attach_function 'GetConsoleProcessList', [:pointer, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683173(v=vs.85).aspx
      # BOOL WINAPI GetConsoleSelectionInfo(_Out_ PCONSOLE_SELECTION_INFO lpConsoleSelectionInfo)
      attach_function 'GetConsoleSelectionInfo', [CONSOLE_SELECTION_INFO.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683176(v=vs.85).aspx
      # BOOL WINAPI GetCurrentConsoleFont(
      #   _In_  HANDLE             hConsoleOutput,
      #   _In_  BOOL               bMaximumWindow,
      #   _Out_ PCONSOLE_FONT_INFO lpConsoleCurrentFont)
      attach_function 'GetCurrentConsoleFont', [:handle, :bool, CONSOLE_FONT_INFO.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686028(v=vs.85).aspx
      # BOOL WINAPI SetConsoleDisplayMode(
      #   _In_      HANDLE hConsoleOutput,
      #   _In_      DWORD  dwFlags,
      #   _Out_opt_ PCOORD lpNewScreenBufferDimensions)
      attach_function 'SetConsoleDisplayMode', [:handle, ConsoleDisplayMode, COORD.ptr(:out)], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683168(v=vs.85).aspx
        # DWORD WINAPI GetConsoleOriginalTitle(_Out_ LPTSTR lpConsoleTitle, _In_  DWORD  nSize)
        encoded_function 'GetConsoleOriginalTitle', [:string, :dword], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683172(v=vs.85).aspx
        # BOOL WINAPI GetConsoleScreenBufferInfoEx(
        #   _In_  HANDLE                        hConsoleOutput,
        #   _Out_ PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx)
        attach_function 'GetConsoleScreenBufferInfoEx', [:handle, CONSOLE_SCREEN_BUFFER_INFOEX.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683177(v=vs.85).aspx
        # BOOL WINAPI GetCurrentConsoleFontEx(
        #   _In_  HANDLE               hConsoleOutput,
        #   _In_  BOOL                 bMaximumWindow,
        #   _Out_ PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx)
        attach_function 'GetCurrentConsoleFontEx', [:handle, :bool, CONSOLE_FONT_INFOEX.ptr(:out)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686031(v=vs.85).aspx
        # BOOL WINAPI SetConsoleHistoryInfo(_In_ PCONSOLE_HISTORY_INFO lpConsoleHistoryInfo)
        attach_function 'SetConsoleHistoryInfo', [CONSOLE_HISTORY_INFO.ptr(:in)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686039(v=vs.85).aspx
        # BOOL WINAPI SetConsoleScreenBufferInfoEx(
        #   _In_ HANDLE                        hConsoleOutput,
        #   _In_ PCONSOLE_SCREEN_BUFFER_INFOEX lpConsoleScreenBufferInfoEx)
        attach_function 'SetConsoleScreenBufferInfoEx', [:handle, CONSOLE_SCREEN_BUFFER_INFOEX.ptr(:in)], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686200(v=vs.85).aspx
        # BOOL WINAPI SetCurrentConsoleFontEx(
        #   _In_ HANDLE               hConsoleOutput,
        #   _In_ BOOL                 bMaximumWindow,
        #   _In_ PCONSOLE_FONT_INFOEX lpConsoleCurrentFontEx)
        attach_function 'SetCurrentConsoleFontEx', [:handle, :bool, CONSOLE_FONT_INFOEX.ptr(:in)], :bool
      end
    end
  end
end