module WinFFI
  module Kernel32
    #define MAKELCID(lgid, srtid)  ((ULONG)((((ULONG)((USHORT)(srtid))) << 16) | ((ULONG)((USHORT)(lgid)))))
    def self.MAKELCID(lgid, srtid)
      (srtid << 16) | lgid
    end

    #define MAKELANGID(p, s)       ((((USHORT)(s)) << 10) | (USHORT)(p))
    def self.MAKELANGID(p, s)
      (s << 10) | p
    end

    #define PRIMARYLANGID(lgid)    ((USHORT)(lgid) & 0x3ff)
    def self.PRIMARYLANGID(lgid)
      lgid & 0x3ff
    end

    #define SUBLANGID(lgid)        ((USHORT)(lgid) >> 10)
    def self.SUBLANGID(lgid)
      lgid >> 10
    end

    #define MAKESORTLCID(lgid, srtid, ver) ((ULONG)((MAKELCID(lgid, srtid)) | (((ULONG)((USHORT)(ver))) << 20)))
    def self.MAKESORTLCID(lgid, srtid, ver)
      MAKELCID(lgid, srtid) | (ver << 20)
    end

    #define LANGIDFROMLCID(lcid)   ((USHORT)(lcid))
    def LANGIDFROMLCID(lcid)
      lcid
    end

    #define SORTIDFROMLCID(lcid)   ((USHORT)((((ULONG)(lcid)) >> 16) & 0xf))
    def SORTIDFROMLCID(lcid)
      (lcid >> 16) & 0xf
    end

    #define SORTVERSIONFROMLCID(lcid)  ((USHORT)((((ULONG)(lcid)) >> 20) & 0xf))
    def SORTVERSIONFROMLCID(lcid)
      (lcid >> 20) & 0xf
    end
  end
end