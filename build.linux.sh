#/bin/bash
LIBS=./libs
BIN=./bin
TMP=./tmp
RAYLIB=$BIN
PASFILES=./src/*.pas
STATIC=false
DEBUG=

if test -f "$1"; then
    PASFILES=$1
fi

if [[ $@ == *'--static'* ]]
then
  STATIC=true
fi

if [[ $@ == *'--debug'* ]]
then
  DEBUG="-g -O1"
fi

for pasfile in $PASFILES
do
  if [ $STATIC = true ]
  then
    # https://github.com/glfw/glfw/issues/1517 Note ./bin must contain libglfw3.a and libraylib.a
    fpc -k-lpthread -k-lm -k-lz -k-lGL -k-lX11 -k-lXext -k-lXfixes -k-ldl -Fu$BIN -Fl$LIBS -Fu$LIBS -FE$BIN -FU$TMP $DEBUG $pasfile
  else
    fpc -Fl$RAYLIB -Fl$LIBS -Fu$LIBS -FE$BIN -FU$TMP $DEBUG $pasfile
  fi
done
