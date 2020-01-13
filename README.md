cmake_utilities_boostrap
========================

### About

This repository provides a single cmake module that uses CMake's
FetchContent to fetch a collection of CMake modules.  The intent is
for this repository to be included in other projects as a Git
submodule.  The hope is that this repository will provide a stable
mechanism for accessing the other repository and not be unduely
combersome when consumed as a Git submodule.

### Usage

To add this repository as a submodule
```bash
git submodule add https://github.com/sabjohnso/cmake_utilities_boostrap <relative-path-for-submodule>
```

#### Minimal usage
```cmake
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/<relative-path-for-submodule>)
find_package(CMakeUtilities REQUIRED)
```

#### More helpful usage
```cmake
list(INSERT CMAKE_MODULE_PATH 0 ${PROJECT_SOURCE_DIR}/<relative-path-for-submodule>)
find_package(CMakeUtilities)
if(NOT CMakeUtilities_FOUND)
  message(FATAL_ERROR "CMakeUtilities was not found. It is likely that you did not update the git submodules")
endif()
```

####  Automated but obfuscating usage
```cmake
find_package(cmake_utilities)
if(NOT cmake_utilities_FOUND)
  
  find_package(Git REQUIRED)

  execute_process(${GIT_EXECUTABLE}
    COMMAND git submodule update --recursive
    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
  
endif()
```



