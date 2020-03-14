require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= 8
    module Kernel32

      ProcessCreationMitigationPolicyForceRelocateImages =
          enum :process_creation_mitigation_policy_force_relocate_images, [

      ]
    end
  end
end