package gov.nist.mu.validation;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import lombok.extern.slf4j.Slf4j;

/**
 * Extracts cache to a temp directory. This is required because of the way schematron validators work.
 * They expect to be on the file system. Loading them via classpath is hard.
 *
 * @author rahul somasunderam
 *
 */
@Slf4j
class FileCache {
    private static class Holder {
        static FileCache instance = new FileCache();
    }

    public static FileCache getInstance() {
        return Holder.instance;
    }

    @lombok.Getter(lombok.AccessLevel.PACKAGE)
    private File destFile;

    private FileCache() {
        try {
            destFile = Files.createTempDirectory("muval").toFile();
            extract("cachefile", destFile);
        } catch (IOException e) {
            log.error("Failed to create temp directory", e);
        }
    }

    private static void extract(String resource, File destFile) throws IOException {
        InputStream resourceAsStream = FileCache.class.getClassLoader().getResourceAsStream(resource);
        ZipInputStream zipIn = new ZipInputStream(resourceAsStream);

        ZipEntry entry = zipIn.getNextEntry();

        while (entry != null) {
            File outFile = new File(destFile, entry.getName());
            String destDirPath = destFile.getCanonicalPath();
            String outFilePath = outFile.getCanonicalPath();
            if (!outFilePath.startsWith(destDirPath + File.separator)) {
                throw new IOException("Zip entry is outside of the target dir: " + entry.getName());
            }
            if (!entry.isDirectory()) {
                // Ensure parent directories exist
                File parent = outFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                extractFile(zipIn, outFile);
            } else {
                outFile.mkdirs();
            }
            zipIn.closeEntry();
            entry = zipIn.getNextEntry();
        }
        zipIn.close();
    }

    private static final int BUFFER_SIZE = 4096;

    private static void extractFile(ZipInputStream zipIn, File outFile) throws IOException {
        try(BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(outFile))) {
            byte[] bytesIn = new byte[BUFFER_SIZE];
            int read;
            while ((read = zipIn.read(bytesIn)) != -1) {
                bos.write(bytesIn, 0, read);
            }
        }
    }

}
