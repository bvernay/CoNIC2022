/* January 2022
 * vernayb@igbmc.fr
 * convert 32-bit tif image into 16-bit tif image 
 * set on minimum and maximum values of the histogram without 
 * scaling while converting
 * 
 * 
 */


setBatchMode(true);
run("Conversions...", " ");

dir1 = getDirectory("Source");
dir2 = getDirectory("Target");
fileList = getFileList(dir1);

for (i = 0; i < lengthOf(fileList); i++) {
    if (endsWith(fileList[i], ".tif")) { 
        open(dir1 + File.separator + fileList[i]);
        getMinAndMax(min, max);
		//print(min, max);
		setMinAndMax(min, max);
		run("16-bit");
		saveAs("tiff", dir2 + File.separator + fileList[i]);
		close();
    } 
}


run("Conversions...", "scale");
