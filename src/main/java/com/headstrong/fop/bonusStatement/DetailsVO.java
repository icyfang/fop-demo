package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class DetailsVO {

    List<DetailsRecordVO> hkdRecords;
    List<DetailsRecordVO> usdRecords;
    BigDecimal overrideSubTotalHKD;
    BigDecimal saSubTotalHKD;
    BigDecimal overrideSubTotalUSD;
    BigDecimal saSubTotalUSD;
    BigDecimal saGrandTotalHKD;
    BigDecimal overrideGrandTotalHKD;
    boolean sa;
}
