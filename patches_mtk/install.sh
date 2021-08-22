# Do not change anything in this file!
# Edit config.sh instead
source $rootdirectory/device/blackview/BV7000_Pro/patches_mtk/config.sh

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdirectory/device/blackview/BV7000_Pro/patches_mtk/$dir/*.patch
	echo " "
done

cd $rootdirectory
