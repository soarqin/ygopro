include "lzma"

project "ygopro"
    kind "WindowedApp"

    files { "**.cpp", "**.cc", "**.c", "**.h" }
    excludes "lzma/**"
    includedirs { "../ocgcore", "../irrKlang-1.4.0/include" }
    links { "ocgcore", "clzma", "Irrlicht", "freetype", "sqlite3", "lua", "event", "irrKlang" }

    configuration "windows"
        files "ygopro.rc"
        excludes "CGUIButton.cpp"
        includedirs { "../irrlicht/include", "../freetype/include", "../event/include", "../sqlite3" }
        links { "opengl32", "ws2_32", "winmm", "gdi32", "kernel32", "user32", "imm32" }
    configuration {"windows", "vs*"}
        libdirs { "../irrKlang-1.4.0/lib/Win32-visualStudio" }
    configuration {"windows", "not vs*"}
        includedirs { "/mingw/include/irrlicht", "/mingw/include/freetype2" }
    configuration "not vs*"
        buildoptions { "-std=gnu++0x", "-fno-rtti", "-fpermissive" }
    configuration "not windows"
        includedirs { "/usr/include/lua", "/usr/include/lua5.2", "/usr/include/lua/5.2", "/usr/include/irrlicht", "/usr/include/freetype2" }
        excludes { "COSOperator.*" }
        if os.is("macosx") then
			linkoptions { "-framework OpenGL", "-framework Cocoa", "-framework IOKit", "/usr/local/lib/libevent_pthreads.a" }
			links { "dl", "pthread", "objc" } 
		else
			links { "event_pthreads", "GL", "dl", "pthread" } 
		end
