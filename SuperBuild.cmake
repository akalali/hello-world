#----------
# External project settings
#----------

# Set EP_BASE PROPERTY for a more compact ep-directory structure
set(EP_BASE "${CMAKE_BINARY_DIR}/ep")
set_property(DIRECTORY PROPERTY EP_BASE ${EP_BASE})

# Add external projects
include(ExternalProject)
include(CMakeExternals/Poco.cmake)

# Add custom external project to process inner build
ExternalProject_Add(ConfigureBuild
  DEPENDS Poco
  SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}
  DOWNLOAD_COMMAND ""
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
  CMAKE_CACHE_ARGS
    -DUSE_SUPERBUILD:BOOL=OFF
    -DPoco_DIR:PATH=${EP_BASE}/Build/Poco/Poco
  BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/Hello-World
)
