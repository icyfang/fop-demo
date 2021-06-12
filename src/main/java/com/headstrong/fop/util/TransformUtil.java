package com.headstrong.fop.util;

import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.google.common.collect.Lists;
import lombok.extern.java.Log;
import org.apache.commons.io.FileUtils;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@Log
public class TransformUtil {

    private TransformUtil() {
    }

    private final static String xconfPath = "src/main/resources/fop.xconf.xml";

    public static void transformToFile(Object object, String fileName) throws IOException {
        XmlMapper xmlMapper = new XmlMapper();
        xmlMapper.enable(SerializationFeature.INDENT_OUTPUT);
        String[] split = xmlMapper.writeValueAsString(object).split("\r\n");
        FileUtils.writeLines(new File(fileName), Lists.newArrayList(split));
    }

    public static void generatePdfFile(String xml, String xsl, String pdf) throws Exception {
        // Setup input and output files
        File xmlFile = new File(xml);
        File xsltFile = new File(xsl);
        File pdfFile = new File(pdf);
        File file = new File(xconfPath);
        FopFactory fopFactory = FopFactory.newInstance(file);
        // Setup output

        try (OutputStream out = new BufferedOutputStream(new FileOutputStream(pdfFile))) {
            // generate pdf with password
//            FOUserAgent userAgent = fopFactory.newFOUserAgent();
//            userAgent.getRendererOptions().put("encryption-params", new PDFEncryptionParams(
//                    "userPass", "password", false, false, true, true, true));
//            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, userAgent, out);
            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);

            // Setup XSLT
            TransformerFactory factory = TransformerFactory.newInstance();
            Transformer transformer = factory.newTransformer(new StreamSource(new FileInputStream(xsltFile)));

            // Set the value of a <param> in the stylesheet
            transformer.setParameter("versionParam", "2.0");

            // Setup input for XSLT transformation
            Source src = new StreamSource(new FileInputStream(xmlFile));

            // Resulting SAX events (the generated FO) must be piped through to FOP
            Result res = new SAXResult(fop.getDefaultHandler());

            // Start XSLT transformation and FOP processing
            transformer.transform(src, res);
        }
        log.info("Success!");
    }

}
