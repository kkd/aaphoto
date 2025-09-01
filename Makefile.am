AM_CFLAGS = -Wall -O2 $(OPENMP_CFLAGS) $(JPEG_CFLAGS) $(PNG_CFLAGS) $(ZLIB_CFLAGS)
AM_LDFLAGS = $(OPENMP_FCFLAGS) $(JPEG_LIBS) $(PNG_LIBS) $(ZLIB_LIBS) $(MATH_LIBS)

bin_PROGRAMS = aaphoto
aaphoto_SOURCES = aaphoto.c

# Ensure proper linking order
aaphoto_LDADD = $(JPEG_LIBS) $(PNG_LIBS) $(ZLIB_LIBS) $(MATH_LIBS)
