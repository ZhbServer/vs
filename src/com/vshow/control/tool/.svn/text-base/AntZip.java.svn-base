package com.vshow.control.tool;

 

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

public class AntZip {

	public static void unzip(String zipFilePath, String targetPath)
			throws IOException {

		OutputStream os = null;
		InputStream is = null;
		ZipFile zipFile = null;

		try {

			zipFile = new ZipFile(zipFilePath);

			String directoryPath = "";

			if (null == targetPath || "".equals(targetPath)) {

				directoryPath = zipFilePath.substring(0,
						zipFilePath.lastIndexOf("."));
			} else {
				directoryPath = targetPath;
			}

			Enumeration entryEnum = zipFile.getEntries();

			if (null != entryEnum) {

				ZipEntry zipEntry = null;

				while (entryEnum.hasMoreElements()) {

					zipEntry = (ZipEntry) entryEnum.nextElement();

					if (zipEntry.isDirectory()) {
						directoryPath = directoryPath + File.separator
								+ zipEntry.getName();
						continue;
					}
					if (zipEntry.getSize() > 0) {

							File targetFile = AntZip.buildFile(directoryPath
									+ File.separator + zipEntry.getName(), false);

							os = new BufferedOutputStream(new FileOutputStream(
									targetFile));

							is = zipFile.getInputStream(zipEntry);
							byte[] buffer = new byte[4096];
							int readLen = 0;
							while ((readLen = is.read(buffer, 0, 4096)) >= 0) {
								os.write(buffer, 0, readLen);
							}
							os.flush();
							os.close();
					
					
					} else {

						
						File f = new File(directoryPath + File.separator
								+ zipEntry.getName());
						if(f.isDirectory()==false)
						{
							AntZip.buildFile(directoryPath + File.separator
									+ zipEntry.getName(), false);
						}else
						{
							AntZip.buildFile(directoryPath + File.separator
								+ zipEntry.getName(), true);
						}
					
					}
				}
			}
		} catch (IOException e) {
		} finally {
			if (null != is) {
				is.close();
			}
			if (null != os) {
				os.close();
			}
			if (null != zipFile) {
				zipFile.close();
				zipFile=null;
			}
		}
	}

	public static File buildFile(String fileName, boolean isDirectory) {
		File target = new File(fileName);
		if (isDirectory) {
			target.mkdirs();
		} else {
			if (!target.getParentFile().exists()) {
				target.getParentFile().mkdirs();
				target = new File(target.getAbsolutePath());
			}
		}
		return target;
	}

}
