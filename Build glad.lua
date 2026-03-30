project "glad"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    warnings "off"

    files {
        "src/**.c",
        "include/**.h"
    }

    includedirs { "include" }

    targetdir ("lib/" .. OutputDir .. "/%{prj.name}")
    objdir    ("lib/intermediates/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"

    filter "action:vs*"
        buildoptions { "/MP" }
    filter {}