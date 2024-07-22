include "msdfgen"

project "msdf-atlas-gen"
	language "C++"
	cppdialect "C++17"
	kind "StaticLib"
    staticruntime "Off"

	targetdir "%{OutputDir.Binaries}/%{prj.name}"
	objdir    "%{OutputDir.Intermediates}/%{prj.name}"

	files
	{
		"msdf-atlas-gen/**.h",
    	"msdf-atlas-gen/**.hpp",
    	"msdf-atlas-gen/**.cpp"
	}

	includedirs
	{
		"msdf-atlas-gen",
		"msdfgen",
		"msdfgen/include"
	}

	links
	{
		"msdfgen"
	}

	filter "system:windows"
		systemversion "latest"
		defines
		{
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Development"
		runtime "Debug"
		symbols "On"

	filter "configurations:Preview or Shipping"
		runtime "Release"
		optimize "Speed"
