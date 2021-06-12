<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version=".0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/BonusStatementVO">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="MasterPage"
                                       page-width="29.7cm"
                                       page-height="21cm"
                                       margin-top="0.5cm"
                                       margin-bottom="0.5cm"
                                       margin-left="0.3cm"
                                       margin-right="0.3cm">
                    <fo:region-body margin-top="4.8cm"/>
                    <fo:region-before region-name="normal-header"/>
                    <fo:region-after extent="3cm" region-name="normal-footer"/>
                    <fo:region-start extent="0cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <xsl:for-each select="statementRecords/statementRecords">
                <xsl:call-template name="summary"/>
                <xsl:call-template name="details"/>
                <xsl:call-template name="accrualPayment"/>
                <xsl:call-template name="adjustment"/>
            </xsl:for-each>
        </fo:root>
    </xsl:template>

    <xsl:template name="summary">
        <fo:page-sequence master-reference="MasterPage" initial-page-number="1">
            <fo:static-content flow-name="normal-header">
                <xsl:call-template name="header">
                    <xsl:with-param name="headerName" select="'Summary'"/>
                </xsl:call-template>
            </fo:static-content>

            <fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:table border-color="black" border-style="none">
                        <xsl:choose>
                            <xsl:when test="summary/sa ='true'">
                                <fo:table-column column-width="12%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="6%"/>
                                <fo:table-column column-width="10%"/>
                                <fo:table-column column-width="12%"/>
                                <fo:table-column column-width="8%"/>
                                <fo:table-column column-width="8%"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:table-column column-width="12%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="6%"/>
                                <fo:table-column column-width="12%"/>
                                <fo:table-column column-width="8%"/>
                                <fo:table-column column-width="8%"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- 定义表头 //-->
                        <fo:table-header font-size="8px" text-align="center" margin-right="1px" margin-left="1px"
                                         margin-top="1px" margin-bottom="1px">
                            <fo:table-row border-style="none none solid">
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                                        Currency
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                              text-align="right">
                                        Override
                                    </fo:block>
                                </fo:table-cell>
                                <xsl:if test="summary/sa='true'">
                                    <fo:table-cell border-color="black">
                                        <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                                  text-align="right">
                                            Sales Allowance
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                              text-align="right">
                                        Payment from accrual
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                              text-align="right">
                                        Adjustment
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                              text-align="right">
                                        Grand Total
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <!-- table data //-->
                        <xsl:variable name="sa" select="summary/sa"/>
                        <fo:table-body>
                            <fo:table-row font-size="8px" border-color="white" border-style="none"
                                          margin-right="1px"
                                          text-align="center" border-width="thin" margin-top="10px"
                                          margin-bottom="1px">
                                <fo:table-cell border-color="black" margin-left="1px">
                                    <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                        Total payment amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" margin-left="1px">
                                    <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                        <xsl:value-of select="summary/hkdSummary/currency"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black">
                                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                              wrap-option="wrap">
                                        <xsl:value-of select="summary/hkdSummary/override"/>
                                    </fo:block>
                                </fo:table-cell>
                                <xsl:if test="$sa='true'">
                                    <fo:table-cell border-color="black" border-width="thin">
                                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                  wrap-option="wrap">
                                            <xsl:value-of select="summary/hkdSummary/salesAllowance"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                                <fo:table-cell border-color="black" border-width="thin">
                                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                              wrap-option="wrap">
                                        <xsl:value-of select="summary/hkdSummary/paymentFromAccrual"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-width="thin">
                                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                              wrap-option="wrap">
                                        <xsl:value-of select="summary/hkdSummary/adjustment"/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-width="thin">
                                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                              wrap-option="wrap" font-weight="bold">
                                        <xsl:value-of select="summary/hkdSummary/grandTotal"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:if test="multiCurrency='true'">
                                <fo:table-row font-size="8px" border-color="white" border-style="none"
                                              margin-right="1px"
                                              text-align="center" border-width="thin" margin-top="10px"
                                              margin-bottom="1px">
                                    <fo:table-cell border-color="black" margin-left="1px">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black" margin-left="1px">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                            <xsl:value-of select="summary/usdSummary/currency"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black">
                                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                  wrap-option="wrap">
                                            <xsl:value-of select="summary/usdSummary/override"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <xsl:if test="$sa='true'">
                                        <fo:table-cell border-color="black" border-width="thin">
                                            <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                      wrap-option="wrap">
                                                <xsl:value-of select="summary/usdSummary/salesAllowance"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </xsl:if>
                                    <fo:table-cell border-color="black" border-width="thin">
                                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                  wrap-option="wrap">
                                            <xsl:value-of select="summary/usdSummary/paymentFromAccrual"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black" border-width="thin">
                                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                  wrap-option="wrap">
                                            <xsl:value-of select="summary/usdSummary/adjustment"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black" border-width="thin">
                                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                                  wrap-option="wrap" font-weight="bold">
                                            <xsl:value-of select="summary/usdSummary/grandTotal"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                            <xsl:if test="multiCurrency='false'">
                                <fo:table-row font-size="8px" border-color="black" text-align="center"
                                              margin-right="1px" border-width="thin" margin-bottom="1px">
                                    <fo:table-cell border-color="black" border-width="thin" margin-left="1px">
                                        <fo:block text-align="left" margin-bottom="1px" margin-top="50px">
                                            USD to HKD spot rate:
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black" border-width="thin" margin-left="1px">
                                        <fo:block text-align="right" margin-bottom="1px" margin-top="50px">
                                            <xsl:value-of select="summary/spotRate"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:if>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    <xsl:template name="details">
        <fo:page-sequence master-reference="MasterPage">
            <fo:static-content flow-name="normal-header">
                <xsl:call-template name="header">
                    <xsl:with-param name="headerName" select="'Details'"/>
                </xsl:call-template>
            </fo:static-content>


            <fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:table border-color="black"
                              border-style="solid">
                        <xsl:choose>
                            <xsl:when test="details/sa ='true'">
                                <fo:table-column column-width="7%"/>
                                <fo:table-column column-width="36%"/>
                                <fo:table-column column-width="11%"/>
                                <fo:table-column column-width="6%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="8%"/>
                                <fo:table-column column-width="7%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="8%"/>
                                <fo:table-column column-width="7%"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:table-column column-width="7%"/>
                                <fo:table-column column-width="36%"/>
                                <fo:table-column column-width="11%"/>
                                <fo:table-column column-width="6%"/>
                                <fo:table-column column-width="5%"/>
                                <fo:table-column column-width="8%"/>
                                <fo:table-column column-width="7%"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!-- 定义表头 //-->
                        <fo:table-header font-size="8px" text-align="center" margin-right="1px" margin-left="1px"
                                         margin-top="1px" margin-bottom="1px">
                            <fo:table-row display-align="after">
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                                        Policy No.
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                                        Plan Name
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                                        Product Category
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold"
                                              text-align="right">
                                        FYC (for bonus calculation)
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-columns-spanned="3">
                                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold">
                                        Override
                                    </fo:block>
                                </fo:table-cell>
                                <xsl:if test="details/sa='true'">
                                    <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                                   number-columns-spanned="3">
                                        <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold">
                                            Sales Allowance
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                            </fo:table-row>
                            <fo:table-row display-align="after">
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Bonus Rate'"/>
                                    <xsl:with-param name="align" select="'right'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Payable amount'"/>
                                    <xsl:with-param name="align" select="'right'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Accrual amount(non-payment)'"/>
                                    <xsl:with-param name="align" select="'right'"/>
                                </xsl:call-template>
                                <xsl:if test="details/sa='true'">
                                    <xsl:call-template name="bold-header-cell">
                                        <xsl:with-param name="text" select="'Bonus Rate'"/>
                                        <xsl:with-param name="align" select="'right'"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="bold-header-cell">
                                        <xsl:with-param name="text" select="'Payable amount'"/>
                                        <xsl:with-param name="align" select="'right'"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="bold-header-cell">
                                        <xsl:with-param name="text" select="'Accrual amount(non-payment)'"/>
                                        <xsl:with-param name="align" select="'right'"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </fo:table-row>
                        </fo:table-header>
                        <!-- table data //-->
                        <xsl:variable name="sa" select="details/sa"/>
                        <fo:table-body>
                            <fo:table-row font-size="8px" border-color="white" border-style="solid"
                                          margin-right="1px"
                                          text-align="center" border-width="thin" margin-top="10px"
                                          margin-bottom="1px">
                                <xsl:if test="$sa='true'">
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px" number-columns-spanned="10">
                                        <fo:block text-align="left" margin-top="3px" margin-bottom="2px"
                                                  font-weight="bold">
                                            Policy currency : HKD
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                                <xsl:if test="$sa!='true'">
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px" number-columns-spanned="7">
                                        <fo:block text-align="left" margin-top="3px" margin-bottom="2px"
                                                  font-weight="bold">
                                            Policy currency : HKD
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                            </fo:table-row>
                            <xsl:call-template name="details-row">
                                <xsl:with-param name="v" select="details/hkdRecords/hkdRecords"/>
                                <xsl:with-param name="sa" select="$sa"/>
                            </xsl:call-template>
                            <xsl:call-template name="details-total-row">
                                <xsl:with-param name="text" select="'Sub-total (HKD)'"/>
                                <xsl:with-param name="p1" select="details/overrideSubTotalHKD"/>
                                <xsl:with-param name="p2" select="details/saSubTotalHKD"/>
                                <xsl:with-param name="sa" select="$sa"/>
                            </xsl:call-template>
                            <fo:table-row font-size="8px" border-color="white" border-style="solid"
                                          margin-right="1px"
                                          text-align="center" border-width="thin" margin-top="10px"
                                          margin-bottom="1px">

                                <xsl:if test="$sa='true'">
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px" number-columns-spanned="10">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px"
                                                  font-weight="bold">
                                            Policy currency : USD
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                                <xsl:if test="$sa!='true'">
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px" number-columns-spanned="7">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px"
                                                  font-weight="bold">
                                            Policy currency : USD
                                        </fo:block>
                                    </fo:table-cell>
                                </xsl:if>
                            </fo:table-row>
                            <xsl:call-template name="details-row">
                                <xsl:with-param name="v" select="details/usdRecords/usdRecords"/>
                                <xsl:with-param name="sa" select="$sa"/>
                            </xsl:call-template>
                            <xsl:call-template name="details-total-row">
                                <xsl:with-param name="text" select="'Sub-total (USD)'"/>
                                <xsl:with-param name="p1" select="details/overrideSubTotalUSD"/>
                                <xsl:with-param name="p2" select="details/saSubTotalUSD"/>
                                <xsl:with-param name="sa" select="$sa"/>
                            </xsl:call-template>
                            <xsl:if test="multiCurrency ='false'">
                                <xsl:call-template name="details-total-row">
                                    <xsl:with-param name="text"
                                                    select="'Grand total equivalent to payment in HKD (spot rate)'"/>
                                    <xsl:with-param name="p1" select="details/overrideGrandTotalHKD"/>
                                    <xsl:with-param name="p2" select="details/saGrandTotalHKD"/>
                                    <xsl:with-param name="sa" select="$sa"/>
                                </xsl:call-template>
                            </xsl:if>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    <xsl:template name="accrualPayment">
        <fo:page-sequence master-reference="MasterPage">
            <fo:static-content flow-name="normal-header">
                <xsl:call-template name="header">
                    <xsl:with-param name="headerName" select="'Accrual Payment'"/>
                </xsl:call-template>
            </fo:static-content>

            <fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:table border-color="black"
                              border-style="solid">
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="6%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="7%"/>
                        <!-- 定义表头 //-->
                        <fo:table-header font-size="8px" text-align="center" margin-right="1px" margin-left="1px"
                                         margin-top="1px" margin-bottom="1px">
                            <fo:table-row display-align="after">
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Policy No.'"/>
                                    <xsl:with-param name="align" select="'left'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Policy currency'"/>
                                    <xsl:with-param name="align" select="'left'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Accumulated accrual amount'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Current Month accrual'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Payable Amount'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Closing Balance'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                            </fo:table-row>
                        </fo:table-header>
                        <!-- table data //-->
                        <fo:table-body>
                            <xsl:call-template name="accrual-row">
                                <xsl:with-param name="v"
                                                select="accrualPayment/accrualPaymentRecords/accrualPaymentRecords"/>
                            </xsl:call-template>
                            <xsl:call-template name="accrual-total-row">
                                <xsl:with-param name="text" select="'Sub-total (HKD)'"/>
                                <xsl:with-param name="p1" select="accrualPayment/subTotalHKD"/>
                            </xsl:call-template>
                            <xsl:call-template name="accrual-total-row">
                                <xsl:with-param name="text" select="'Sub-total (USD)'"/>
                                <xsl:with-param name="p1" select="accrualPayment/subTotalUSD"/>
                            </xsl:call-template>
                            <xsl:if test="multiCurrency = 'false'">
                                <xsl:call-template name="accrual-total-row">
                                    <xsl:with-param name="text"
                                                    select="'Grand total equivalent to payment in HKD (spot rate)'"/>
                                    <xsl:with-param name="p1" select="accrualPayment/grandTotalHKD"/>
                                </xsl:call-template>
                            </xsl:if>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
    <xsl:template name="adjustment">
        <fo:page-sequence master-reference="MasterPage">
            <fo:static-content flow-name="normal-header">
                <xsl:call-template name="header">
                    <xsl:with-param name="headerName" select="'Adjustment'"/>
                </xsl:call-template>
            </fo:static-content>

            <fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:table border-color="black"
                              border-style="solid">
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="6%"/>
                        <fo:table-column column-width="8%"/>
                        <fo:table-column column-width="7%"/>
                        <!-- 定义表头 //-->
                        <fo:table-header font-size="8px" text-align="center" margin-right="1px" margin-left="1px"
                                         margin-top="1px" margin-bottom="1px">
                            <fo:table-row display-align="after">
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Policy No.'"/>
                                    <xsl:with-param name="align" select="'left'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Policy currency'"/>
                                    <xsl:with-param name="align" select="'left'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Bonus'"/>
                                    <xsl:with-param name="align" select="'left'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Adjustment Amount'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Payable Amount'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Accrual amount(non-payment)'"/>
                                    <xsl:with-param name="align" select="'center'"/>
                                </xsl:call-template>
                            </fo:table-row>
                        </fo:table-header>
                        <!-- table data //-->
                        <fo:table-body>
                            <xsl:call-template name="adjust-row">
                                <xsl:with-param name="v"
                                                select="adjustment/adjustmentRecords/adjustmentRecords"/>
                            </xsl:call-template>
                            <xsl:call-template name="accrual-total-row">
                                <xsl:with-param name="text" select="'Sub-total (HKD)'"/>
                                <xsl:with-param name="p1" select="adjustment/subTotalHKD"/>
                            </xsl:call-template>
                            <xsl:call-template name="accrual-total-row">
                                <xsl:with-param name="text" select="'Sub-total (USD)'"/>
                                <xsl:with-param name="p1" select="adjustment/subTotalUSD"/>
                            </xsl:call-template>
                            <xsl:if test="multiCurrency = 'false'">
                                <xsl:call-template name="accrual-total-row">
                                    <xsl:with-param name="text"
                                                    select="'Grand total equivalent to payment in HKD (spot rate)'"/>
                                    <xsl:with-param name="p1" select="adjustment/grandTotalHKD"/>
                                </xsl:call-template>
                            </xsl:if>
                        </fo:table-body>
                    </fo:table>
                </fo:block>

                <fo:block margin-top="5%" font-size="8px">
                    <fo:block text-align="center" font-weight="bold">
                        ***** END OF REPORT *****
                    </fo:block>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template name="string-replace-all">
        <xsl:param name="text"/>
        <xsl:param name="replace"/>
        <xsl:param name="by"/>
        <xsl:choose>
            <xsl:when test="$text = '' or $replace = ''or not($replace)">
                <!-- Prevent this routine from hanging -->
                <xsl:value-of select="$text"/>
            </xsl:when>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)"/>
                <xsl:value-of select="$by"/>
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                    <xsl:with-param name="replace" select="$replace"/>
                    <xsl:with-param name="by" select="$by"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="amount-cell">
        <xsl:param name="target"/>
        <xsl:param name="parameter"/>
        <xsl:param name="bold"/>
        <fo:table-cell border-color="black" border-style="solid" border-width="thin">
            <xsl:choose>
                <xsl:when test="$target != '' and $parameter != ''">

                    <xsl:variable name="temp">
                        <xsl:call-template name="string-replace-all">
                            <xsl:with-param name="text" select="format-number($parameter,'###,###.00')"/>
                            <xsl:with-param name="replace" select="','"/>
                            <xsl:with-param name="by" select="',&#x200b;'"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="v">
                        <xsl:call-template name="string-replace-all">
                            <xsl:with-param name="text" select="$temp"/>
                            <xsl:with-param name="replace" select="'.'"/>
                            <xsl:with-param name="by" select="'.&#x200b;'"/>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:choose>
                        <xsl:when test="$bold = 'true'">
                            <fo:block text-align="right" margin-top="2px" margin-bottom="1px" wrap-option="wrap"
                                      font-weight="bold">
                                <xsl:value-of select="$v"/>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:block text-align="right" margin-top="2px" margin-bottom="1px" wrap-option="wrap">
                                <xsl:value-of select="$v"/>
                            </fo:block>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px" wrap-option="wrap">
                    </fo:block>
                </xsl:otherwise>
            </xsl:choose>
        </fo:table-cell>
    </xsl:template>

    <xsl:template name="amount-cells">
        <xsl:param name="target"/>
        <xsl:param name="p1"/>
        <xsl:param name="p2"/>
        <xsl:param name="p3"/>
        <xsl:param name="p4"/>
        <xsl:param name="p5"/>
        <xsl:param name="p6"/>
        <xsl:param name="p7"/>
        <xsl:param name="p8"/>
        <xsl:param name="p9"/>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p1"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p2"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p3"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p4"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p5"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p6"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p7"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p8"/>
            <xsl:with-param name="bold" select="false"/>
        </xsl:call-template>
        <xsl:call-template name="amount-cell">
            <xsl:with-param name="target" select="$target"/>
            <xsl:with-param name="parameter" select="$p9"/>
            <xsl:with-param name="bold" select="'true'"/>
        </xsl:call-template>

    </xsl:template>

    <xsl:template name="header-cell">
        <xsl:param name="text"/>
        <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786">
            <fo:block margin-top="2px" margin-bottom="1px">
                <xsl:value-of select="$text"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

    <xsl:template name="body-cell">
        <xsl:param name="text"/>
        <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                       margin-left="1px">
            <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                <xsl:value-of select="$text"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

    <xsl:template name="bold-header-cell">
        <xsl:param name="text"/>
        <xsl:param name="align"/>
        <xsl:choose>
            <xsl:when test="$align='left'">
                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786">
                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="left">
                        <xsl:value-of select="$text"/>
                    </fo:block>
                </fo:table-cell>
            </xsl:when>
            <xsl:when test="$align='right'">
                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786">
                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="right">
                        <xsl:value-of select="$text"/>
                    </fo:block>
                </fo:table-cell>
            </xsl:when>
            <xsl:otherwise>
                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786">
                    <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold" text-align="center">
                        <xsl:value-of select="$text"/>
                    </fo:block>
                </fo:table-cell>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="accrual-total-row">

        <xsl:param name="text"/>
        <xsl:param name="p1"/>
        <fo:table-row font-size="8px" border-color="white" border-style="solid"
                      text-align="center" margin-right="1px" border-width="thin" margin-top="1px"
                      margin-bottom="1px" background-color="#E4A7E8">

            <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                           margin-left="1px" number-columns-spanned="4">
                <fo:block text-align="left" margin-top="2px" margin-bottom="1px" font-weight="bold">
                    <xsl:value-of select="$text"/>
                </fo:block>
            </fo:table-cell>
            <xsl:call-template name="amount-cell">
                <xsl:with-param name="target" select="$p1"/>
                <xsl:with-param name="parameter" select="$p1"/>
                <xsl:with-param name="bold" select="'true'"/>
            </xsl:call-template>
            <xsl:call-template name="body-cell">
                <xsl:with-param name="text" select="''"/>
            </xsl:call-template>
        </fo:table-row>

    </xsl:template>

    <xsl:template name="details-total-row">

        <xsl:param name="text"/>
        <xsl:param name="p1"/>
        <xsl:param name="p2"/>
        <xsl:param name="sa"/>
        <fo:table-row font-size="8px" border-color="white" border-style="solid"
                      text-align="center" margin-right="1px" border-width="thin" margin-top="1px"
                      margin-bottom="1px" background-color="#E4A7E8">

            <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                           margin-left="1px" number-columns-spanned="2">
                <fo:block text-align="left" margin-top="2px" margin-bottom="1px" font-weight="bold">
                    <xsl:value-of select="$text"/>
                </fo:block>
            </fo:table-cell>
            <xsl:call-template name="body-cell">
                <xsl:with-param name="text" select="''"/>
            </xsl:call-template>
            <xsl:call-template name="body-cell">
                <xsl:with-param name="text" select="''"/>
            </xsl:call-template>
            <xsl:call-template name="body-cell">
                <xsl:with-param name="text" select="''"/>
            </xsl:call-template>
            <xsl:call-template name="amount-cell">
                <xsl:with-param name="target" select="$p1"/>
                <xsl:with-param name="parameter" select="$p1"/>
                <xsl:with-param name="bold" select="'true'"/>
            </xsl:call-template>
            <xsl:call-template name="body-cell">
                <xsl:with-param name="text" select="''"/>
            </xsl:call-template>

            <xsl:if test="$sa='true'">
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="''"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="$p2"/>
                    <xsl:with-param name="parameter" select="$p2"/>
                    <xsl:with-param name="bold" select="'true'"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="''"/>
                </xsl:call-template>
            </xsl:if>
        </fo:table-row>

    </xsl:template>

    <xsl:template name="details-row">
        <xsl:param name="v"/>
        <xsl:param name="sa"/>
        <xsl:for-each select="$v">
            <fo:table-row font-size="8px" border-color="white" border-style="solid"
                          margin-right="1px"
                          text-align="center" border-width="thin" margin-top="10px"
                          margin-bottom="1px">
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="policyNo"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="planName"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="productCategory"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="fyc"/>
                    <xsl:with-param name="parameter" select="fyc"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <fo:table-cell border-color="black" border-style="solid" border-width="thin">
                    <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                              wrap-option="wrap">
                        <xsl:value-of select="overrideBonusRate"/>%
                    </fo:block>
                </fo:table-cell>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="overridePayableAmount"/>
                    <xsl:with-param name="parameter" select="overridePayableAmount"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="overrideAccrualAmount"/>
                    <xsl:with-param name="parameter" select="overrideAccrualAmount"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>

                <xsl:if test="$sa='true'">
                    <fo:table-cell border-color="black" border-style="solid" border-width="thin">
                        <fo:block text-align="right" margin-top="2px" margin-bottom="1px"
                                  wrap-option="wrap">
                            <xsl:value-of select="saBonusRate"></xsl:value-of>%
                        </fo:block>
                    </fo:table-cell>
                    <xsl:call-template name="amount-cell">
                        <xsl:with-param name="target" select="saPayableAmount"/>
                        <xsl:with-param name="parameter" select="saPayableAmount"/>
                        <xsl:with-param name="bold" select="false"/>
                    </xsl:call-template>
                    <xsl:call-template name="amount-cell">
                        <xsl:with-param name="target" select="saAccrualAmount"/>
                        <xsl:with-param name="parameter" select="saAccrualAmount"/>
                        <xsl:with-param name="bold" select="false"/>
                    </xsl:call-template>
                </xsl:if>
            </fo:table-row>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="accrual-row">
        <xsl:param name="v"/>
        <xsl:for-each select="$v">
            <fo:table-row font-size="8px" border-color="white" border-style="solid"
                          margin-right="1px"
                          text-align="center" border-width="thin" margin-top="10px"
                          margin-bottom="1px">
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="policyNo"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="policyCurrency"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="accrualAmountNonPayment"/>
                    <xsl:with-param name="parameter" select="accrualAmountNonPayment"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="currentMonthAccrual"/>
                    <xsl:with-param name="parameter" select="currentMonthAccrual"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="payableAmount"/>
                    <xsl:with-param name="parameter" select="payableAmount"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="closingBalance"/>
                    <xsl:with-param name="parameter" select="closingBalance"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>

            </fo:table-row>

        </xsl:for-each>

    </xsl:template>
    <xsl:template name="adjust-row">
        <xsl:param name="v"/>
        <xsl:for-each select="$v">
            <fo:table-row font-size="8px" border-color="white" border-style="solid"
                          margin-right="1px"
                          text-align="center" border-width="thin" margin-top="10px"
                          margin-bottom="1px">
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="policyNo"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="policyCurrency"/>
                </xsl:call-template>
                <xsl:call-template name="body-cell">
                    <xsl:with-param name="text" select="bonus"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="adjustmentAmount"/>
                    <xsl:with-param name="parameter" select="adjustmentAmount"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="payableAmount"/>
                    <xsl:with-param name="parameter" select="payableAmount"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>
                <xsl:call-template name="amount-cell">
                    <xsl:with-param name="target" select="accrualAmountNonPayment"/>
                    <xsl:with-param name="parameter" select="accrualAmountNonPayment"/>
                    <xsl:with-param name="bold" select="false"/>
                </xsl:call-template>

            </fo:table-row>

        </xsl:for-each>

    </xsl:template>

    <xsl:template name="header">
        <xsl:param name="headerName"/>
        <fo:block start-indent="0cm" end-indent="0cm" color="blue">
            <fo:external-graphic src="logo.png" content-width="5.1cm" content-height="3.4cm"
                                 display-align="center" text-align="center"/>
        </fo:block>
        <fo:block text-align="left" font-size="7px" margin-left="1px" margin-top="-5px">
            AnyWire (International) Limited
        </fo:block>
        <fo:block text-align="left" font-size="7px" margin-left="1px">
            Incorporated in Bermuda with limited liability.
        </fo:block>
        <fo:block text-align="left" font-size="6px" margin-left="1px">
            &#160;
        </fo:block>
        <fo:block text-align="left" font-size="6px" margin-left="1px">
            &#160;
        </fo:block>
        <fo:block text-align="left" font-size="16px" margin-left="1px">
            Broker Override Statement
        </fo:block>
        <fo:block font-size="14px">
            <fo:table>
                <fo:table-column column-width="88%"/>
                <fo:table-column column-width="3%"/>
                <fo:table-column column-width="2%"/>
                <fo:table-column column-width="7%"/>
                <fo:table-body>
                    <fo:table-row font-size="7px" border-color="white"
                                  border-style="solid" text-align="left">
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Date
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                :
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold" >
                                <xsl:value-of select="//BonusStatementVO/date"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="7px" border-color="white"
                                  border-style="solid" text-align="left">
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Page
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                :
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                <fo:page-number/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            <fo:table>
                <fo:table-column column-width="5%"/>
                <fo:table-column column-width="35%"/>
                <fo:table-column column-width="8%"/>
                <fo:table-column column-width="7%"/>
                <fo:table-body>
                    <fo:table-row font-size="8px" border-color="white"
                                  border-style="solid" text-align="left">
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Broker:
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                <xsl:value-of select="brokerName"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                Broker Code:
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block font-weight="bold">
                                <xsl:value-of select="brokerCode"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="6px" border-color="white"
                                  border-style="solid" text-align="left">
                        <fo:table-cell number-columns-spanned="4">
                            <fo:block>&#160;</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row font-size="12px" border-color="white"
                                  border-style="solid" text-align="left">
                        <fo:table-cell number-columns-spanned="4">
                            <fo:block font-weight="bold">
                                <fo:inline border-bottom="solid 0.4mm">
                                    <xsl:value-of select="$headerName"/>
                                </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>
