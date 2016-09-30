require 'win-ffi/kernel32/enum/activation/find_actctx_section_key_return'
require 'win-ffi/kernel32/enum/activation/query_actctx_flag'

require 'win-ffi/core/struct/guid'

require 'win-ffi/kernel32/struct/actctx'
require 'win-ffi/kernel32/struct/activation/actctx_section_keyed_data'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa374151(v=vs.85).aspx
      # BOOL ActivateActCtx(_In_   HANDLE hActCtx, _Out_  ULONG_PTR *lpCookie)
      attach_function 'ActivateActCtx', [:hwnd, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa374171(v=vs.85).aspx
      # void AddRefActCtx(_In_  HANDLE hActCtx)
      attach_function 'AddRefActCtx', [ACTCTX.ptr(:in)], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375125(v=vs.85).aspx
      # HANDLE CreateActCtx(_Inout_  PACTCTX pActCtx)
      encoded_function 'CreateActCtx', [ACTCTX.ptr], :handle

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375140(v=vs.85).aspx
      # BOOL DeactivateActCtx(_In_  DWORD dwFlags, _In_  ULONG_PTR ulCookie)
      attach_function 'DeactivateActCtx', [:dword, :pointer], :bool

      # BOOL FindActCtxSectionGuid(
      #   _In_        DWORD                      dwFlags,
      #   _In_  const GUID                       *lpExtensionGuid,
      #   _In_        ULONG                      ulSectionId,
      #   _In_  const GUID                       *lpGuidToFind,
      #   _Out_       PACTCTX_SECTION_KEYED_DATA ReturnedData)
      attach_function 'FindActCtxSectionGuid',
                      [FindActctxSectionKeyReturn,
                       GUID.ptr(:in), :ulong, GUID.ptr(:in), ACTCTX_SECTION_KEYED_DATA.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375149(v=vs.85).aspx
      # BOOL FindActCtxSectionString(
      #   _In_        DWORD                      dwFlags,
      #   _In_  const GUID                       *lpExtensionGuid,
      #   _In_        ULONG                      ulSectionId,
      #   _In_        LPCTSTR                    lpStringToFind,
      #   _Out_       PACTCTX_SECTION_KEYED_DATA ReturnedData)
      encoded_function 'FindActCtxSectionString',
                       [FindActctxSectionKeyReturn,
                        GUID.ptr(:in), :ulong, :string, ACTCTX_SECTION_KEYED_DATA.ptr(:out)], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375152(v=vs.85).aspx
      # BOOL GetCurrentActCtx(_Out_ HANDLE *lphActCtx)
      attach_function 'GetCurrentActCtx', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375204(v=vs.85).aspx
      # void IsolationAwareCleanup(void)

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375704(v=vs.85).aspx
      # BOOL QueryActCtxW(
      #   _In_      DWORD  dwFlags,
      #   _In_      HANDLE hActCtx,
      #   _In_opt_  PVOID  pvSubInstance,
      #   _In_      ULONG  ulInfoClass,
      #   _Out_     PVOID  pvBuffer,
      #   _In_opt_  SIZE_T cbBuffer,
      #   _Out_opt_ SIZE_T *pcbWrittenOrRequired)
      attach_function 'QueryActCtxW', [QueryActctxFlag, :handle, :pointer, :ulong, :pointer, :size_t, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375713(v=vs.85).aspx
      # void ReleaseActCtx(_In_ HANDLE hActCtx)
      attach_function 'ReleaseActCtx', [:handle], :void

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa376622(v=vs.85).aspx
      # BOOL ZombifyActCtx(_In_ HANDLE hActCtx)
      attach_function 'ZombifyActCtx', [:handle], :bool

      if WindowsVersion >= :vista
        # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375700(v=vs.85).aspx
        # BOOL QueryActCtxSettingsW(
        #   _In_opt_  DWORD  dwFlags,
        #   _In_opt_  HANDLE hActCtx,
        #   _In_opt_  PCWSTR settingsNameSpace,
        #   _In_      PCWSTR settingName,
        #   _Out_     PWSTR  pvBuffer,
        #   _In_      SIZE_T dwBuffer,
        #   _Out_opt_ SIZE_T *pdwWrittenOrRequired)
        attach_function 'QueryActCtxSettingsW', [:dword, :handle, :string, :string, :string, :size_t, :pointer], :bool
      end
    end
  end
end