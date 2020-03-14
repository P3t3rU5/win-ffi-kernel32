module WinFFI
  if WINDOWS_VERSION >= :xp
    require 'win-ffi/core/struct/guid'

    require_relative '../enum/activation/find_actctx_section_key_return'
    require_relative '../enum/activation/query_actctx_flag'

    require_relative '../struct/actctx'
    require_relative '../struct/activation/actctx_section_keyed_data'

    module Kernel32
      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-activateactctx
      # @param [Integer] hActCtx
      # @param [FFI::Pointer] lpCookie
      # @return [true, false]
      def self.ActivateActCtx(hActCtx, lpCookie) end
      attach_function 'ActivateActCtx', [:hwnd, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-addrefactctx
      # @param [Integer] hActCtx
      # @return [nil]
      def self.AddRefActCtx(hActCtx) end
      attach_function 'AddRefActCtx', [:handle], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-createactctx
      # @param [FFI::Pointer] pActCtx
      # @return [Integer]
      def self.CreateActCtx(pActCtx) end
      encoded_function 'CreateActCtx', [ACTCTX.ptr], :handle

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-deactivateactctx
      # @param [Integer] dwFlags
      # @param [Integer] ulCookie
      # @return [true, false]
      def self.DeactivateActCtx(dwFlags, ulCookie) end
      attach_function 'DeactivateActCtx', [:dword, :ulong_ptr], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findactctxsectionguid
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpExtensionGuid
      # @param [Integer] ulSectionId
      # @param [FFI::Pointer] lpGuidToFind
      # @param [FFI::Poitner] returnedData
      # @return [true, false]
      def self.FindActCtxSectionGuid(dwFlags, lpExtensionGuid, ulSectionId, lpGuidToFind, returnedData) end
      attach_function 'FindActCtxSectionGuid',
                      [FindActctxSectionKeyReturn,
                       GUID.ptr(:in), :ulong, GUID.ptr(:in), ACTCTX_SECTION_KEYED_DATA.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-findactctxsectionstring
      # @param [Integer] dwFlags
      # @param [FFI::Pointer] lpExtensionGuid
      # @param [Integer] ulSectionId
      # @param [String] lpStringToFind
      # @param [FFI::Pointer] returnedData
      # @return [ture, false]
      def self.FindActCtxSectionString(dwFlags, lpExtensionGuid, ulSectionId, lpStringToFind, returnedData) end
      encoded_function 'FindActCtxSectionString',
                       [FindActctxSectionKeyReturn,
                        GUID.ptr(:in), :ulong, :string, ACTCTX_SECTION_KEYED_DATA.ptr(:out)], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-getcurrentactctx
      # @param [FFI::Pointer] lphActCtx
      # @return [true, false]
      def self.GetCurrentActCtx(lphActCtx) end
      attach_function 'GetCurrentActCtx', [:pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa375204(v=vs.85).aspx
      # void IsolationAwareCleanup(void)

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-queryactctxw
      # @param [Integer] dwFlags
      # @param [Integer] hActCtx
      # @param [FFI::Pointer] pvSubInstance
      # @param [Integer] ulInfoClass
      # @param [FFI::Pointer] pvBuffer
      # @param [Integer] cbBuffer
      # @param [FFI::Pointer] pcbWrittenOrRequired
      # @return [true, false]
      def self.QueryActCtxW(dwFlags, hActCtx, pvSubInstance, ulInfoClass, pvBuffer, cbBuffer, pcbWrittenOrRequired) end
      attach_function 'QueryActCtxW', [QueryActctxFlag, :handle, :pointer, :ulong, :pointer, :size_t, :pointer], :bool

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-releaseactctx
      # @param [Integer] hActCtx
      # @return [nil]
      def self.ReleaseActCtx(hActCtx) end
      attach_function 'ReleaseActCtx', [:handle], :void

      # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-zombifyactctx
      # @param [Integer] hActCtx
      # @return [true, false]
      def self.ZombifyActCtx(hActCtx) end
      attach_function 'ZombifyActCtx', [:handle], :bool

      if WINDOWS_VERSION >= :vista
        # https://docs.microsoft.com/en-us/windows/desktop/api/winbase/nf-winbase-QueryActCtxSettingsW
        # @param [Integer] dwFlags
        # @param [Integer] hActCtx
        # @param [String] settingsNameSpace
        # @param [String] settingName
        # @param [String] pvBuffer
        # @param [Integer] dwBuffer
        # @param [FFI::Pointer] pdwWrittenOrRequired
        # @return [true, false]
        def self.QueryActCtxSettingsW(
            dwFlags, hActCtx, settingsNameSpace, settingName, pvBuffer, dwBuffer, pdwWrittenOrRequired) end
        attach_function 'QueryActCtxSettingsW', [:dword, :handle, :string, :string, :string, :size_t, :pointer], :bool
      end
    end
  end
end
