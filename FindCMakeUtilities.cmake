include(FetchContent)

set(cmake_utilities_REPOSITORY https://github.com/sabjohnso/cmake_utilities
  CACHE STRING "URL for the cmake_utilities repository")

if(NOT cmake_utilities_TAG)
  if(ENV{CMAKE_UTILITIES_TAG})
    set(cmake_utilities_TAG $ENV{CMAKE_UTILITIES_TAG}
      CACHE STRING "Tag for the cmake_utilities repository")
  endif()
endif()

if(cmake_utilities_TAG)
  FetchContent_Declare(cmake_utilities
    GIT_REPOSITORY ${cmake_utilities_REPOSITORY}
    GIT_TAG ${cmake_utilities_TAG})
else()
  FetchContent_Declare(cmake_utilities
    GIT_REPOSITORY https://github.com/sabjohnso/cmake_utilities)
endif()

FetchContent_GetProperties(cmake_utilities)
if(NOT cmake_utilities_POPULATED)
  FetchContent_MakeAvailable(cmake_utilities)
  list(INSERT CMAKE_MODULE_PATH 0 ${cmake_utilities_SOURCE_DIR})
  set(CMakeUtilities_FOUND TRUE)
endif()
