module WinFFI
  if WINDOWS_VERSION >= :xp
    require_relative '../enum/authorization/ace_flag'

    require_relative '../struct/authorization/claim_security_attributes_information'
    require_relative '../struct/authorization/acl'

    module Kernel32
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379295(v=vs.85).aspx
      # @param [Integer] processHandle
      # @param [Integer] desiredAccess
      # @param [FFI::Pointer] tokenHandle
      # @return [true, false]
      def self.OpenProcessToken(processHandle, desiredAccess, tokenHandle) end
      attach_function 'OpenProcessToken', [:handle, :dword, :pointer], :bool

      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa379296(v=vs.85).aspx
      # @param [Integer] threadHandle
      # @param [Integer] desiredAccess
      # @param [true, false] openAsSelf
      # @param [FFI::Pointer] tokenHandle
      # @return [true, false]
      def self.OpenThreadToken(threadHandle, desiredAccess, openAsSelf, tokenHandle) end
      attach_function 'OpenThreadToken', [:handle, :dword, :bool, :pointer], :bool

      if WINDOWS_VERSION >= 8


        # https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-addresourceattributeace
        # @param [FFI::Pointer] pAcl
        # @param [Integer] dwAceRevision
        # @param [Integer] aceFlags
        # @param [Integer ] accessMask
        # @param [FFI::Pointer] pSid
        # @param [FFI::Pointer] pAttributeInfo
        # @param [FFI::Pointer] pReturnLength
        # @return [true, false]
        def self.AddResourceAttributeAce(pAcl, dwAceRevision, aceFlags, accessMask, pSid, pAttributeInfo, pReturnLength)
        end
        attach_function 'AddResourceAttributeAce',
                        [ACL.ptr, :dword, AceFlag, :dword, :pointer, CLAIM_SECURITY_ATTRIBUTES_INFORMATION.ptr(:in),
                         :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-AddScopedPolicyIDAce
        # @param [FFI::Pointer] pAcl
        # @param [Integer] dwAceRevision
        # @param [Integer] aceFlags
        # @param [Integer] accessMask
        # @param [FFI::Pointer] pSid
        # @return [true, false]
        def self.AddScopedPolicyIDAce(pAcl, dwAceRevision, aceFlags, accessMask, pSid) end
        attach_function 'AddScopedPolicyIDAce', [ACL.ptr, :dword, AceFlag, :dword, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-CheckTokenCapability
        # @param [Integer] tokenHandle
        # @param [FFI::Pointer] capabilitySidToCheck
        # @param [FFI::Pointer] hasCapability
        # @return [true, false]
        def self.CheckTokenCapability(tokenHandle, capabilitySidToCheck, hasCapability) end
        attach_function 'CheckTokenCapability', [:handle, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-CheckTokenMembershipEx
        # @param [Integer] tokenHandle
        # @param [FFI::Pointer] sidToCheck
        # @param [Integer] flags
        # @param [FFI::Pointer] isMember
        # @return [true, false]
        def self.CheckTokenMembershipEx(tokenHandle, sidToCheck, flags, isMember) end
        attach_function 'CheckTokenMembershipEx', [:handle, :pointer, :dword, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/securitybaseapi/nf-securitybaseapi-GetAppContainerAce
        # @param [FFI::Pointer] acl
        # @param [Integer] startingAceIndex
        # @param [FFI::Pointer] appContainerAce
        # @param [FFI::Pointer] appContainerAceIndex
        # @return [true, false]
        def self.GetAppContainerAce(acl, startingAceIndex, appContainerAce, appContainerAceIndex) end
        attach_function 'GetAppContainerAce', [ACL.ptr(:in), :dword, :pointer, :pointer], :bool

        # https://docs.microsoft.com/en-us/windows/desktop/api/securityappcontainer/nf-securityappcontainer-getappcontainernamedobjectpath
        # @param [Integer] token
        # @param [FFI::Pointer] appContainerSid
        # @param [Integer] objectPathLength
        # @param [String] objectPath
        # @param [FFI::Pointer] returnLength
        # @return [true, false]
        def self.GetAppContainerNamedObjectPath(token, appContainerSid, objectPathLength, objectPath, returnLength) end
        attach_function 'GetAppContainerNamedObjectPath',
                        [:handle, :pointer, :ulong, :string, :pointer], :bool

        # @param [Integer] file
        # @param [FFI::Pointer] flags
        # @param [FFI::Pointer] thumbprint
        # @param [FFI::Pointer] thumbprintSize
        # @param [FFI::Pointer] thumbprintAlgorithm
        # @return [true, false]
        def self.GetCachedSigningLevel(file, flags, thumbprint, thumbprintSize, thumbprintAlgorithm) end
        attach_function 'GetCachedSigningLevel',
                        [:handle, :pointer, :pointer, :pointer, :pointer, :pointer], :bool
      end
    end
  end
end
