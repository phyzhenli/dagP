project(useapi)

SET(METIS_INC /home/zli/Documents/PhD/AI_EDA/Partition_mcyang/submit/metis/include)
# SET(METIS_LIB_DIR /home/zli/Documents/PhD/AI_EDA/Partition_mcyang/submit/metis/build/Linux-x86_64/libmetis)

add_subdirectory(src)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/common)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src/recBisection)

# link_directories(${METIS_LIB_DIR})
# ref: https://stackoverflow.com/questions/31438916/cmake-cannot-find-library-using-link-directories

add_executable(${PROJECT_NAME} src/useapi.cpp)

find_library(METIS_LIB metis /home/zli/Documents/PhD/AI_EDA/Partition_mcyang/submit/metis/build/Linux-x86_64/libmetis)
target_link_libraries(${PROJECT_NAME} dagp ${METIS_LIB})