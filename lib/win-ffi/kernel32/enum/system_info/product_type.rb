require 'win-ffi/kernel32'

module WinFFI
  module Kernel32
    ProductType = enum :product_type, [
        :UNDEFINED,                           0x00000000,
        :ULTIMATE,                            0x00000001,
        :HOME_BASIC,                          0x00000002,
        :HOME_PREMIUM,                        0x00000003,
        :ENTERPRISE,                          0x00000004,
        :HOME_BASIC_N,                        0x00000005,
        :BUSINESS,                            0x00000006,
        :STANDARD_SERVER,                     0x00000007,
        :DATACENTER_SERVER,                   0x00000008,
        :SMALLBUSINESS_SERVER,                0x00000009,
        :ENTERPRISE_SERVER,                   0x0000000A,
        :STARTER,                             0x0000000B,
        :DATACENTER_SERVER_CORE,              0x0000000C,
        :STANDARD_SERVER_CORE,                0x0000000D,
        :ENTERPRISE_SERVER_CORE,              0x0000000E,
        :ENTERPRISE_SERVER_IA64,              0x0000000F,
        :BUSINESS_N,                          0x00000010,
        :WEB_SERVER,                          0x00000011,
        :CLUSTER_SERVER,                      0x00000012,
        :HOME_SERVER,                         0x00000013,
        :STORAGE_EXPRESS_SERVER,              0x00000014,
        :STORAGE_STANDARD_SERVER,             0x00000015,
        :STORAGE_WORKGROUP_SERVER,            0x00000016,
        :STORAGE_ENTERPRISE_SERVER,           0x00000017,
        :SERVER_FOR_SMALLBUSINESS,            0x00000018,
        :SMALLBUSINESS_SERVER_PREMIUM,        0x00000019,
        :HOME_PREMIUM_N,                      0x0000001A,
        :ENTERPRISE_N,                        0x0000001B,
        :ULTIMATE_N,                          0x0000001C,
        :WEB_SERVER_CORE,                     0x0000001D,
        :MEDIUMBUSINESS_SERVER_MANAGEMENT,    0x0000001E,
        :MEDIUMBUSINESS_SERVER_SECURITY,      0x0000001F,
        :MEDIUMBUSINESS_SERVER_MESSAGING,     0x00000020,
        :SERVER_FOUNDATION,                   0x00000021,
        :HOME_PREMIUM_SERVER,                 0x00000022,
        :SERVER_FOR_SMALLBUSINESS_V,          0x00000023,
        :STANDARD_SERVER_V,                   0x00000024,
        :DATACENTER_SERVER_V,                 0x00000025,
        :ENTERPRISE_SERVER_V,                 0x00000026,
        :DATACENTER_SERVER_CORE_V,            0x00000027,
        :STANDARD_SERVER_CORE_V,              0x00000028,
        :ENTERPRISE_SERVER_CORE_V,            0x00000029,
        :HYPERV,                              0x0000002A,
        :STORAGE_EXPRESS_SERVER_CORE,         0x0000002B,
        :STORAGE_STANDARD_SERVER_CORE,        0x0000002C,
        :STORAGE_WORKGROUP_SERVER_CORE,       0x0000002D,
        :STORAGE_ENTERPRISE_SERVER_CORE,      0x0000002E,
        :STARTER_N,                           0x0000002F,
        :PROFESSIONAL,                        0x00000030,
        :PROFESSIONAL_N,                      0x00000031,
        :SB_SOLUTION_SERVER,                  0x00000032,
        :SERVER_FOR_SB_SOLUTIONS,             0x00000033,
        :STANDARD_SERVER_SOLUTIONS,           0x00000034,
        :STANDARD_SERVER_SOLUTIONS_CORE,      0x00000035,
        :SB_SOLUTION_SERVER_EM,               0x00000036,
        :SERVER_FOR_SB_SOLUTIONS_EM,          0x00000037,
        :SOLUTION_EMBEDDEDSERVER,             0x00000038,
        :SOLUTION_EMBEDDEDSERVER_CORE,        0x00000039,
        :PROFESSIONAL_EMBEDDED,               0x0000003A,
        :ESSENTIALBUSINESS_SERVER_MGMT,       0x0000003B,
        :ESSENTIALBUSINESS_SERVER_ADDL,       0x0000003C,
        :ESSENTIALBUSINESS_SERVER_MGMTSVC,    0x0000003D,
        :ESSENTIALBUSINESS_SERVER_ADDLSVC,    0x0000003E,
        :SMALLBUSINESS_SERVER_PREMIUM_CORE,   0x0000003F,
        :CLUSTER_SERVER_V,                    0x00000040,
        :EMBEDDED,                            0x00000041,
        :STARTER_E,                           0x00000042,
        :HOME_BASIC_E,                        0x00000043,
        :HOME_PREMIUM_E,                      0x00000044,
        :PROFESSIONAL_E,                      0x00000045,
        :ENTERPRISE_E,                        0x00000046,
        :ULTIMATE_E,                          0x00000047,
        :ENTERPRISE_EVALUATION,               0x00000048,
        :MULTIPOINT_STANDARD_SERVER,          0x0000004C,
        :MULTIPOINT_PREMIUM_SERVER,           0x0000004D,
        :STANDARD_EVALUATION_SERVER,          0x0000004F,
        :DATACENTER_EVALUATION_SERVER,        0x00000050,
        :ENTERPRISE_N_EVALUATION,             0x00000054,
        :EMBEDDED_AUTOMOTIVE,                 0x00000055,
        :EMBEDDED_INDUSTRY_A,                 0x00000056,
        :THINPC,                              0x00000057,
        :EMBEDDED_A,                          0x00000058,
        :EMBEDDED_INDUSTRY,                   0x00000059,
        :EMBEDDED_E,                          0x0000005A,
        :EMBEDDED_INDUSTRY_E,                 0x0000005B,
        :EMBEDDED_INDUSTRY_A_E,               0x0000005C,
        :STORAGE_WORKGROUP_EVALUATION_SERVER, 0x0000005F,
        :STORAGE_STANDARD_EVALUATION_SERVER,  0x00000060,
        :CORE_ARM,                            0x00000061,
        :CORE_N,                              0x00000062,
        :CORE_COUNTRYSPECIFIC,                0x00000063,
        :CORE_SINGLELANGUAGE,                 0x00000064,
        :CORE,                                0x00000065,
        :PROFESSIONAL_WMC,                    0x00000067,
        :MOBILE_CORE,                         0x00000068,
        :EMBEDDED_INDUSTRY_EVAL,              0x00000069,
        :EMBEDDED_INDUSTRY_E_EVAL,            0x0000006A,
        :EMBEDDED_EVAL,                       0x0000006B,
        :EMBEDDED_E_EVAL,                     0x0000006C,
        :NANO_SERVER,                         0x0000006D,
        :CLOUD_STORAGE_SERVER,                0x0000006E,
        :CORE_CONNECTED,                      0x0000006F,
        :PROFESSIONAL_STUDENT,                0x00000070,
        :CORE_CONNECTED_N,                    0x00000071,
        :PROFESSIONAL_STUDENT_N,              0x00000072,
        :CORE_CONNECTED_SINGLELANGUAGE,       0x00000073,
        :CORE_CONNECTED_COUNTRYSPECIFIC,      0x00000074,
        :CONNECTED_CAR,                       0x00000075,
        :INDUSTRY_HANDHELD,                   0x00000076,
        :PPI_PRO,                             0x00000077,
        :ARM64_SERVER,                        0x00000078,
        :EDUCATION,                           0x00000079,
        :EDUCATION_N,                         0x0000007A,
        :IOTUAP,                              0x0000007B,
        :CLOUD_HOST_INFRASTRUCTURE_SERVER,    0x0000007C,
        :ENTERPRISE_S,                        0x0000007D,
        :ENTERPRISE_S_N,                      0x0000007E,
        :PROFESSIONAL_S,                      0x0000007F,
        :PROFESSIONAL_S_N,                    0x00000080,
        :ENTERPRISE_S_EVALUATION,             0x00000081,
        :ENTERPRISE_S_N_EVALUATION,           0x00000082,
        :HOLOGRAPHIC,                         0x00000087,
        :PRO_SINGLE_LANGUAGE,                 0x0000008A,
        :PRO_CHINA,                           0x0000008B,
        :ENTERPRISE_SUBSCRIPTION,             0x0000008C,
        :ENTERPRISE_SUBSCRIPTION_N,           0x0000008D,
        :DATACENTER_NANO_SERVER,              0x0000008F,
        :STANDARD_NANO_SERVER,                0x00000090,
        :DATACENTER_A_SERVER_CORE,            0x00000091,
        :STANDARD_A_SERVER_CORE,              0x00000092,
        :DATACENTER_WS_SERVER_CORE,           0x00000093,
        :STANDARD_WS_SERVER_CORE,             0x00000094,
        :UTILITY_VM,                          0x00000095,
        :DATACENTER_EVALUATION_SERVER_CORE,   0x0000009F,
        :STANDARD_EVALUATION_SERVER_CORE,     0x000000A0,
        :PRO_WORKSTATION,                     0x000000A1,
        :PRO_WORKSTATION_N,                   0x000000A2,
        :PRO_FOR_EDUCATION,                   0x000000A4,
        :PRO_FOR_EDUCATION_N,                 0x000000A5,
        :AZURE_SERVER_CORE,                   0x000000A8,
        :AZURE_NANO_SERVER,                   0x000000A9,
        :UNLICENSED,                          0xABCDABCD,
    ]

    define_prefix(:PRODUCT, ProductType)
  end
end