project(useapi)

SET(METIS_INC /home/zli/Documents/PhD/AI_EDA/Partition_mcyang/submit/metis/include)
SET(METIS_LIB /home/zli/Documents/PhD/AI_EDA/Partition_mcyang/submit/metis/build/Linux-x86_64/libmetis)

add_subdirectory(src)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/common)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/recBisection)

include_directories(${METIS_INC})

# link_directories(${CMAKE_CURRENT_SOURCE_DIR})
link_directories(${METIS_LIB})

add_executable(${PROJECT_NAME} src/useapi.cpp)

target_link_libraries(${PROJECT_NAME} dagp metis)