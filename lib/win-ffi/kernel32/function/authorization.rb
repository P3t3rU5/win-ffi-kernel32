require 'win-ffi/kernel32/enum/authorization/ace_flag'

require 'win-ffi/kernel32/struct/authorization/claim_security_attributes_information'
require 'win-ffi/kernel32/struct/authorization/acl'

module WinFFI
  module Kernel32
    if WindowsVersion >= :xp
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379295(v=vs.85).aspx
      # BOOL WINAPI OpenProcessToken(
      #   _In_  HANDLE  ProcessHandle,
      #   _In_  DWORD   DesiredAccess,
      #   _Out_ PHANDLE TokenHandle)
      attach_function 'OpenProcessToken', [:handle, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379296(v=vs.85).aspx
      # BOOL WINAPI OpenThreadToken(
      #   _In_  HANDLE  ThreadHandle,
      #   _In_  DWORD   DesiredAccess,
      #   _In_  BOOL    OpenAsSelf,
      #   _Out_ PHANDLE TokenHandle)
      attach_function 'OpenThreadToken', [:handle, :dword, :bool, :pointer], :bool

      if WindowsVersion >= 8
        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448447(v=vs.85).aspx
        # BOOL WINAPI AddResourceAttributeAce(
        #   _Inout_ PACL                                   pAcl,
        #   _In_    DWORD                                  dwAceRevision,
        #   _In_    DWORD                                  AceFlags,
        #   _In_    DWORD                                  AccessMask,
        #   _In_    PSID                                   pSid,
        #   _In_    PCLAIM_SECURITY_ATTRIBUTES_INFORMATION pAttributeInfo,
        #   _Out_   PDWORD                                 pReturnLength)
        attach_function 'AddResourceAttributeAce',
                        [ACL.ptr, :dword, AceFlag, :dword, :pointer, CLAIM_SECURITY_ATTRIBUTES_INFORMATION.ptr(:in),
                         :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448448(v=vs.85).aspx
        # BOOL WINAPI AddScopedPolicyIDAce(
        #   _Inout_ PACL  pAcl,
        #   _In_    DWORD dwAceRevision,
        #   _In_    DWORD AceFlags,
        #   _In_    DWORD AccessMask,
        #   _In_    PSID  pSid)
        attach_function 'AddScopedPolicyIDAce', [ACL.ptr, :dword, AceFlag, :dword, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448477(v=vs.85).aspx
        # BOOL WINAPI CheckTokenCapability(
        #   _In_opt_ HANDLE TokenHandle,
        #   _In_     PSID   CapabilitySidToCheck,
        #   _Out_    PBOOL  HasCapability)
        attach_function 'CheckTokenCapability', [:handle, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448479(v=vs.85).aspx
        # BOOL APIENTRY CheckTokenMembershipEx(
        #   _In_opt_ HANDLE TokenHandle,
        #   _In_     PSID   SidToCheck,
        #   _In_     DWORD  Flags,
        #   _Out_    PBOOL  IsMember)
        attach_function 'CheckTokenMembershipEx', [:handle, :pointer, :dword, :pointer], :bool

        # BOOL GetAppContainerAce(
        #   _In_ PACL Acl,
        #   _In_ DWORD StartingAceIndex,
        #   _Outptr_ PVOID * AppContainerAce,
        #   _Out_opt_ DWORD * AppContainerAceIndex)
        attach_function 'GetAppContainerAce', [ACL.ptr(:in), :dword, :pointer, :pointer], :bool

        # https://msdn.microsoft.com/en-us/library/windows/desktop/hh448493(v=vs.85).aspx
        # BOOL GetAppContainerNamedObjectPath(
        #   _In_opt_  HANDLE Token,
        #   _In_opt_  PSID   AppContainerSid,
        #   _In_      ULONG  ObjectPathLength,
        #   _Out_opt_ LPWSTR ObjectPath,
        #   _Out_     PULONG ReturnLength)
        attach_function 'GetAppContainerNamedObjectPath', [:handle, :pointer, :ulong, :string, :pointer], :bool

        # BOOL GetCachedSigningLevel(
        #   _In_ HANDLE File,
        #   _Out_ PULONG Flags,
        #   _Out_ PULONG SigningLevel,
        #   _Out_writes_bytes_to_opt_(*ThumbprintSize, *ThumbprintSize) PUCHAR Thumbprint,
        #   _Inout_opt_ PULONG ThumbprintSize,
        #   _Out_opt_ PULONG ThumbprintAlgorithm)
        attach_function 'GetCachedSigningLevel', [:handle, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
      end
    end
  end
end