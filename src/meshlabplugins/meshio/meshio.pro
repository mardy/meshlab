TEMPLATE      = lib
CONFIG       += plugin
INCLUDEPATH  += ../.. ../../../../sf ../../../../code/lib/glew/include ../../../../code/lib/lib3ds-1.2.0
HEADERS       = meshio.h \
				../../../../sf/wrap/ply/plylib.h \
				../../../../sf/wrap/io_trimesh/export_obj.h \
				../../../../sf/wrap/io_trimesh/export_3ds.h \
				import_obj.h \
				import_3ds.h \
				io_obj.h \
				io_3ds.h \
				../../../../sf/wrap/io_trimesh/io_3ds_obj_material.h
SOURCES       = meshio.cpp \
				../../../../sf/wrap/ply/plylib.cpp
TARGET        = meshio
DESTDIR       = ../../meshlab/plugins

win32:LIBS	+= ../../../../code/lib/lib3ds-1.2.0/lib3ds-120s.lib

# the following line is needed to avoid mismatch between 
# the awful min/max macros of windows and the limits max
win32:DEFINES += NOMINMAX
unix{
	QMAKE_CC	 = gcc-3.3
	QMAKE_CXX	 = g++-3.3
	QMAKE_LINK	 = gcc-3.3
	CONFIG		+= warn_off debug_and_release
	LIBS		+= -l3ds
}


contains(TEMPLATE,lib) {
   CONFIG(debug, debug|release) {
      unix:TARGET = $$member(TARGET, 0)_debug
      else:TARGET = $$member(TARGET, 0)d
   }
}
