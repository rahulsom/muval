package gov.nist.mu.validation;

import java.io.*;
import java.nio.file.Files;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class Ruleset {
    private final String resource;
    private final String fileName;

    public Ruleset(String resourceName, String filename) {
        this.resource = resourceName;
        this.fileName = filename;
    }

    private File destFile = null;

    public synchronized File getFile() throws IOException {
        if (destFile == null) {
            destFile = Files.createTempDirectory("muval").toFile();
            InputStream resourceAsStream = this.getClass().getClassLoader().getResourceAsStream("schematron/" + resource);
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
        return new File(destFile.getAbsolutePath() , fileName);
    }

    private static final int BUFFER_SIZE = 4096;

    private void extractFile(ZipInputStream zipIn, String filePath) throws IOException {
        BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(filePath));
        byte[] bytesIn = new byte[BUFFER_SIZE];
        int read = 0;
        while ((read = zipIn.read(bytesIn)) != -1) {
            bos.write(bytesIn, 0, read);
        }
        bos.close();
    }

    public static Ruleset stylesheet = new Ruleset("stylesheet", "schematron-Validator-report.xsl");
    public static Ruleset schema = new Ruleset("schema", "infrastructure/cda/C32_CDA.xsd");

}
