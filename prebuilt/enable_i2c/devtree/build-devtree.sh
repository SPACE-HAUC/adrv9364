#!/bin/bash
echo "This tool builds device tree blob from the supplied .hdf file"

#set -ex

HDF_FILE=$1
BUILD_DIR=build_devtree

usage () {
	echo usage: $0 system_top.hdf
	exit 1
}

depends () {
	echo Xilinx $1 must be installed and in your PATH
	echo try: source /opt/Xilinx/Vivado/201x.x/settings64.sh
	exit 1
}

### Check command line parameters
echo $HDF_FILE | grep -q ".hdf" || usage

if [ ! -f $HDF_FILE ]; then
    echo $HDF_FILE: File not found!
    usage
fi

### Check for required Xilinx tools
command -v xsdk >/dev/null 2>&1 || depends xsdk

rm -Rf $BUILD_DIR
mkdir -p $BUILD_DIR

cp $HDF_FILE $BUILD_DIR/
WORK_DIR=`pwd`
cd $WORK_DIR/$BUILD_DIR
echo "hsi open_hw_design `basename $HDF_FILE`" > build_devtree.tcl
echo "hsi set_repo_path \"/home/sunip/xilinx_linux/device-tree-xlnx\"" >> build_devtree.tcl
echo 'set cpu_name [lindex [hsi get_cells -filter {IP_TYPE==PROCESSOR}] 0]' >> build_devtree.tcl
echo 'hsi create_sw_design device-tree -os device_tree -proc $cpu_name' >> build_devtree.tcl
echo "hsi generate_target -dir ./" >> build_devtree.tcl
#echo 'puts stdout $cpu_name' >> $BUILD_DIR/build_devtree.tcl #debug

## Build Target
xsdk -batch build_devtree.tcl

cd $WORK_DIR
## Build Blob
for ENTRY in `ls $BUILD_DIR`; do
    if grep -q "/dts-v1/" "$BUILD_DIR/$ENTRY"; then
        dtc -I dts -O dtb -o devicetree.dtb $BUILD_DIR/$ENTRY
    fi
done