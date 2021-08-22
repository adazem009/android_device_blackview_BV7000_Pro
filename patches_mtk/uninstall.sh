# Do not change anything in this file!
# Edit config.sh instead
source device/blackview/BV7000_Pro/patches_mtk/config.sh

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Reverting $dir patches..."
	git checkout -- .
	git clean -fd
	echo " "
done

cd $rootdirectory
