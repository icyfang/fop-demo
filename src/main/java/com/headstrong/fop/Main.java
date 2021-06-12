package com.headstrong.fop;

import com.headstrong.fop.bonusStatement.ReportData;
import com.headstrong.fop.util.TransformUtil;

public class Main {

    public static void main(String[] args) throws Exception {

        genPdf("bonusStatement", ReportData.data());
        genPdf("paymentSummary", com.headstrong.fop.payment.ReportData.data());
    }

    private static void genPdf(String t, Object o) throws Exception {
        TransformUtil.transformToFile(o, "src/main/resources/" + t + ".xml");
        TransformUtil.generatePdfFile(
                "src/main/resources/" + t + ".xml",
                "src/main/resources/" + t + ".xsl",
                "src/main/resources/" + t + ".pdf");
    }
}
