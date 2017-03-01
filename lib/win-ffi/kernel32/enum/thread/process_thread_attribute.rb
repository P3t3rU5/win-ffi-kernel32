require 'win-ffi/kernel32'

require 'win-ffi/kernel32/macro/thread'

module WinFFI
  if WINDOWS_VERSION >= :vista
    module Kernel32
      # Extended process and thread attribute support
      buffer = [
          :ParentProcess,     0,
          :HandleList,        2,
          :ProtectionLevel,  11,
          :NUMBER,   0x0000FFFF,
          :THREAD,   0x00010000,  # Attribute may be used with thread creation
          :INPUT,    0x00020000,  # Attribute is input only
          :ADDITIVE, 0x00040000,  # Attribute may be "accumulated," e.g. bitmasks, counters, etc.

          :PARENT_PROCESS,   ProcThreadAttributeValue(0,  false, true, false),
          :HANDLE_LIST,      ProcThreadAttributeValue(2,  false, true, false),
          :PROTECTION_LEVEL, ProcThreadAttributeValue(11, false, true, false)
      ]
      if WINDOWS_VERSION >= 7
        buffer += [
            :GroupAffinity,    3,
            :PreferredNode,    4,
            :IdealProcessor,   5,
            :UmsThread,        6,
            :MitigationPolicy, 7,

            :GROUP_AFFINITY,    ProcThreadAttributeValue(3, true, true, false),
            :PREFERRED_NODE,    ProcThreadAttributeValue(4, false, true, false),
            :IDEAL_PROCESSOR,   ProcThreadAttributeValue(5, true, true, false),
            :UMS_THREAD,        ProcThreadAttributeValue(6, true, true, false),
            :MITIGATION_POLICY, ProcThreadAttributeValue(7, false, true, false)
        ]
        if WINDOWS_VERSION >= 8
          buffer += [
              :SecurityCapabilities, 9,

              :SECURITY_CAPABILITIES,  ProcThreadAttributeValue(9, false, true, false)
          ]
          if WINDOWS_VERSION >= 10
            buffer += [
                :JobList, 13


            ]
          end
        end
      end

      ProcessThreadAttribute = enum :process_thread_attribute, buffer
    end
  end
end