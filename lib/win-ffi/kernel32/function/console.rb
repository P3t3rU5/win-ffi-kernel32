require 'win-ffi/core/struct/security_attributes'

require_relative '../enum/console/textmode_flag'
require_relative '../enum/console/display_mode'
require_relative '../enum/console/control_event'
require_relative '../enum/file_management/file_share_flag'
require_relative '../enum/generic_flag'
require_relative '../enum/console/standard_handle'

require_relative '../struct/console/coord'
require_relative '../struct/console/screen_buffer_info'
require_relative '../struct/console/cursor_info'
require_relative '../struct/console/history_info'
require_relative '../struct/console/selection_info'
require_relative '../struct/console/font_info'
require_relative '../struct/console/font_infoex'
require_relative '../struct/console/screen_buffer_infoex'
require_relative '../struct/console/input_record'
require_relative '../struct/console/char_info'
require_relative '../struct/console/small_rect'

module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/console/handlerroutine
    # BOOL HandlerRoutine(_In_ DWORD dwCtrlType)
    HandlerRoutine = callback 'HandlerRoutine', [ControlEvent], :bool

    # https://docs.microsoft.com/en-us/windows/console/addconsolealias
    # @param [String] source
    # @param [String] target
    # @param [String] exeName
    # @return [true, false]
    def self.AddConsoleAlias(source, target, exeName) end
    encoded_function 'AddConsoleAlias', %i[string string string], :bool

    # https://docs.microsoft.com/en-us/windows/console/AllocConsole
    # @return [true, false]
    def self.AllocConsole; end
    attach_function 'AllocConsole', [], :bool

    # https://docs.microsoft.com/en-us/windows/console/CreateConsoleScreenBuffer
    # @param [Integer] dwDesiredAccess
    # @param [Integer] dwShareMode
    # @param [FFI::Pointer] lpSecurityAttributes
    # @param [Integer] dwFlags
    # @param [FFI::Pointer] lpScreenBufferData
    # @return [Integer]
    def self.CreateConsoleScreenBuffer(dwDesiredAccess, dwShareMode, lpSecurityAttributes, dwFlags, lpScreenBufferData); end
    attach_function 'CreateConsoleScreenBuffer',
                    [GenericFlag, FileShareFlag, SECURITY_ATTRIBUTES.ptr(:in), ConsoleTextmodeFlag, :pointer],
                    :handle

    # https://docs.microsoft.com/en-us/windows/console/FillConsoleOutputAttribute
    # @param [Integer] hConsoleOutput
    # @param [Integer] wAttribute
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwWriteCoord
    # @param [FFI::Pointer] lpNumberOfAttrsWritten
    # @return [true, false]
    def self.FillConsoleOutputAttribute(hConsoleOutput, wAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten) end
    attach_function 'FillConsoleOutputAttribute', [:handle, :word, :dword, COORD.ptr(:in), :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/FillConsoleOutputCharacter
    # @param [Integer] hConsoleOutput
    # @param [String] cCharacter
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwWriteCoord
    # @param [FFI::Pointer] lpNumberOfCharsWritten
    # @return [true, false]
    def self.FillConsoleOutputCharacter(hConsoleOutput, cCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten) end
    encoded_function 'FillConsoleOutputCharacter', [:handle, :tchar, :dword, COORD.ptr(:in), :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/FlushConsoleInputBuffer
    # @param [Integer] hConsoleInput
    # @return [true, false]
    def self.FlushConsoleInputBuffer(hConsoleInput) end
    attach_function 'FlushConsoleInputBuffer', [:handle], :bool

    # https://docs.microsoft.com/en-us/windows/console/FreeConsole
    # @return [true, false]
    def self.FreeConsole; end
    attach_function 'FreeConsole', [], :bool

    # https://docs.microsoft.com/en-us/windows/console/GenerateConsoleCtrlEvent
    # @param [Integer] dwCtrlEvent
    # @param [Integer] dwProcessGroupId
    # @return [true, false]
    def self.GenerateConsoleCtrlEvent(dwCtrlEvent, dwProcessGroupId) end
    attach_function 'GenerateConsoleCtrlEvent', [ControlEvent, :dword], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleAlias
    # @param [String] lpSource
    # @param [String] lpTargetBuffer
    # @param [Integer] targetBufferLength
    # @param [String] lpExeName
    # @return [Integer]
    def self.GetConsoleAlias(lpSource, lpTargetBuffer, targetBufferLength, lpExeName) end
    encoded_function 'GetConsoleAlias', %i[string string dword string], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleAliases
    # @param [String] lpAliasBuffer
    # @param [Integer] aliasBufferLength
    # @param [String] lpExeName
    # @return [Integer]
    def self.GetConsoleAliases(lpAliasBuffer, aliasBufferLength, lpExeName) end
    encoded_function 'GetConsoleAliases', %i[string dword string], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleAliasesLength
    # @param [String] lpExeName
    # @return [Integer]
    def self.GetConsoleAliasesLength(lpExeName) end
    encoded_function 'GetConsoleAliasesLength', [:string], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleAliasExes
    # @param [String] lpExeNameBuffer
    # @param [Integer] exeNameBufferLength
    # @return [Integer]
    def self.GetConsoleAliasExes(lpExeNameBuffer, exeNameBufferLength) end
    encoded_function 'GetConsoleAliasExes', %i[string dword], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleAliasExesLength
    # @return [Integer]
    def self.GetConsoleAliasExesLength; end
    encoded_function 'GetConsoleAliasExesLength', [], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleCP
    # @return [Integer]
    def self.GetConsoleCP; end
    attach_function 'GetConsoleCP', [], :uint

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleCursorInfo
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpConsoleCursorInfo
    # @return [true, false]
    def self.GetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) end
    attach_function 'GetConsoleCursorInfo', [:handle, CONSOLE_CURSOR_INFO.ptr(:out)], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleMode
    # @param [Integer] hConsoleHandle
    # @param [FFI::Pointer] lpMode
    # @return [true, false]
    def self.GetConsoleMode(hConsoleHandle, lpMode) end
    attach_function 'GetConsoleMode', %i[handle pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleOutputCP
    # @return [Integer]
    def self.GetConsoleOutputCP; end
    attach_function 'GetConsoleOutputCP', [], :uint

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleScreenBufferInfo
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpConsoleScreenBufferInfo
    # @return [true, false]
    def self.GetConsoleScreenBufferInfo(hConsoleOutput, lpConsoleScreenBufferInfo) end
    attach_function 'GetConsoleScreenBufferInfo', [:handle, CONSOLE_SCREEN_BUFFER_INFO.ptr(:out)], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleTitle
    # @param [String] lpConsoleTitle
    # @param [Integer] nSize
    # @return [Integer]
    def self.GetConsoleTitle(lpConsoleTitle, nSize) end
    encoded_function 'GetConsoleTitle', %i[string dword], :dword

    # https://docs.microsoft.com/en-us/windows/console/GetConsoleWindow
    # @return [Integer]
    def self.GetConsoleWindow; end
    attach_function 'GetConsoleWindow', [], :hwnd

    # https://docs.microsoft.com/en-us/windows/console/GetLargestConsoleWindowSize
    # @param [Integer] hConsoleOutput
    # @return [WinFFI::COORD]
    def self.GetLargestConsoleWindowSize(hConsoleOutput) end
    attach_function 'GetLargestConsoleWindowSize', [:handle], COORD

    # https://docs.microsoft.com/en-us/windows/console/GetNumberOfConsoleInputEvents
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpcNumberOfEvents
    # @return [true, false]
    def self.GetNumberOfConsoleInputEvents(hConsoleInput, lpcNumberOfEvents) end
    attach_function 'GetNumberOfConsoleInputEvents', %i[handle pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetNumberOfConsoleMouseButtons
    # @param [FFI::Pointer] lpNumberOfMouseButtons
    # @return [true, false]
    def self.GetNumberOfConsoleMouseButtons(lpNumberOfMouseButtons) end
    attach_function 'GetNumberOfConsoleMouseButtons', [:pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/GetStdHandle
    # @param [Integer] nStdHandle
    # @return [Integer]
    def self.GetStdHandle(nStdHandle) end
    attach_function 'GetStdHandle', [StandardHandle], :handle

    # https://docs.microsoft.com/en-us/windows/console/PeekConsoleInput
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] nLength
    # @param [FFI::Pointer] lpNumberOfEventsRead
    # @return [true, false]
    def self.PeekConsoleInput(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) end
    encoded_function 'PeekConsoleInput', [:handle, INPUT_RECORD.ptr(:out), :dword, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/ReadConsole
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] nNumberOfCharsToRead
    # @param [FFI::Pointer] lpNumberOfCharsRead
    # @param [FFI::Pointer] pInputControl
    # @return [true, false]
    def self.ReadConsole(hConsoleInput, lpBuffer, nNumberOfCharsToRead, lpNumberOfCharsRead, pInputControl) end
    encoded_function 'ReadConsole', %i[handle pointer dword pointer pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/ReadConsoleInput
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] nLength
    # @param [FFI::Pointer] lpNumberOfEventsRead
    # @return [true, false]
    def self.ReadConsoleInput(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsRead) end
    encoded_function 'ReadConsoleInput', [:handle, INPUT_RECORD.ptr(:out), :dword, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/ReadConsoleOutput
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpBuffer
    # @param [FFI::Pointer] dwBufferSize
    # @param [FFI::Pointer] dwBufferCoord
    # @param [FFI::Pointer] lpReadRegion
    # @return [true, false]
    def self.ReadConsoleOutput(hConsoleInput, lpBuffer, dwBufferSize, dwBufferCoord, lpReadRegion) end
    encoded_function 'ReadConsoleOutput',
                     [:handle, CHAR_INFO.ptr(:out), COORD.ptr(:in), COORD.ptr(:in), SMALL_RECT.ptr], :bool

    # https://docs.microsoft.com/en-us/windows/console/ReadConsoleOutputAttribute
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpAttribute
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwReadCoord
    # @param [FFI::Pointer] lpNumberOfAttrsRead
    # @return [true, false]
    def self.ReadConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwReadCoord, lpNumberOfAttrsRead) end
    attach_function 'ReadConsoleOutputAttribute', [:handle, :pointer, :dword, COORD.ptr(:in), :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/ReadConsoleOutputCharacter
    # @param [Integer] hConsoleOutput
    # @param [String] lpCharacter
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwReadCoord
    # @param [FFI::Pointer] lpNumberOfCharsRead
    # @return [true, false]
    def self.ReadConsoleOutputCharacter(hConsoleOutput, lpCharacter, nLength, dwReadCoord, lpNumberOfCharsRead) end
    encoded_function 'ReadConsoleOutputCharacter', [:handle, :string, :dword, COORD.ptr(:in), :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/ScrollConsoleScreenBuffer
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpScrollRectangle
    # @param [FFI::Pointer] lpClipRectangle
    # @param [FFI::Pointer] dwDestinationOrigin
    # @param [FFI::Pointer] lpFill
    # @return [true, false]
    def self.ScrollConsoleScreenBuffer(hConsoleOutput, lpScrollRectangle, lpClipRectangle, dwDestinationOrigin, lpFill); end
    encoded_function 'ScrollConsoleScreenBuffer',
                     [:handle, SMALL_RECT.ptr(:in), SMALL_RECT.ptr, COORD.ptr(:in), CHAR_INFO.ptr(:in)], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleActiveScreenBuffer
    # @param [Integer] hConsoleOutput
    # @return [true, false]
    def self.SetConsoleActiveScreenBuffer(hConsoleOutput) end
    attach_function 'SetConsoleActiveScreenBuffer', [:handle], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleCP
    # @param [Integer] wCodePageID
    # @return [true, false]
    def self.SetConsoleCP(wCodePageID) end
    attach_function 'SetConsoleCP', [:uint], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleCtrlHandler
    # @param [Integer] handlerRoutine
    # @param [true, false] add
    # @return [true, false]
    def self.SetConsoleCtrlHandler(handlerRoutine, add) end
    attach_function 'SetConsoleCtrlHandler', [HandlerRoutine, :bool], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleCursorInfo
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpConsoleCursorInfo
    # @return [true, false]
    def self.SetConsoleCursorInfo(hConsoleOutput, lpConsoleCursorInfo) end
    attach_function 'SetConsoleCursorInfo', [:handle, CONSOLE_CURSOR_INFO.ptr(:in)], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleCursorPosition
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] dwCursorPosition
    # @return [true, false]
    def self.SetConsoleCursorPosition(hConsoleOutput, dwCursorPosition) end
    attach_function 'SetConsoleCursorPosition', [:handle, COORD.ptr(:in)], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleMode
    # @param [Integer] hConsoleHandle
    # @param [Integer] dwMode
    # @return [true, false]
    def self.SetConsoleMode(hConsoleHandle, dwMode) end
    attach_function 'SetConsoleMode', %i[handle dword], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleOutputCP
    # @param [Integer] wCodePageID
    # @return [true, false]
    def self.SetConsoleOutputCP(wCodePageID) end
    attach_function 'SetConsoleOutputCP', [:uint], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleScreenBufferSize
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] dwSize
    # @return [true, false]
    def self.SetConsoleScreenBufferSize(hConsoleOutput, dwSize) end
    attach_function 'SetConsoleScreenBufferSize', [:handle, COORD.ptr(:in)], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleTextAttribute
    # @param [Integer] hConsoleOutput
    # @param [Integer] wAttributes
    # @return [true, false]
    def self.SetConsoleTextAttribute(hConsoleOutput, wAttributes) end
    attach_function 'SetConsoleTextAttribute', %i[handle word], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleTitle
    # @param [String] lpConsoleTitle
    # @return [true, false]
    def self.SetConsoleTitle(lpConsoleTitle) end
    encoded_function 'SetConsoleTitle', [:string], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetConsoleWindowInfo
    # @param [Integer] hConsoleOutput
    # @param [true, false] bAbsolute
    # @param [FFI::Pointer] lpConsoleWindow
    # @return [true, false]
    def self.SetConsoleWindowInfo(hConsoleOutput, bAbsolute, lpConsoleWindow) end
    attach_function 'SetConsoleWindowInfo', [:handle, :bool, SMALL_RECT.ptr(:in)], :bool

    # https://docs.microsoft.com/en-us/windows/console/SetStdHandle
    # @param [Integer] nStdHandle
    # @param [Integer] hHandle
    # @return [true, false]
    def self.SetStdHandle(nStdHandle, hHandle) end
    attach_function 'SetStdHandle', %i[dword handle], :bool

    # https://docs.microsoft.com/en-us/windows/console/WriteConsole
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] nNumberOfCharsToWrite
    # @param [FFI::Pointer] lpNumberOfCharsWritten
    # @param [FFI::Pointer] lpReserved
    # @return [true, false]
    def self.WriteConsole(hConsoleOutput, lpBuffer, nNumberOfCharsToWrite, lpNumberOfCharsWritten, lpReserved) end
    encoded_function 'WriteConsole', %i[handle pointer dword pointer pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/WriteConsoleInput
    # @param [Integer] hConsoleInput
    # @param [FFI::Pointer] lpBuffer
    # @param [Integer] nLength
    # @param [FFI::Pointer] lpNumberOfEventsWritten
    # @return [true, false]
    def self.WriteConsoleInput(hConsoleInput, lpBuffer, nLength, lpNumberOfEventsWritten) end
    encoded_function 'WriteConsoleInput', [:handle, INPUT_RECORD.ptr(:in), :dword, :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/WriteConsoleOutput
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpBuffer
    # @param [FFI::Pointer] dwBufferSize
    # @param [FFI::Pointer] dwBufferCoord
    # @param [FFI::Pointer] lpWriteRegion
    # @return [true, false]
    def self.WriteConsoleOutput(hConsoleOutput, lpBuffer, dwBufferSize, dwBufferCoord, lpWriteRegion) end
    encoded_function 'WriteConsoleOutput',
                     [:handle, CHAR_INFO.ptr(:in), COORD.ptr(:in), COORD.ptr(:in), SMALL_RECT.ptr], :bool

    # https://docs.microsoft.com/en-us/windows/console/WriteConsoleOutputAttribute
    # @param [Integer] hConsoleOutput
    # @param [FFI::Pointer] lpAttribute
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwWriteCoord
    # @param [FFI::Pointer] lpNumberOfAttrsWritten
    # @return [true, false]
    def self.WriteConsoleOutputAttribute(hConsoleOutput, lpAttribute, nLength, dwWriteCoord, lpNumberOfAttrsWritten); end
    attach_function 'WriteConsoleOutputAttribute', [:handle, :pointer, :dword, COORD.ptr(:in), :pointer], :bool

    # https://docs.microsoft.com/en-us/windows/console/WriteConsoleOutputCharacter
    # @param [Integer] hConsoleOutput
    # @param [String] lpCharacter
    # @param [Integer] nLength
    # @param [FFI::Pointer] dwWriteCoord
    # @param [FFI::Pointer] lpNumberOfCharsWritten
    # @return [true, false]
    def self.WriteConsoleOutputCharacter(hConsoleOutput, lpCharacter, nLength, dwWriteCoord, lpNumberOfCharsWritten); end
    encoded_function 'WriteConsoleOutputCharacter', [:handle, :string, :dword, COORD.ptr(:in), :pointer], :bool

    if WINDOWS_VERSION >= :xp
      # https://docs.microsoft.com/en-us/windows/console/attachconsole
      # @param [Integer] dwProcessId
      # @return [true, false]
      def self.AttachConsole(dwProcessId) end
      attach_function 'AttachConsole', [:dword], :bool

      # https://docs.microsoft.com/en-us/windows/console/GetConsoleDisplayMode
      # @param [FFI::Pointer] lpModeFlags
      # @return [true, false]
      def self.GetConsoleDisplayMode(lpModeFlags) end
      attach_function 'GetConsoleDisplayMode', [:pointer], :bool

      # https://docs.microsoft.com/en-us/windows/console/GetConsoleFontSize
      # COORD GetConsoleFontSize(_In_ HANDLE hConsoleOutput, _In_ DWORD  nFont)
      # @param [Integer] hConsoleOutput
      # @param [Integer] nFont
      # @return [COORD]
      def self.GetConsoleFontSize(hConsoleOutput, nFont) end
      attach_function 'GetConsoleFontSize', [:handle, :dword], COORD

      # https://docs.microsoft.com/en-us/windows/console/GetConsoleHistoryInfo
      # @param [FFI::Pointer] lpConsoleHistoryInfo
      # @return [true, false]
      def self.GetConsoleHistoryInfo(lpConsoleHistoryInfo) end
      attach_function 'GetConsoleHistoryInfo', [CONSOLE_HISTORY_INFO.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/console/GetConsoleProcessList
      # @param [FFI::Pointer] lpdwProcessList
      # @param [Integer] dwProcessCount
      # @return [Integer]
      def self.GetConsoleProcessList(lpdwProcessList, dwProcessCount) end
      attach_function 'GetConsoleProcessList', [:pointer, :dword], :dword

      # https://docs.microsoft.com/en-us/windows/console/GetConsoleSelectionInfo
      # @param [FFI::Pointer] lpConsoleSelectionInfo
      # @return [true, false]
      def self.GetConsoleSelectionInfo(lpConsoleSelectionInfo) end
      attach_function 'GetConsoleSelectionInfo', [CONSOLE_SELECTION_INFO.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/console/GetCurrentConsoleFont
      # @param [Integer] hConsoleOutput
      # @param [true, false] bMaximumWindow
      # @param [FFI::Pointer] lpConsoleCurrentFont
      # @return [true, false]
      def self.GetCurrentConsoleFont(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFont) end
      attach_function 'GetCurrentConsoleFont', [:handle, :bool, CONSOLE_FONT_INFO.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/console/SetConsoleDisplayMode
      # @param [Integer] hConsoleOutput
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpNewScreenBufferDimensions
      # @return [true, false]
      def self.SetConsoleDisplayMode(hConsoleOutput, dwFlags, lpNewScreenBufferDimensions) end
      attach_function 'SetConsoleDisplayMode', [:handle, ConsoleDisplayMode, COORD.ptr(:out)], :bool

      if WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/console/getconsoleoriginaltitle
        # @param [String] lpConsoleTitle
        # @param [Integer] nSize
        # @return [Integer]
        def self.GetConsoleOriginalTitle(lpConsoleTitle, nSize) end
        encoded_function 'GetConsoleOriginalTitle', [:string, :dword], :dword

        # https://docs.microsoft.com/en-us/windows/console/GetConsoleScreenBufferInfoEx
        # @param [Integer] hConsoleOutput
        # @param [FFI::Pointer] lpConsoleScreenBufferInfoEx
        # @return [true, false]
        def self.GetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) end
        attach_function 'GetConsoleScreenBufferInfoEx', [:handle, CONSOLE_SCREEN_BUFFER_INFOEX.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/console/GetCurrentConsoleFontEx
        # @param [Integer] hConsoleOutput
        # @param [true, false] bMaximumWindow
        # @param [FFI::Pointer] lpConsoleCurrentFontEx
        # @return [true, false]
        def self.GetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) end
        attach_function 'GetCurrentConsoleFontEx', [:handle, :bool, CONSOLE_FONT_INFOEX.ptr(:out)], :bool

        # https://docs.microsoft.com/en-us/windows/console/SetConsoleHistoryInfo
        # @param [FFI::Pointer] lpConsoleHistoryInfo
        # @return [true, false]
        def self.SetConsoleHistoryInfo(lpConsoleHistoryInfo) end
        attach_function 'SetConsoleHistoryInfo', [CONSOLE_HISTORY_INFO.ptr(:in)], :bool

        # https://docs.microsoft.com/en-us/windows/console/SetConsoleScreenBufferInfoEx
        # @param [Integer] hConsoleOutput
        # @param [FFI::Pointer] lpConsoleScreenBufferInfoEx
        # @return [true, false]
        def self.SetConsoleScreenBufferInfoEx(hConsoleOutput, lpConsoleScreenBufferInfoEx) end
        attach_function 'SetConsoleScreenBufferInfoEx', [:handle, CONSOLE_SCREEN_BUFFER_INFOEX.ptr(:in)], :bool

        # https://docs.microsoft.com/en-us/windows/console/SetCurrentConsoleFontEx
        # @param [Integer] hConsoleOutput
        # @param [true, false] bMaximumWindow
        # @param [FFI::Pointer] lpConsoleCurrentFontEx
        # @return [true, false]
        def self.SetCurrentConsoleFontEx(hConsoleOutput, bMaximumWindow, lpConsoleCurrentFontEx) end
        attach_function 'SetCurrentConsoleFontEx', [:handle, :bool, CONSOLE_FONT_INFOEX.ptr(:in)], :bool
      end
    end
  end
end