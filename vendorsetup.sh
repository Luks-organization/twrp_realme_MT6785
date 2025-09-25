# Make the build faster using ccache
export USE_CCACHE=1
export CCACHE_DIR=".ccache"
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_MAXSIZE="50G"

if [ ! -d ${CCACHE_DIR} ]; then
  mkdir $CCACHE_DIR
fi
