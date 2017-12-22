
ADD_LIBRARY ( PyImath ${LIB_TYPE}
    PyImath.cpp
    PyImathAutovectorize.cpp
    PyImathBox2Array.cpp
    PyImathBox3Array.cpp
    PyImathBox.cpp
    PyImathColor3.cpp
    PyImathColor4.cpp
    PyImathEuler.cpp
    PyImathFixedArray.cpp
    PyImathFrustum.cpp
    PyImathLine.cpp
    PyImathMatrix33.cpp
    PyImathMatrix44.cpp
    PyImathPlane.cpp
    PyImathQuat.cpp
    PyImathRandom.cpp
    PyImathShear.cpp
    PyImathStringArray.cpp
    PyImathStringTable.cpp
    PyImathTask.cpp
    PyImathUtil.cpp
    PyImathFixedVArray.cpp
    PyImathVec2fd.cpp
    PyImathVec2si.cpp
    PyImathVec3fd.cpp
    PyImathVec3siArray.cpp
    PyImathVec3si.cpp
    PyImathVec4fd.cpp
    PyImathVec4siArray.cpp
    PyImathVec4si.cpp

)

SET_TARGET_PROPERTIES ( PyImath
	PROPERTIES DEFINE_SYMBOL "PYIMATH_EXPORTS"
)

TARGET_LINK_LIBRARIES ( PyImath
	Iex${ILMBASE_LIBSUFFIX}
	IexMath${ILMBASE_LIBSUFFIX}
	Imath${ILMBASE_LIBSUFFIX}
	${Boost_LIBRARIES}
	${PYTHON_LIBRARIES}
)

INSTALL ( TARGETS PyImath
	DESTINATION
	lib
)

ADD_LIBRARY ( imath SHARED
    imathmodule.cpp
    PyImathFun.cpp
    PyImathBasicTypes.cpp 
)

IF (CMAKE_SYSTEM_NAME STREQUAL "Linux")
    SET_TARGET_PROPERTIES ( imath
        PROPERTIES PREFIX "" SUFFIX ".so" BUILD_WITH_INSTALL_RPATH ON
    )
ELSE ()
    SET_TARGET_PROPERTIES ( imath
        PROPERTIES PREFIX "" SUFFIX ".pyd" BUILD_WITH_INSTALL_RPATH ON
    )
ENDIF()

IF (${LIB_TYPE} EQUAL "STATIC")
    SET_TARGET_PROPERTIES ( PyImath
        PROPERTIES DEFINE_SYMBOL "PYIEX_EXPORTS"
    )
ELSE ()
    add_definitions(-DPLATFORM_BUILD_STATIC)
ENDIF()

TARGET_LINK_LIBRARIES ( imath
	PyImath
	PyIex
	Imath${ILMBASE_LIBSUFFIX}
	Iex${ILMBASE_LIBSUFFIX}
	${Boost_LIBRARIES}
)

INSTALL ( TARGETS imath
	DESTINATION lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages
)

