#[[ Cmake guard. ]]
if(TARGET FlatBuffersExternalProject)
    return()
endif()

include(ExternalProject)

set(ROBOT_FARM_FLAT_BUFFERS_URL
    "https://github.com/google/flatbuffers/archive/v1.11.0.zip"
    CACHE STRING
    "URL of the Flat Buffers source archive")

externalproject_add(FlatBuffersExternalProject
                    PREFIX ${CMAKE_CURRENT_BINARY_DIR}/flatbuffers
                    URL ${ROBOT_FARM_FLAT_BUFFERS_URL}
                    DOWNLOAD_NO_PROGRESS ON
                    CMAKE_ARGS
                    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
                    -DCMAKE_PREFIX_PATH:PATH=${CMAKE_INSTALL_PREFIX}
                    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
                    -DFLATBUFFERS_BUILD_SHAREDLIB:BOOL=ON)
