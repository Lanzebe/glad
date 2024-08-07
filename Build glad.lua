project "glad"
	kind "StaticLib"
	language "C"
	staticruntime "off"
	warnings "off"

	files {
		"src/**.c",
		"include/**.h",
	}

    -- Add the include directories
	includedirs {
        "include",
   }

    -- Add the library directories
   libdirs { }
    
    -- Add the dependant project
    links { }

   targetdir ("lib/" .. OutputDir .. "/%{prj.name}")
   objdir ("lib/intermediates/" .. OutputDir .. "/%{prj.name}")

   filter "system:windows"
       systemversion "latest"
       defines { }

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
        buildoptions { "/MP" }  -- Enable multi-process compilation