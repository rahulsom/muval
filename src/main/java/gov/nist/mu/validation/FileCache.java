package gov.nist.mu.validation;

import java.io.*;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * Created by rahul on 3/9/16.
 */
public class FileCache {
    static class Holder {
        static FileCache instance = new FileCache();
    }

    public static FileCache getInstance() {
        return Holder.instance;
    }

    private File destFile;
    private FileCache() {
        try {
            destFile = Files.createTempDirectory("muval").toFile();
            final File stylesheetDir = new File(destFile, "stylesheet");
            stylesheetDir.mkdirs();
            extract("stylesheet", stylesheetDir);
            extract("cachefile", destFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public File getDestFile() {
        return destFile;
    }

    private static void extract(String resource, File destFile) throws IOException {
        InputStream resourceAsStream = FileCache.class.getClassLoader().getResourceAsStream(resource);
        ZipInputStream zipIn = new ZipInputStream(resourceAsStream);

        ZipEntry entry = zipIn.getNextEntry();

        while (entry != null) {
            String filePath = destFile + File.separator + entry.getName();
            if (!entry.isDirectory()) {
                extractFile(zipIn, filePath);
            } else {
                File dir = new File(filePath);
                dir.mkdir();
            }
            zipIn.closeEntry();
            entry = zipIn.getNextEntry();
        }
        zipIn.close();
    }

    private static final int BUFFER_SIZE = 4096;

    private static void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
        byte[] bytesIn = new byte[BUFFER_SIZE];
        int read = 0;
        while ((read = zipIn.read(bytesIn)) != -1) {
            bos.write(bytesIn, 0, read);
        }
        bos.close();
    }



}
