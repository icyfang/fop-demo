package com.headstrong.fop.bonusStatement;

import lombok.Data;

import java.util.List;

/**
 * @author Hodur
 * @since 2021-05-18
 */
@Data
public class BonusStatementVO {

    List<BonusStatementRecordVO> statementRecords;

    String date;
}
