project "Irrlicht"
    kind "StaticLib"

    includedirs { "include", "src/zlib", "src/jpeglib", "src/libpng" }
    defines { "_IRR_STATIC_LIB_" }
    flags { "NoExceptions", "NoRTTI" }
    files { "**.cpp", "**.c", "**.cxx", "**.hpp", "**.h" }
    configuration { "vs*" }
        defines { "IRRLICHT_FAST_MATH", "UNICODE", "_UNICODE" }
		includedirs { "$(DXSDK_DIR)include" }
        libdirs { "$(DXSDK_DIR)Lib\x86" }
    configuration { "windows" }
        links { "imm32" }
