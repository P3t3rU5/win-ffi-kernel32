module WinFFI
  module Kernel32
    # Code Page Default Values.
    CodePageValue = enum :code_page_value, [
        :ACP,        0,
        :OEMCP,      1,
        :MACCP,      2,
        :THREAD_ACP, 3,
        :SYMBOL,    42,
        :UTF7,   65000,
        :UTF8,   65001,
    ]

    define_prefix(:CP, CodePageValue)
  end
end