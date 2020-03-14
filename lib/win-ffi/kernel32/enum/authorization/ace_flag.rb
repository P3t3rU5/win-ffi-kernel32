module WinFFI
  module Kernel32
    # The following are the inherit flags that go into the AceFlags field of an Ace header.
    AceFlag = enum :ace_flag, [
        :OBJECT_INHERIT,       (0x1),
        :CONTAINER_INHERIT,    (0x2),
        :NO_PROPAGATE_INHERIT, (0x4),
        :INHERIT_ONLY,         (0x8),
        :INHERITED,           (0x10),
        :VALID_INHERIT_FLAGS, (0x1F),
    ]

    define_suffix(:ACE, AceFlag)
  end
end