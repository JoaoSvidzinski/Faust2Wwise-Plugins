add_library("JSgranulatorFX" STATIC
  "${CMAKE_CURRENT_LIST_DIR}/JSgranulatorFX.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/JSgranulatorFXParams.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/faust/dsp/fastmath.cpp"
  "${CMAKE_CURRENT_LIST_DIR}/faust/dsp/faust-dynamic-engine.cpp"
)
target_compile_definitions("JSgranulatorFX" PRIVATE "LLVM_DSP")
target_compile_options("JSgranulatorFX" PRIVATE "-fexceptions")
target_include_directories("JSgranulatorFX" PRIVATE
    "${CMAKE_CURRENT_SOURCE_DIR}/../SoundEnginePlugin"
)
if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Debug)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Debug/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Debug/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Debug/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "_DEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Debug)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Debug/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Debug/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Debug/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "_DEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Debug)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Debug/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Debug/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Debug/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "_DEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Debug)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Debug/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Debug/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Debug/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "_DEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/MDd>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/MDd>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Profile)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Profile)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Profile)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Profile)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Profile_EnableAsserts)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile_EnableAsserts/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile_EnableAsserts/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Profile_EnableAsserts/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_ENABLE_ASSERTS"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Profile_EnableAsserts)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile_EnableAsserts/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile_EnableAsserts/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Profile_EnableAsserts/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_ENABLE_ASSERTS"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Profile_EnableAsserts)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile_EnableAsserts/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile_EnableAsserts/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Profile_EnableAsserts/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_ENABLE_ASSERTS"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Profile_EnableAsserts)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile_EnableAsserts/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile_EnableAsserts/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Profile_EnableAsserts/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_ENABLE_ASSERTS"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-omit-frame-pointer")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:C>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/Z7>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-g>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-g>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL armeabi-v7a-Release)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Release/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Release/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_armeabi-v7a/Release/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_OPTIMIZED"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86-Release)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Release/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Release/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86/Release/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_OPTIMIZED"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m32>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m32>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL arm64-v8a-Release)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Release/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Release/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_arm64-v8a/Release/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_OPTIMIZED"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()

if(CMAKE_BUILD_TYPE STREQUAL x86_64-Release)
  set_target_properties("JSgranulatorFX" PROPERTIES
    OUTPUT_NAME "JSgranulatorFX"
    ARCHIVE_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Release/lib"
    LIBRARY_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Release/lib"
    RUNTIME_OUTPUT_DIRECTORY "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/Android_x86_64/Release/lib"
  )
  target_include_directories("JSgranulatorFX" PRIVATE
    "C:/Audiokinetic/Wwise2024.1.8.8893/SDK/include"
  )
  target_compile_definitions("JSgranulatorFX" PRIVATE
    "NDEBUG"
    "AK_OPTIMIZED"
  )
  target_compile_options("JSgranulatorFX" PRIVATE "-ffast-math")
  target_compile_options("JSgranulatorFX" PRIVATE "-fPIC")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-conversion-null")
  target_compile_options("JSgranulatorFX" PRIVATE "-Wno-deprecated-declarations")
  target_compile_options("JSgranulatorFX" PRIVATE "-fvisibility=hidden")
  target_compile_options("JSgranulatorFX" PRIVATE "-fno-rtti")
  target_compile_options("JSgranulatorFX" PRIVATE "-ffunction-sections")
  target_compile_options("JSgranulatorFX" PRIVATE "-fdata-sections")
  if (MSVC)
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:/O2>
      $<$<COMPILE_LANGUAGE:C>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/O2>
      $<$<COMPILE_LANGUAGE:CXX>:/MD>
      $<$<COMPILE_LANGUAGE:CXX>:/GR->
    )
  else()
    target_compile_options("JSgranulatorFX" PRIVATE
      $<$<COMPILE_LANGUAGE:C>:-m64>
      $<$<COMPILE_LANGUAGE:C>:-O3>
      $<$<COMPILE_LANGUAGE:C>:-std=c11>
      $<$<COMPILE_LANGUAGE:CXX>:-m64>
      $<$<COMPILE_LANGUAGE:CXX>:-O3>
      $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
      $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    )
  endif()
  set_target_properties("JSgranulatorFX" PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    POSITION_INDEPENDENT_CODE False
    INTERPROCEDURAL_OPTIMIZATION False
  )
endif()
