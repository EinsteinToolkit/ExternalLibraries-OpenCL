#! /bin/bash

################################################################################
# Prepare
################################################################################

# Set up shell
set -x                          # Output commands
set -e                          # Abort on errors



################################################################################
# Configure Cactus
################################################################################

if [ -z "${OPENCL_DIR}" ]; then
    echo "BEGIN ERROR"
    echo "OpenCL selected, but OPENCL_DIR not set."
    echo "END ERROR"
fi

# Set options

: ${OPENCL_INC_DIRS:=${OPENCL_DIR}/include}
: ${OPENCL_LIB_DIRS:=${OPENCL_DIR}/lib}
: ${OPENCL_LIBS:=OpenCL}

echo "BEGIN MAKE_DEFINITION"
echo "HAVE_OPENCL     = 1"
echo "OPENCL_DIR      = ${OPENCL_DIR}"
echo "OPENCL_INC_DIRS = ${OPENCL_INC_DIRS}"
echo "OPENCL_LIB_DIRS = ${OPENCL_LIB_DIRS}"
echo "OPENCL_LIBS     = ${OPENCL_LIBS}"
echo "END MAKE_DEFINITION"

echo 'INCLUDE_DIRECTORY $(OPENCL_INC_DIRS)'
echo 'LIBRARY_DIRECTORY $(OPENCL_LIB_DIRS)'
echo 'LIBRARY           $(OPENCL_LIBS)'
