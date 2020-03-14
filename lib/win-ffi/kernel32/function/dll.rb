module WinFFI
  module Kernel32
    # https://docs.microsoft.com/en-us/windows/desktop/DevNotes/delayloadfailurehook
    # FARPROC DelayLoadFailureHook(_In_ LPCSTR pszDllName, _In_ LPCSTR pszProcName)
    # @param [String] pszDllName
    # @param [String] pszProcName
    # @return [FFI::Pointer]
    def self.DelayLoadFailureHook(pszDllName, pszProcName) end
    attach_function 'DelayLoadFailureHook', [:string, :string], :pointer

    if WINDOWS_VERSION >= :xp
      require_relative '../enum/dll/get_module_handle_ex_flag'
      require_relative '../enum/dll/load_library_ex_flag'

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682579(v=vs.85).aspx
      # @param [Integer] hModule
      # @return [true, false]
      def self.DisableThreadLibraryCalls(hModule) end
      attach_function 'DisableThreadLibraryCalls', [:hmodule], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683152(v=vs.85).aspx
      # @param [Integer] hModule
      # @return [true, false]
      def self.FreeLibrary(hModule) end
      attach_function 'FreeLibrary', [:hmodule], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683153(v=vs.85).aspx
      # @param [Integer] hModule
      # @param [Integer] dwExitCode
      # @return [nil]
      def self.FreeLibraryAndExitThread(hModule, dwExitCode) end
      attach_function 'FreeLibraryAndExitThread', [:hmodule, :dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683197(v=vs.85).aspx
      # @param [Integer] hModule
      # @param [String] lpFilename
      # @param [Integer] nSize
      # @return [Integer]
      def self.GetModuleFileName(hModule, lpFilename, nSize) end
      encoded_function 'GetModuleFileName', [:hmodule, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683199(v=vs.85).aspx
      # @param [String] lpModuleName
      # @return [Integer]
      def self.GetModuleHandle(lpModuleName) end
      encoded_function 'GetModuleHandle', [:string], :hmodule

      # https://docs.microsoft.com/en-gb/windows/desktop/api/libloaderapi/nf-libloaderapi-getmodulehandleexa
      # @param [Integer] dwFlags
      # @param [String] lpModuleName
      # @param [FFI::Pointer] phModule
      # @return [true, false]
      def self.GetModuleHandleEx(dwFlags, lpModuleName, phModule) end
      encoded_function 'GetModuleHandleEx', [GetModuleHandleExFlag, :string, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683212(v=vs.85).aspx
      # @param [Integer] hModule
      # @param [String] lpProcName
      # @return [FFI::Pointer]
      def self.GetProcAddress(hModule, lpProcName) end
      attach_function 'GetProcAddress', [:hmodule, :string], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684175(v=vs.85).aspx
      # @param [String] lpFileName
      # @return [Integer]
      def self.LoadLibrary(lpFileName) end
      encoded_function 'LoadLibrary', [:string], :hmodule

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684179(v=vs.85).aspx
      # @param [String] lpFileName
      # @param [Integer] hFile
      # @param [Integer] dwFlags
      # @return [Integer]
      def self.LoadLibraryEx(lpFileName, hFile, dwFlags) end
      encoded_function 'LoadLibraryEx', [:string, :handle, LoadLibraryExFlag], :hmodule

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684183(v=vs.85).aspx
      # This function is provided only for compatibility with 16-bit versions of Windows. Applications should use the
      # CreateProcess function.
      # @param [String] lpModuleName
      # @param [FFI::Pointer] lpParameterBlock
      # @return [Integer]
      def self.LoadModule(lpModuleName, lpParameterBlock) end
      attach_function 'LoadModule', [:string, :pointer], :dword

      if (WINDOWS_VERSION.sp >= 1 && WINDOWS_VERSION == :xp) || WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getdlldirectorya
        # @param [Integer] nBufferLength
        # @param [FFI::Pointer] lpBuffer
        # @return [Integer]
        def self.GetDllDirectory(nBufferLength, lpBuffer) end
        encoded_function 'GetDllDirectory', [:dword, :pointer], :dword

        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-SetDllDirectorya
        # @param [String] lpPathName
        # @return [true, false]
        def self.SetDllDirectory(lpPathName) end
        encoded_function 'SetDllDirectory', [:string], :bool

        if WINDOWS_VERSION >= 8
          # https://docs.microsoft.com/en-us/windows/desktop/api/libloaderapi/nf-libloaderapi-adddlldirectory
          # @param [FFI::Pointer] newDirectory
          # @return [FFI::Pointer]
          def self.AddDllDirectory(newDirectory) end
          attach_function 'AddDllDirectory', [:pointer], :pointer

          # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-loadpackagedlibrary
          # @param [String] lpwLibFileName
          # @param [Integer] reserved
          # @return [Integer]
          def self.LoadPackagedLibrary(lpwLibFileName, reserved) end
          attach_function 'LoadPackagedLibrary', [:string, :dword], :hmodule

          # https://docs.microsoft.com/en-us/windows/desktop/api/libloaderapi/nf-libloaderapi-RemoveDllDirectory
          # @param [FFI::Pointer] cookie
          # @return [true, false]
          def self.RemoveDllDirectory(cookie) end
          attach_function 'RemoveDllDirectory', [:pointer], :bool

          # https://docs.microsoft.com/en-us/windows/desktop/api/libloaderapi/nf-libloaderapi-SetDefaultDllDirectories
          # @param [Integer] directoryFlags
          # @return [true, false]
          def self.SetDefaultDllDirectories(directoryFlags) end
          attach_function 'SetDefaultDllDirectories', [:dword], :bool
        end
      end
    end

    #BOOL DllMain(
    #  _In_  HINSTANCE hinstDLL,
    #  _In_  DWORD fdwReason,
    #  _In_  LPVOID lpvReserved )
    # attach_function 'DllMain', [:hinstance, :dword, :pointer], :bool

  end
end