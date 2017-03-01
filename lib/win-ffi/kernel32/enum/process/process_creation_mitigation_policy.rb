require 'win-ffi/kernel32'

module WinFFI
  if WINDOWS_VERSION >= 7
    module Kernel32
      # Define legacy creation mitigation policy options, which are straight bitmasks.  Bits 0-5 are legacy bits.
      buffer = [
          :DEP_ENABLE,           0x01,
          :DEP_ATL_THUNK_ENABLE, 0x02,
          :SEHOP_ENABLE,         0x04,
      ]
      if WINDOWS_VERSION >= 8
        buffer += [
            # Define mandatory ASLR options.  Mandatory ASLR forcibly rebases images that are not dynamic base compatible by
            # acting as though there were an image base collision at load time.

            # Note that 'require relocations' mode refuses load of images that do not have a base relocation section.
            :FORCE_RELOCATE_IMAGES_MASK,                 (0x00000003 <<  8),
            :FORCE_RELOCATE_IMAGES_DEFER,                (0x00000000 <<  8),
            :FORCE_RELOCATE_IMAGES_ALWAYS_ON,            (0x00000001 <<  8),
            :FORCE_RELOCATE_IMAGES_ALWAYS_OFF,           (0x00000002 <<  8),
            :FORCE_RELOCATE_IMAGES_ALWAYS_ON_REQ_RELOCS, (0x00000003 <<  8),

            # Define heap terminate on corruption options.  Note that 'always off' does not override the default opt-in
            # for binaries with current subsystem versions set in the image header.

            # Heap terminate on corruption is user mode enforced.
            :HEAP_TERMINATE_MASK,       (0x00000003 << 12),
            :HEAP_TERMINATE_DEFER,      (0x00000000 << 12),
            :HEAP_TERMINATE_ALWAYS_ON,  (0x00000001 << 12),
            :HEAP_TERMINATE_ALWAYS_OFF, (0x00000002 << 12),
            :HEAP_TERMINATE_RESERVED,   (0x00000003 << 12),

            # Define bottom up randomization (includes stack randomization) options,
            # i.e. randomization of the lowest user address.
            :BOTTOM_UP_ASLR_MASK,       (0x00000003 << 16),
            :BOTTOM_UP_ASLR_DEFER,      (0x00000000 << 16),
            :BOTTOM_UP_ASLR_ALWAYS_ON,  (0x00000001 << 16),
            :BOTTOM_UP_ASLR_ALWAYS_OFF, (0x00000002 << 16),
            :BOTTOM_UP_ASLR_RESERVED,   (0x00000003 << 16),

            # Define high entropy bottom up randomization.  Note that high entropy bottom up randomization is effective
            # if and only if bottom up ASLR is also enabled.
            #
            # N.B.  High entropy mode is only meaningful for native 64-bit processes.  in high entropy mode, up to 1TB
            # of bottom up variance is enabled.
            :HIGH_ENTROPY_ASLR_MASK,       (0x00000003 << 20),
            :HIGH_ENTROPY_ASLR_DEFER,      (0x00000000 << 20),
            :HIGH_ENTROPY_ASLR_ALWAYS_ON,  (0x00000001 << 20),
            :HIGH_ENTROPY_ASLR_ALWAYS_OFF, (0x00000002 << 20),
            :HIGH_ENTROPY_ASLR_RESERVED,   (0x00000003 << 20),

            # Define handle checking enforcement options.  Handle checking enforcement causes an exception to be raised
            # immediately on a bad handle reference, versus simply returning a failure status from the handle reference.
            :STRICT_HANDLE_CHECKS_MASK,       (0x00000003 << 24),
            :STRICT_HANDLE_CHECKS_DEFER,      (0x00000000 << 24),
            :STRICT_HANDLE_CHECKS_ALWAYS_ON,  (0x00000001 << 24),
            :STRICT_HANDLE_CHECKS_ALWAYS_OFF, (0x00000002 << 24),
            :STRICT_HANDLE_CHECKS_RESERVED,   (0x00000003 << 24),

            # Define win32k system call disable options.  Win32k system call disable prevents a process from making
            # Win32k calls.
            :WIN32K_SYSTEM_CALL_DISABLE_MASK,       (0x00000003 << 28),
            :WIN32K_SYSTEM_CALL_DISABLE_DEFER,      (0x00000000 << 28),
            :WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_ON,  (0x00000001 << 28),
            :WIN32K_SYSTEM_CALL_DISABLE_ALWAYS_OFF, (0x00000002 << 28),
            :WIN32K_SYSTEM_CALL_DISABLE_RESERVED,   (0x00000003 << 28),

            # Define the extension point disable options.  Extension point disable allows a process to opt-out of
            # loading various arbitrary extension point DLLs.
            :EXTENSION_POINT_DISABLE_MASK,       (0x00000003 << 32),
            :EXTENSION_POINT_DISABLE_DEFER,      (0x00000000 << 32),
            :EXTENSION_POINT_DISABLE_ALWAYS_ON,  (0x00000001 << 32),
            :EXTENSION_POINT_DISABLE_ALWAYS_OFF, (0x00000002 << 32),
            :EXTENSION_POINT_DISABLE_RESERVED,   (0x00000003 << 32),
        ]
        if WINDOWS_VERSION >= 8.1
          buffer += [
              # Define dynamic code options.
              :PROHIBIT_DYNAMIC_CODE_MASK,       (0x00000003 << 36),
              :PROHIBIT_DYNAMIC_CODE_DEFER,      (0x00000000 << 36),
              :PROHIBIT_DYNAMIC_CODE_ALWAYS_ON,  (0x00000001 << 36),
              :PROHIBIT_DYNAMIC_CODE_ALWAYS_OFF, (0x00000002 << 36),
              :PROHIBIT_DYNAMIC_CODE_RESERVED,   (0x00000003 << 36),

              # Define module signature options.  When enabled, this option will block mapping of non-microsoft binaries
              :BLOCK_NON_MICROSOFT_BINARIES_MASK,       (0x00000003 << 44),
              :BLOCK_NON_MICROSOFT_BINARIES_DEFER,      (0x00000000 << 44),
              :BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_ON,  (0x00000001 << 44),
              :BLOCK_NON_MICROSOFT_BINARIES_ALWAYS_OFF, (0x00000002 << 44),
              :BLOCK_NON_MICROSOFT_BINARIES_RESERVED,   (0x00000003 << 44),
          ]
          if WINDOWS_VERSION >= 10
            buffer += [

                # Define Font Disable Policy.  When enabled, this option will block loading Non System Fonts.
                :FONT_DISABLE_MASK,       (0x00000003 << 48),
                :FONT_DISABLE_DEFER,      (0x00000000 << 48),
                :FONT_DISABLE_ALWAYS_ON,  (0x00000001 << 48),
                :FONT_DISABLE_ALWAYS_OFF, (0x00000002 << 48),
                :AUDIT_NONSYSTEM_FONTS,   (0x00000003 << 48),
            ]
          end
        end
      end

      ProcessCreationMitigationPolicy = enum :process_creation_mitigation_policy, buffer
    end
  end
end