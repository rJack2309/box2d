project "Box2D"
    kind "StaticLib"
    language "C"
    cdialect "C11"      -- Tells VS to use modern C for _Static_assert
    staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/box2d/**.h",
        "src/**.h",
        "src/**.c"
    }

    includedirs
    {
        "include",
        "src"
    }

    filter "system:windows"
        systemversion "latest"
        -- Box2D v3 needs to know it's on Windows for certain math headers
        defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"