module WinFFI
  module Kernel32
    HIGH_SURROGATE_START = 0xd800
    HIGH_SURROGATE_END   = 0xdbff
    LOW_SURROGATE_START  = 0xdc00
    LOW_SURROGATE_END    = 0xdfff

    #define IS_HIGH_SURROGATE(wch) (((wch) >= HIGH_SURROGATE_START) && ((wch) <= HIGH_SURROGATE_END))
    def self.IS_HIGH_SURROGATE(wch)
      ((wch >= HIGH_SURROGATE_START) && (wch <= HIGH_SURROGATE_END))
    end

    #define IS_LOW_SURROGATE(wch)  (((wch) >= LOW_SURROGATE_START) && ((wch) <= LOW_SURROGATE_END))
    def self.IS_LOW_SURROGATE(wch)
      ((wch >= LOW_SURROGATE_START) && (wch <= LOW_SURROGATE_END))
    end

    #define IS_SURROGATE_PAIR(hs, ls) (IS_HIGH_SURROGATE(hs) && IS_LOW_SURROGATE(ls))
    def self.IS_SURROGATE_PAIR(hs, ls)
      (IS_HIGH_SURROGATE(hs) && IS_LOW_SURROGATE(ls))
    end

    #define MAKELANGID(p, s)       ((((WORD  )(s)) << 10) | (WORD  )(p))
    def self.MAKELANGID(x, s)
      s << 10 | x
    end

    #define PRIMARYLANGID(lgid)    ((WORD  )(lgid) & 0x3ff)
    def self.PRIMARYLANGID(lgid)
      lgid & 0x3ff
    end

    #define SUBLANGID(lgid)        ((WORD  )(lgid) >> 10)
    def self.SUBLANGID(lgid)
      lgid >> 10
    end

    #define MAKELCID(lgid, srtid)  ((DWORD)((((DWORD)((WORD  )(srtid))) << 16) | ((DWORD)((WORD  )(lgid)))))
    def self.MAKELCID(lgid, srtid)
      srtid << 16 | lgid
    end

    #define MAKESORTLCID(lgid, srtid, ver)((DWORD)((MAKELCID(lgid, srtid)) | (((DWORD)((WORD  )(ver))) << 20)))
    def self.MAKESORTLCID(lgid, srtid, ver)
      MAKELCID(lgid, srtid) | ver << 20
    end

    #define LANGIDFROMLCID(lcid)   ((WORD  )(lcid))
    #define SORTIDFROMLCID(lcid)   ((WORD  )((((DWORD)(lcid)) >> 16) & 0xf))
    def self.SORTIDFROMLCID(lcid)
      lcid >> 16 & 0xf
    end

    #define SORTVERSIONFROMLCID(lcid)  ((WORD  )((((DWORD)(lcid)) >> 20) & 0xf))
    def self.SORTVERSIONFROMLCID(lcid)
      lcid >> 20 & 0xf
    end
  end
end