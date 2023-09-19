project(dagp)

aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/common COM_FILES)
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/recBisection REC_FILES)

add_library(${PROJECT_NAME} STATIC ${COM_FILES} ${REC_FILES})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/common ${CMAKE_CURRENT_SOURCE_DIR}/recBisection)
include_directories(${METIS_INC})

add_definitions(-DdagP_METIS)