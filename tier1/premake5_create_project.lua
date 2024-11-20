group("SourceSDK")
	project("tier1")
		kind("StaticLib")
		warnings("Default")
		location("../projects/" .. os.target() .. "/" .. _ACTION)
		defines("TIER1_STATIC_LIB")
		targetdir("%{prj.location}/%{cfg.architecture}/%{cfg.buildcfg}")
		debugdir("%{prj.location}/%{cfg.architecture}/%{cfg.buildcfg}")
		objdir("!%{prj.location}/%{cfg.architecture}/%{cfg.buildcfg}/intermediate/%{prj.name}")
		externalincludedirs({"../public", "../public/tier0", "../public/tier1"})
		files({
			"appinstance.cpp",
			"bitbuf.cpp",
			"newbitbuf.cpp",
			"byteswap.cpp",
			"characterset.cpp",
			"checksum_crc.cpp",
			"checksum_md5.cpp",
			"checksum_sha1.cpp",
			"circularbuffer.cpp",
			"commandbuffer.cpp",
			"convar.cpp",
			"datamanager.cpp",
			"diff.cpp",
			"exprevaluator.cpp",
			"generichash.cpp",
			"interface.cpp",
			"keyvalues.cpp",
			"keyvaluesjson.cpp",
			"kvpacker.cpp",
			"lzmaDecoder.cpp",
			"lzss.cpp",
			"mempool.cpp",
			"memstack.cpp",
			"NetAdr.cpp",
			"splitstring.cpp",
			"rangecheckedvar.cpp",
			"stringpool.cpp",
			"strtools.cpp",
			"strtools_unicode.cpp",
			"tier1.cpp",
			"tier1_logging.cpp",
			"timeutils.cpp",
			"uniqueid.cpp",
			"utlbuffer.cpp",
			"utlbufferutil.cpp",
			"utlsoacontainer.cpp",
			"utlstring.cpp",
			"utlsymbol.cpp",
			"miniprofiler_hash.cpp",
			"sparsematrix.cpp",
			"memoverride_dummy.cpp",
			"../public/tier1/appinstance.h",
			"../public/tier1/bitbuf.h",
			"../public/tier1/byteswap.h",
			"../public/tier1/callqueue.h",
			"../public/tier1/characterset.h",
			"../public/tier1/checksum_crc.h",
			"../public/tier1/checksum_md5.h",
			"../public/tier1/checksum_sha1.h",
			"../public/tier1/circularbuffer.h",
			"../public/tier1/commandbuffer.h",
			"../public/tier1/convar.h",
			"../public/tier1/datamanager.h",
			"../public/tier1/delegates.h",
			"../public/tier1/diff.h",
			"../public/tier1/exprevaluator.h",
			"../public/tier1/fmtstr.h",
			"../public/tier1/functors.h",
			"../public/tier1/generichash.h",
			"../public/tier1/iconvar.h",
			"../public/tier1/interface.h",
			"../public/tier1/interpolatedvar.h",
			"../public/tier1/keyvalues.h",
			"../public/tier1/keyvaluesjson.h",
			"../public/tier1/kvpacker.h",
			"../public/tier1/lzmaDecoder.h",
			"../public/tier1/lerp_functions.h",
			"../public/tier1/lzss.h",
			"../public/tier1/mempool.h",
			"../public/tier1/memstack.h",
			"../public/tier1/netadr.h",
			"../public/tier1/processor_detect.h",
			"../public/tier1/rangecheckedvar.h",
			"../public/tier1/refcount.h",
			"../public/tier1/smartptr.h",
			"../public/tier1/sparsematrix.h",
			"../public/tier1/stringpool.h",
			"../public/tier1/strtools.h",
			"../public/tier1/tier1.h",
			"../public/tier1/tier1_logging.h",
			"../public/tier1/timeutils.h",
			"../public/tier1/tokenset.h",
			"../public/tier1/utlbidirectionalset.h",
			"../public/tier1/utlblockmemory.h",
			"../public/tier1/utlbuffer.h",
			"../public/tier1/utlbufferutil.h",
			"../public/tier1/utlcommon.h",
			"../public/tier1/utldict.h",
			"../public/tier1/utlenvelope.h",
			"../public/tier1/utlfixedmemory.h",
			"../public/tier1/utlhandletable.h",
			"../public/tier1/utlhash.h",
			"../public/tier1/utlhashtable.h",
			"../public/tier1/utllinkedlist.h",
			"../public/tier1/utlmap.h",
			"../public/tier1/utlmemory.h",
			"../public/tier1/utlmultilist.h",
			"../public/tier1/utlpriorityqueue.h",
			"../public/tier1/utlqueue.h",
			"../public/tier1/utlrbtree.h",
			"../public/tier1/utlsoacontainer.h",
			"../public/tier1/utlsortvector.h",
			"../public/tier1/utlstack.h",
			"../public/tier1/utlstring.h",
			"../public/tier1/utlstringtoken.h",
			"../public/tier1/utlstringmap.h",
			"../public/tier1/utlsymbol.h",
			"../public/tier1/utltscache.h",
			"../public/tier1/utlvector.h",
			"../public/tier1/miniprofiler_hash.h",
			"../public/datamap.h",
			"../common/xbox/xboxstubs.h"
		})
		vpaths({
			["Source files/*"] = {"*.cpp", "../utils/lzma/C/*.c"},
			["Header files/*"] = {"../public/tier1/*.h", "../public/*.h", "../common/xbox/*.h"}
		})

		IncludeSDKCommonInternal()
		IncludeSDKLZMA()

		filter("system:windows")
			disablewarnings("4244")
			defines("_CRT_SECURE_NO_WARNINGS")
			files({"processor_detect.cpp", "../public/tier1/uniqueid.h"})

		filter("system:linux")
			disablewarnings("unused-result")
			files({"processor_detect_linux.cpp", "qsort_s.cpp", "pathmatch.cpp"})
			linkoptions({
				"-Xlinker --wrap=fopen",
				"-Xlinker --wrap=freopen",
				"-Xlinker --wrap=open",
				"-Xlinker --wrap=creat",
				"-Xlinker --wrap=access",
				"-Xlinker --wrap=__xstat",
				"-Xlinker --wrap=stat",
				"-Xlinker --wrap=lstat",
				"-Xlinker --wrap=fopen64",
				"-Xlinker --wrap=open64",
				"-Xlinker --wrap=opendir",
				"-Xlinker --wrap=__lxstat",
				"-Xlinker --wrap=chmod",
				"-Xlinker --wrap=chown",
				"-Xlinker --wrap=lchown",
				"-Xlinker --wrap=symlink",
				"-Xlinker --wrap=link",
				"-Xlinker --wrap=__lxstat64",
				"-Xlinker --wrap=mknod",
				"-Xlinker --wrap=utimes",
				"-Xlinker --wrap=unlink",
				"-Xlinker --wrap=rename",
				"-Xlinker --wrap=utime",
				"-Xlinker --wrap=__xstat64",
				"-Xlinker --wrap=mount",
				"-Xlinker --wrap=mkfifo",
				"-Xlinker --wrap=mkdir",
				"-Xlinker --wrap=rmdir",
				"-Xlinker --wrap=scandir",
				"-Xlinker --wrap=realpath"
			})

		filter("system:macosx")
			files("processor_detect_linux.cpp")
