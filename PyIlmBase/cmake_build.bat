cmake -G "Visual Studio 14 2015 Win64" -DCMAKE_INSTALL_PREFIX=..\deploy -DBUILD_SHARED_LIBS=OFF -DPYTHON_LIBRARY=C:\Python27\libs\python27.lib -DPYTHON_INCLUDE_DIR=C:\Python27\include -DBOOST_ROOT=Z:\code\third_party\boost_1_55_0 -DBOOST_LIBRARYDIR=Z:\code\third_party\boost_1_55_0\stage\lib -DBoost_USE_STATIC_LIBS=ON -DILMBASE_PACKAGE_PREFIX=Z:\code\third_party\alembic\openexr\IlmBase\deploy ..