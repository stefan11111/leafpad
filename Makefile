INCLUDES = -I. -I.. -I/usr/include/gtk-2.0 -I/usr/lib64/gtk-2.0/include -I/usr/include/pango-1.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/lib64/libffi/include -pthread -I/usr/include/fribidi -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include -I/usr/include/cairo -I/usr/include/libpng16 -I/usr/include/freetype2 -I/usr/include/pixman-1
DEFINES = -DHAVE_CONFIG_H -DICONDIR=\"/usr/share/pixmaps\"

PREFIX = /usr/local

HEADERS = \
	leafpad.h \
	window.h \
	menu.h \
	callback.h \
	view.h \
	undo.h \
	font.h \
	linenum.h \
	indent.h \
	hlight.h \
	selector.h \
	file.h \
	encoding.h \
	search.h \
	dialog.h \
	gtkprint.h \
	gnomeprint.h \
	about.h \
	dnd.h \
	utils.h \
	emacs.h \
	gtksourceiter.h \
	i18n.h

SOURCES = \
	main.c \
	window.c \
	menu.c \
	callback.c \
	view.c \
	undo.c \
	font.c \
	linenum.c \
	indent.c \
	hlight.c \
	selector.c \
	file.c \
	encoding.c \
	search.c \
	dialog.c \
	gtkprint.c \
	gnomeprint.c \
	about.c \
	dnd.c \
	utils.c \
	emacs.c \
	gtksourceiter.c

OBJ = \
	main.o \
	window.o \
	menu.o \
	callback.o \
	view.o \
	undo.o \
	font.o \
	linenum.o \
	indent.o \
	hlight.o \
	selector.o \
	file.o \
	encoding.o \
	search.o \
	dialog.o \
	gtkprint.o \
	gnomeprint.o \
	about.o \
	dnd.o \
	utils.o \
	emacs.o \
	gtksourceiter.o

FLAGS = -Wall -Wextra -Werror
LIBS   = -lgtk-x11-2.0 -lgdk-x11-2.0 -lpangocairo-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lharfbuzz -lfontconfig -lfreetype

XCFLAGS = ${FLAGS} ${DEFINES} ${INCLUDES} ${CFLAGS}

all: leafpad

.c.o:
	${CC} ${XCFLAGS} -c -o $@ $<

leafpad: ${OBJ} ${HEADERS} ${SOURCES}
	${CC} ${XCFLAGS} ${LIBS} ${LDFLAGS} -o $@ ${OBJ}

install: leafpad
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f leafpad ${DESTDIR}${PREFIX}/bin

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/leafpad

clean:
	rm -f leafpad ${OBJ}

.PHONY: all clean install uninstall
