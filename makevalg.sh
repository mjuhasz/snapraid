#!/bin/sh
#
# Run all the Valgrind tests
#

# Source directory
SOURCE=`pwd`

# Dest directory
DEST=`mktemp -d`

make distclean

cd $DEST

cp $SOURCE/valgrind.supp $DEST

# Valgrind
if ! $SOURCE/configure --enable-valgrind; then
	exit 1
fi

if ! make check distclean; then
	exit 1
fi

# Helgrind
if ! $SOURCE/configure --enable-helgrind; then
	exit 1
fi

if ! make check distclean; then
	exit 1
fi

# Drd
if ! $SOURCE/configure --enable-drd; then
	exit 1
fi

if ! make check distclean; then
	exit 1
fi

cd $SOURCE
