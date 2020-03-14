module WinFFI
  module Kernel32
    ProcessInformationClass = enum :process_information_class, [
        :ProcessMemoryPriority,
        :ProcessMemoryExhaustionInfo,
        :ProcessAppMemoryInfo,
        :ProcessInPrivateInfo,
        :ProcessEDPStateInfo,
        :ProcessInformationClassMax
    ]
  end
end