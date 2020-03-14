module WinFFI
  module Kernel32
    ToolHelpCrateSnapshotFlag = enum :tool_help_crate_snapshot_flag, [
        :SNAPHEAPLIST, 0x00000001,
        :SNAPPROCESS,  0x00000002,
        :SNAPTHREAD,   0x00000004,
        :SNAPMODULE,   0x00000008,
        :SNAPMODULE32, 0x00000010,
        :SNAPALL,      0x0000000F,
        :INHERIT,      0x80000000
    ]

    define_prefix(:TH32CS, ToolHelpCrateSnapshotFlag)
  end
end