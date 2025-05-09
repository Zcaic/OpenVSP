
SET( EIGEN_DIR_STRING "" )
SET( EIGEN_DEPENDS_STRING "" )

IF( NOT VSP_USE_SYSTEM_EIGEN )
	SET( EIGEN_DIR_STRING "-DEigen3_DIR=${EIGEN_INSTALL_DIR}" )
	SET( EIGEN_DEPENDS_STRING "EIGEN" )
ENDIF()

MESSAGE( STATUS "EIGEN_DIR_STRING " ${EIGEN_DIR_STRING} )
MESSAGE( STATUS "EIGEN_DEPENDS_STRING " ${EIGEN_DEPENDS_STRING} )

ExternalProject_Add( OPENABF
	URL ${CMAKE_CURRENT_SOURCE_DIR}/OpenABF-ed546ea85410.zip
	DOWNLOAD_EXTRACT_TIMESTAMP TRUE
	CMAKE_ARGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
		-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
		-DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
		-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
		-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
		-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
		-DBUILD_SHARED_LIBS=OFF
		${EIGEN_DIR_STRING}
	DEPENDS ${EIGEN_DEPENDS_STRING}
)
ExternalProject_Get_Property( OPENABF INSTALL_DIR )
SET( OPENABF_INSTALL_DIR ${INSTALL_DIR} )
