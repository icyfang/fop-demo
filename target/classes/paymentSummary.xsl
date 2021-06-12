<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version=".0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:template match="/PaymentSummaryVO">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="MasterPage"
                                       page-width="29.7cm"
                                       page-height="21cm"
                                       margin-top="1.0cm"
                                       margin-bottom="0.5cm"
                                       margin-left="0.3cm"
                                       margin-right="0.3cm">
                    <fo:region-body margin-top="3.4cm" margin-bottom="0.1cm"/>
                    <fo:region-before region-name="normal-header"/>
                    <fo:region-after extent="3cm" region-name="normal-footer"/>
                    <fo:region-start extent="0cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <xsl:call-template name="ENG-template"/>
        </fo:root>
    </xsl:template>

    <xsl:template name="ENG-template">
        <fo:page-sequence master-reference="MasterPage">
            <fo:static-content flow-name="normal-header">
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
                    Broker Override and Sales Allowance Summary Report
                </fo:block>
                <fo:block
                        font-size="14px">
                    <fo:table>
                        <fo:table-column column-width="88%"/>
                        <fo:table-column column-width="3%"/>
                        <fo:table-column column-width="2%"/>
                        <fo:table-column column-width="7%"/>
                        <fo:table-body>
                            <fo:table-row font-size="6px" border-color="white"
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
                                    <fo:block font-weight="bold">
                                        <xsl:value-of select="date"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row font-size="6px" border-color="white"
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
                </fo:block>

            </fo:static-content>


            <fo:flow flow-name="xsl-region-body">
                <fo:block>
                    <fo:table border-color="black"
                              border-style="solid">
                        <fo:table-column column-width="14%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="6%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="5%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="4%"/>
                        <fo:table-column column-width="6%"/>

                        <!-- 定义表头 //-->
                        <fo:table-header font-size="6px" text-align="center" margin-right="1px" margin-left="1px"
                                         margin-top="1px" margin-bottom="1px">
                            <fo:table-row>
                                <fo:table-cell border-color="black" border-style="solid" number-rows-spanned="4"
                                               display-align="after">
                                    <fo:block font-weight="bold" text-align="left">
                                        Broker Firm Name
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" number-rows-spanned="4"
                                               display-align="after">
                                    <fo:block font-weight="bold" text-align="left">
                                        Broker Firm Code
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-columns-spanned="9">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        in HKD
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-columns-spanned="9">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        in USD
                                    </fo:block>
                                </fo:table-cell>

                            </fo:table-row>
                            <fo:table-row display-align="after">
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Override payable amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Sales Allowance payable amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Bonus adjustment
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-columns-spanned="5">
                                    <fo:block font-weight="bold">
                                        Accrual
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Total payable amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Override payable amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Sales Allowance payable amount
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Bonus adjustment
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-columns-spanned="5">
                                    <fo:block font-weight="bold">
                                        Accrual
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786"
                                               number-rows-spanned="2">
                                    <fo:block font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Total payable amount
                                    </fo:block>
                                </fo:table-cell>

                            </fo:table-row>
                            <fo:table-row display-align="after">

                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Opening balance'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Addition'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Payment from accrual'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Written-off'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Closing balance'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Opening balance'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Addition'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Payment from accrual'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Written-off'"/>
                                </xsl:call-template>
                                <xsl:call-template name="bold-header-cell">
                                    <xsl:with-param name="text" select="'Closing balance'"/>
                                </xsl:call-template>
                            </fo:table-row>
                            <fo:table-row>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'a'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'b'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'c'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'d'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'e'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'f'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'g'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'h'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'i'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'a'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'b'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'c'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'d'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'e'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'f'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'g'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'h'"/>
                                </xsl:call-template>
                                <xsl:call-template name="header-cell">
                                    <xsl:with-param name="text" select="'i'"/>
                                </xsl:call-template>
                            </fo:table-row>
                        </fo:table-header>
                        <!-- table data //-->
                        <fo:table-body>
                            <xsl:for-each select="detailList/detailList">
                                <fo:table-row font-size="5px" border-color="white" border-style="solid"
                                              margin-right="1px"
                                              text-align="center" border-width="thin" margin-top="10px"
                                              margin-bottom="1px">
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                            <xsl:value-of select="brokerFirmName"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                                   margin-left="1px">
                                        <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                            <xsl:value-of select="brokerFirmCode"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <xsl:call-template name="amount-cells">
                                        <xsl:with-param name="target" select="hkdPayment"/>
                                        <xsl:with-param name="p1" select="hkdPayment/overridePayableAmount"/>
                                        <xsl:with-param name="p2" select="hkdPayment/saPayableAmount"/>
                                        <xsl:with-param name="p3" select="hkdPayment/bonusAdjustment"/>
                                        <xsl:with-param name="p4" select="hkdPayment/openingBalance"/>
                                        <xsl:with-param name="p5" select="hkdPayment/addition"/>
                                        <xsl:with-param name="p6" select="hkdPayment/paymentFromAccrual"/>
                                        <xsl:with-param name="p7" select="hkdPayment/writtenOff"/>
                                        <xsl:with-param name="p8" select="hkdPayment/closingBalance"/>
                                        <xsl:with-param name="p9" select="hkdPayment/totalPayableAmount"/>
                                    </xsl:call-template>
                                    <xsl:if test="multiCurrency = 'true'">
                                    <xsl:call-template name="amount-cells">
                                        <xsl:with-param name="target" select="usdPayment"/>
                                        <xsl:with-param name="p1" select="usdPayment/overridePayableAmount"/>
                                        <xsl:with-param name="p2" select="usdPayment/saPayableAmount"/>
                                        <xsl:with-param name="p3" select="usdPayment/bonusAdjustment"/>
                                        <xsl:with-param name="p4" select="usdPayment/openingBalance"/>
                                        <xsl:with-param name="p5" select="usdPayment/addition"/>
                                        <xsl:with-param name="p6" select="usdPayment/paymentFromAccrual"/>
                                        <xsl:with-param name="p7" select="usdPayment/writtenOff"/>
                                        <xsl:with-param name="p8" select="usdPayment/closingBalance"/>
                                        <xsl:with-param name="p9" select="usdPayment/totalPayableAmount"/>
                                    </xsl:call-template>
                                    </xsl:if>
                                    <xsl:if test="multiCurrency = 'false'">
                                        <xsl:call-template name="amount-cells">
                                            <xsl:with-param name="target" select="''"/>
                                            <xsl:with-param name="p1" select="''"/>
                                            <xsl:with-param name="p2" select="''"/>
                                            <xsl:with-param name="p3" select="''"/>
                                            <xsl:with-param name="p4" select="''"/>
                                            <xsl:with-param name="p5" select="''"/>
                                            <xsl:with-param name="p6" select="''"/>
                                            <xsl:with-param name="p7" select="''"/>
                                            <xsl:with-param name="p8" select="''"/>
                                            <xsl:with-param name="p9" select="''"/>
                                        </xsl:call-template>
                                    </xsl:if>

                                </fo:table-row>
                            </xsl:for-each>
                            <fo:table-row font-size="5px" border-color="white" border-style="solid"
                                          text-align="center" margin-right="1px" border-width="thin" margin-top="1px"
                                          margin-bottom="1px">
                                <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                               margin-left="1px" display-align="center">
                                    <fo:block text-align="left" margin-top="2px" margin-bottom="1px">
                                        Sub-total
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" border-width="thin">
                                    <fo:block>
                                    </fo:block>
                                </fo:table-cell>
                                <xsl:call-template name="amount-cells">
                                    <xsl:with-param name="target" select="subTotalHKD"/>
                                    <xsl:with-param name="p1" select="subTotalHKD/overridePayableAmount"/>
                                    <xsl:with-param name="p2" select="subTotalHKD/saPayableAmount"/>
                                    <xsl:with-param name="p3" select="subTotalHKD/bonusAdjustment"/>
                                    <xsl:with-param name="p4" select="subTotalHKD/openingBalance"/>
                                    <xsl:with-param name="p5" select="subTotalHKD/addition"/>
                                    <xsl:with-param name="p6" select="subTotalHKD/paymentFromAccrual"/>
                                    <xsl:with-param name="p7" select="subTotalHKD/writtenOff"/>
                                    <xsl:with-param name="p8" select="subTotalHKD/closingBalance"/>
                                    <xsl:with-param name="p9" select="''"/>
                                </xsl:call-template>
                                <xsl:call-template name="amount-cells">
                                    <xsl:with-param name="target" select="subTotalUSD"/>
                                    <xsl:with-param name="p1" select="subTotalUSD/overridePayableAmount"/>
                                    <xsl:with-param name="p2" select="subTotalUSD/saPayableAmount"/>
                                    <xsl:with-param name="p3" select="subTotalUSD/bonusAdjustment"/>
                                    <xsl:with-param name="p4" select="subTotalUSD/openingBalance"/>
                                    <xsl:with-param name="p5" select="subTotalUSD/addition"/>
                                    <xsl:with-param name="p6" select="subTotalUSD/paymentFromAccrual"/>
                                    <xsl:with-param name="p7" select="subTotalUSD/writtenOff"/>
                                    <xsl:with-param name="p8" select="subTotalUSD/closingBalance"/>
                                    <xsl:with-param name="p9" select="''"/>
                                </xsl:call-template>

                            </fo:table-row>
                            <fo:table-row font-size="5px" border-color="white" border-style="solid"
                                          text-align="center" margin-right="1px" border-width="thin" margin-top="1px"
                                          margin-bottom="1px">
                                <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                               margin-left="1px">
                                    <fo:block text-align="left" font-weight="bold" margin-top="2px" margin-bottom="1px">
                                        Grand Total for payment
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell border-color="black" border-style="solid" border-width="thin"
                                               margin-left="1px">
                                    <fo:block text-align="left" font-weight="bold" margin-top="2px" margin-bottom="1px">
                                    </fo:block>
                                </fo:table-cell>
                                <xsl:call-template name="amount-cells">
                                    <xsl:with-param name="target" select="grandTotalHKD"/>
                                    <xsl:with-param name="p1" select="grandTotalHKD/overridePayableAmount"/>
                                    <xsl:with-param name="p2" select="grandTotalHKD/saPayableAmount"/>
                                    <xsl:with-param name="p3" select="grandTotalHKD/bonusAdjustment"/>
                                    <xsl:with-param name="p4" select="''"/>
                                    <xsl:with-param name="p5" select="''"/>
                                    <xsl:with-param name="p6" select="grandTotalHKD/paymentFromAccrual"/>
                                    <xsl:with-param name="p7" select="''"/>
                                    <xsl:with-param name="p8" select="''"/>
                                    <xsl:with-param name="p9" select="grandTotalHKD/totalPayableAmount"/>
                                </xsl:call-template>
                                <xsl:call-template name="amount-cells">
                                    <xsl:with-param name="target" select="grandTotalUSD"/>
                                    <xsl:with-param name="p1" select="grandTotalUSD/overridePayableAmount"/>
                                    <xsl:with-param name="p2" select="grandTotalUSD/saPayableAmount"/>
                                    <xsl:with-param name="p3" select="grandTotalUSD/bonusAdjustment"/>
                                    <xsl:with-param name="p4" select="''"/>
                                    <xsl:with-param name="p5" select="''"/>
                                    <xsl:with-param name="p6" select="grandTotalHKD/paymentFromAccrual"/>
                                    <xsl:with-param name="p7" select="''"/>
                                    <xsl:with-param name="p8" select="''"/>
                                    <xsl:with-param name="p9" select="grandTotalUSD/totalPayableAmount"/>
                                </xsl:call-template>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>

                <fo:block text-align="left" font-size="6px">
                    &#160;
                </fo:block>
                <fo:block text-align="left" font-size="6px">
                    Note:
                </fo:block>
                <fo:block text-align="left" margin-left="4px" font-size="6px">
                    Payable amount: i = a + b + c + f
                </fo:block>
                <fo:block text-align="left" margin-left="4px" font-size="6px">
                    Accrual amount: h = d + e - f - g
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
                                <xsl:value-of select="$v"></xsl:value-of>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:block text-align="right" margin-top="2px" margin-bottom="1px" wrap-option="wrap">
                                <xsl:value-of select="$v"></xsl:value-of>
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
                <xsl:value-of select="$text"></xsl:value-of>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
    <xsl:template name="bold-header-cell">
        <xsl:param name="text"/>
        <fo:table-cell border-color="black" border-style="solid" background-color="#BCF786">
            <fo:block margin-top="2px" margin-bottom="1px" font-weight="bold">
                <xsl:value-of select="$text"></xsl:value-of>
            </fo:block>
        </fo:table-cell>
    </xsl:template>
</xsl:stylesheet>
