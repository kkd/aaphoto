AC_INIT([aaphoto], [0.45], [mail@log69.com])
AM_INIT_AUTOMAKE
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

# AC_PREREQ([2.67])
AC_CONFIG_SRCDIR([aaphoto.c])
AC_CONFIG_HEADERS([config.h])

# Check for pkg-config
PKG_PROG_PKG_CONFIG

# Checks for programs.
AC_PROG_CC

# Check for OpenMP support
AC_OPENMP

# Check for Homebrew paths on macOS
if test "$host_os" = "darwin"; then
    AC_MSG_NOTICE([Detected macOS, checking for Homebrew paths])
    
    # Check if Homebrew is available
    AC_CHECK_PROG([BREW], [brew], [brew], [no])
    if test "$BREW" != "no"; then
        HOMEBREW_PREFIX=`$BREW --prefix`
        AC_MSG_NOTICE([Homebrew prefix: $HOMEBREW_PREFIX])
        
        # Add Homebrew paths to search paths
        CPPFLAGS="-I$HOMEBREW_PREFIX/include $CPPFLAGS"
        LDFLAGS="-L$HOMEBREW_PREFIX/lib $LDFLAGS"
        PKG_CONFIG_PATH="$HOMEBREW_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
        export PKG_CONFIG_PATH
    fi
fi

# Checks for libraries using pkg-config when possible
# JPEG
PKG_CHECK_MODULES([JPEG], [libjpeg], [
    JPEG_CFLAGS="$JPEG_CFLAGS"
    JPEG_LIBS="$JPEG_LIBS"
], [
    # Fallback to traditional check
    AC_CHECK_LIB([jpeg], [main], [JPEG_LIBS="-ljpeg"], [
        AC_MSG_ERROR([libjpeg not found. Please install libjpeg-turbo or libjpeg])
    ])
])

# PNG
PKG_CHECK_MODULES([PNG], [libpng], [
    PNG_CFLAGS="$PNG_CFLAGS"
    PNG_LIBS="$PNG_LIBS"
], [
    # Fallback to traditional check
    AC_CHECK_LIB([png], [main], [PNG_LIBS="-lpng"], [
        AC_MSG_ERROR([libpng not found. Please install libpng])
    ])
])

# ZLIB
PKG_CHECK_MODULES([ZLIB], [zlib], [
    ZLIB_CFLAGS="$ZLIB_CFLAGS"
    ZLIB_LIBS="$ZLIB_LIBS"
], [
    # Fallback to traditional check
    AC_CHECK_LIB([z], [compress], [ZLIB_LIBS="-lz"], [
        AC_MSG_ERROR([zlib not found. Please install zlib])
    ])
])

# Math library
AC_CHECK_LIB([m], [pow], [MATH_LIBS="-lm"])

# Set final flags
AC_SUBST([JPEG_CFLAGS])
AC_SUBST([JPEG_LIBS])
AC_SUBST([PNG_CFLAGS])
AC_SUBST([PNG_LIBS])
AC_SUBST([ZLIB_CFLAGS])
AC_SUBST([ZLIB_LIBS])
AC_SUBST([MATH_LIBS])

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h])

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([pow sqrt])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
