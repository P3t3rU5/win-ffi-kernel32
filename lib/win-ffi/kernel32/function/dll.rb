require 'win-ffi/kernel32/base'

module WinFFI
  if WindowsVersion >= :xp

    require 'win-ffi/kernel32/enum/dll/get_module_handle_ex_flag'
    require 'win-ffi/kernel32/enum/dll/load_library_ex_flag'

    module Kernel32

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682579(v=vs.85).aspx
      # BOOL WINAPI DisableThreadLibraryCalls( _In_  HMODULE hModule )
      attach_function 'DisableThreadLibraryCalls', [:hmodule], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683152(v=vs.85).aspx
      # BOOL WINAPI FreeLibrary( _In_  HMODULE hModule )
      attach_function 'FreeLibrary', [:hmodule], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683153(v=vs.85).aspx
      # VOID WINAPI FreeLibraryAndExitThread(
      #   _In_  HMODULE hModule,
      #   _In_  DWORD dwExitCode )
      attach_function 'FreeLibraryAndExitThread', [:hmodule, :dword], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683197(v=vs.85).aspx
      # DWORD WINAPI GetModuleFileName(
      #   _In_opt_  HMODULE hModule,
      #   _Out_     LPTSTR lpFilename,
      #   _In_      DWORD nSize )
      encoded_function 'GetModuleFileName', [:hmodule, :string, :dword], :dword

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683199(v=vs.85).aspx
      # HMODULE WINAPI GetModuleHandle( _In_opt_  LPCTSTR lpModuleName )
      encoded_function 'GetModuleHandle', [:string], :hmodule

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683200(v=vs.85).aspx
      # BOOL GetModuleHandleEx(
      #   __in      DWORD dwFlags,
      #   __in_opt  LPCTSTR lpModuleName,
      #   __out     HMODULE *phModule)
      encoded_function 'GetModuleHandleEx', [GetModuleHandleExFlag, :string, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683212(v=vs.85).aspx
      # FARPROC WINAPI GetProcAddress(
      #   _In_  HMODULE hModule,
      #   _In_  LPCSTR lpProcName )
      attach_function 'GetProcAddress', [:hmodule, :string], :pointer

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684175(v=vs.85).aspx
      # HMODULE WINAPI LoadLibrary( _In_  LPCTSTR lpFileName )
      encoded_function 'LoadLibrary', [:string], :hmodule

      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684179(v=vs.85).aspx
      # HMODULE WINAPI LoadLibraryEx(
      #   _In_        LPCTSTR lpFileName,
      #   _Reserved_  HANDLE hFile,
      #   _In_        DWORD dwFlags )
      encoded_function 'LoadLibraryEx', [:string, :handle, LoadLibraryExFlag], :hmodule

      # This function is provided only for compatibility with 16-bit versions of Windows. Applications should use the
      # CreateProcess function.
      # https://msdn.microsoft.com/en-us/library/windows/desktop/ms684183(v=vs.85).aspx
      # DWORD WINAPI LoadModule(
      #   _In_  LPCSTR lpModuleName,
      #   _In_  LPVOID lpParameterBlock )
      attach_function 'LoadModule', [:string, :pointer], :dword

      if (WindowsVersion.sp >= 1 && WindowsVersion == :xp) || WindowsVersion >= :vista

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683186(v=vs.85).aspx
        # DWORD WINAPI GetDllDirectory(
        #   _In_   DWORD nBufferLength,
        #   _Out_  LPTSTR lpBuffer )
        encoded_function 'GetDllDirectory', [:dword, :pointer], :dword

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms686203(v=vs.85).aspx
        # BOOL WINAPI SetDllDirectory( _In_opt_  LPCTSTR lpPathName )
        encoded_function 'SetDllDirectory', [:string], :bool

        if WindowsVersion >= 8

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh310513(v=vs.85).aspx
          # DLL_DIRECTORY_COOKIE  WINAPI AddDllDirectory( _In_  PCWSTR NewDirectory )
          attach_function 'AddDllDirectory', [:pointer], :pointer

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh447159(v=vs.85).aspx
          # HMODULE WINAPI LoadPackagedLibrary(
          #   _In_        LPCWSTR lpwLibFileName,
          #   _Reserved_  DWORD Reserved )
          attach_function 'LoadPackagedLibrary', [:string, :dword], :hmodule

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh310514(v=vs.85).aspx
          # BOOL  WINAPI RemoveDllDirectory( _In_  DLL_DIRECTORY_COOKIE Cookie )
          attach_function 'RemoveDllDirectory', [:pointer], :bool

          # https://msdn.microsoft.com/en-us/library/windows/desktop/hh310515(v=vs.85).aspx
          # BOOL  WINAPI SetDefaultDllDirectories( _In_  DWORD DirectoryFlags )
          attach_function 'SetDefaultDllDirectories', [:dword], :bool
        end
      end
    end

    #BOOL WINAPI DllMain(
    #  _In_  HINSTANCE hinstDLL,
    #  _In_  DWORD fdwReason,
    #  _In_  LPVOID lpvReserved )
    # attach_function 'DllMain', [:hinstance, :dword, :pointer], :bool

  end
end