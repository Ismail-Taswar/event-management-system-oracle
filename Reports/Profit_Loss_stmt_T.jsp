<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %> 
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<%@ page contentType="text/html;charset=ISO-8859-1" %>
<!--
<rw:report id="report"> 
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="Profit_Loss_stmt_T" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="PROFIT_LOSS_STMT_T" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <data>
    <dataSource name="Q_1">
      <select>
      <![CDATA[select      distinct BOOKING_M_ID,  EVENT_END_DATE, BOOKING_COST_M_DATE, 
            EVENT_NAME,  f_total_exp(BOOKING_COST_M_ID) Total_Exp, TOTAL_AMOUNT
from        profit_loss_view 
Order by     BOOKING_M_ID ; ]]>
      </select>
      <displayInfo x="1.62915" y="0.20837" width="0.69995" height="0.19995"/>
      <group name="G_BOOKING_M_ID">
        <displayInfo x="0.92249" y="0.79370" width="2.05115" height="2.82324"
        />
        <dataItem name="BOOKING_M_ID" oracleDatatype="number" columnOrder="11"
         width="22" defaultWidth="80000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Bk. ID">
          <dataDescriptor expression="BOOKING_M_ID"
           descriptiveExpression="BOOKING_M_ID" order="1" width="22"
           scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="EVENT_END_DATE" datatype="date" oracleDatatype="date"
         columnOrder="12" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="End Date">
          <dataDescriptor expression="EVENT_END_DATE"
           descriptiveExpression="EVENT_END_DATE" order="2" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="BOOKING_COST_M_DATE" datatype="date"
         oracleDatatype="date" columnOrder="13" width="9" defaultWidth="90000"
         defaultHeight="10000" columnFlags="33" defaultLabel="Expense Date">
          <dataDescriptor expression="BOOKING_COST_M_DATE"
           descriptiveExpression="BOOKING_COST_M_DATE" order="3" width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="EVENT_NAME" datatype="vchar2" columnOrder="14"
         width="250" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Event Name">
          <dataDescriptor expression="EVENT_NAME"
           descriptiveExpression="EVENT_NAME" order="4" width="250"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="Total_Exp" oracleDatatype="number" columnOrder="15"
         width="22" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Total Exp">
          <dataDescriptor expression="f_total_exp ( BOOKING_COST_M_ID )"
           descriptiveExpression="TOTAL_EXP" order="5" width="22"
           precision="38"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="TOTAL_AMOUNT" oracleDatatype="number" columnOrder="16"
         width="22" defaultWidth="80000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Total Income">
          <dataDescriptor expression="TOTAL_AMOUNT"
           descriptiveExpression="TOTAL_AMOUNT" order="6" width="22"
           scale="-127"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <summary name="SL#" source="BOOKING_M_ID" function="count" width="20"
         precision="10" reset="report" compute="report" defaultWidth="0"
         defaultHeight="0" columnFlags="8" defaultLabel="Sl">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </summary>
        <formula name="Fun_Profit" source="fun_profitformula"
         datatype="number" width="20" precision="10" defaultWidth="0"
         defaultHeight="0" columnFlags="16" breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
        <formula name="Fun_Loss" source="fun_lossformula" datatype="number"
         width="20" precision="10" defaultWidth="0" defaultHeight="0"
         columnFlags="16" breakOrder="none">
          <displayInfo x="0.00000" y="0.00000" width="0.00000"
           height="0.00000"/>
        </formula>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main" width="11.00000" height="8.50000">
    <body width="10.00000" height="6.50000">
      <location y="1.37500"/>
      <frame name="M_G_BOOKING_M_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="10.00000"
         height="0.62500"/>
        <generalLayout verticalElasticity="variable"/>
        <repeatingFrame name="R_G_BOOKING_M_ID" source="G_BOOKING_M_ID"
         printDirection="down" minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.31250" width="10.00000"
           height="0.31250"/>
          <generalLayout verticalElasticity="expand"/>
          <visualSettings linePattern="solid"/>
          <field name="F_BOOKING_M_ID" source="BOOKING_M_ID" minWidowLines="1"
           spacing="0" alignment="center">
            <font face="Courier New" size="10"/>
            <geometryInfo x="0.37500" y="0.37500" width="0.75000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_EVENT_END_DATE" source="EVENT_END_DATE"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="Courier New" size="10"/>
            <geometryInfo x="4.06250" y="0.37500" width="0.93750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_BOOKING_COST_M_DATE" source="BOOKING_COST_M_DATE"
           minWidowLines="1" spacing="0" alignment="center">
            <font face="Courier New" size="10"/>
            <geometryInfo x="1.12500" y="0.37500" width="1.00000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_EVENT_NAME" source="EVENT_NAME" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="Courier New" size="10"/>
            <geometryInfo x="2.18750" y="0.37500" width="1.87500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_Total_Exp" source="Total_Exp" minWidowLines="1"
           formatMask="fm99,99,99,999.00" spacing="0" alignment="end">
            <font face="Courier New" size="10"/>
            <geometryInfo x="6.25000" y="0.37500" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_TOTAL_AMOUNT" source="TOTAL_AMOUNT" minWidowLines="1"
           formatMask="fm99,99,99,999.00" spacing="0" alignment="end">
            <font face="Courier New" size="10"/>
            <geometryInfo x="5.00000" y="0.37500" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <field name="F_Loss_amount" source="Fun_Loss" minWidowLines="1"
           formatMask="fm99,99,99,999.00" spacing="0" alignment="end">
            <font face="Courier New" size="10"/>
            <geometryInfo x="8.75000" y="0.37500" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand">
              <conditionalFormat>
                <formatException label="(:Fun_Loss &gt; &apos;0&apos;)">
                  <font face="Courier New" size="10" bold="yes"
                   textColor="white"/>
                  <formatVisualSettings fillPattern="solid"
                   fillForegroundColor="r50g0b0"/>
                <cond name="first" column="Fun_Loss" exception="3"
                 lowValue="0" conjunction="1"/>
                </formatException>
              </conditionalFormat>
            </generalLayout>
            <advancedLayout formatTrigger="f_loss_amountformattrigger"/>
          </field>
          <field name="F_Profit_Amount" source="Fun_Profit" minWidowLines="1"
           formatMask="fm99,99,99,999.00" spacing="0" alignment="end">
            <font face="Courier New" size="10"/>
            <geometryInfo x="7.50000" y="0.37500" width="1.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand">
              <conditionalFormat>
                <formatException label="(:Fun_Profit &gt; &apos;0&apos;)">
                  <font face="Courier New" size="10" bold="yes"/>
                  <formatVisualSettings fillPattern="solid"
                   fillForegroundColor="yellow"/>
                <cond name="first" column="Fun_Profit" exception="3"
                 lowValue="0" conjunction="1"/>
                </formatException>
              </conditionalFormat>
            </generalLayout>
            <advancedLayout formatTrigger="f_profit_amountformattrigger"/>
          </field>
          <field name="F_SL#" source="SL#" minWidowLines="1" spacing="0"
           alignment="center">
            <font face="Courier New" size="10"/>
            <geometryInfo x="0.00000" y="0.37500" width="0.37500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
          </field>
          <line name="B_1" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="0.37500" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="0.37500" y="0.62500"/>
              <point x="0.37500" y="0.00000"/>
            </points>
          </line>
          <line name="B_2" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="1.12500" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="1.12500" y="0.62500"/>
              <point x="1.12500" y="0.00000"/>
            </points>
          </line>
          <line name="B_3" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="2.12500" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="2.12500" y="0.62500"/>
              <point x="2.12500" y="0.00000"/>
            </points>
          </line>
          <line name="B_4" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="4.06250" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="4.06250" y="0.62500"/>
              <point x="4.06250" y="0.00000"/>
            </points>
          </line>
          <line name="B_5" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="5.00000" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="5.00000" y="0.62500"/>
              <point x="5.00000" y="0.00000"/>
            </points>
          </line>
          <line name="B_6" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="6.25000" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="6.25000" y="0.62500"/>
              <point x="6.25000" y="0.00000"/>
            </points>
          </line>
          <line name="B_7" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="7.50000" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="7.50000" y="0.62500"/>
              <point x="7.50000" y="0.00000"/>
            </points>
          </line>
          <line name="B_8" arrow="none" stretchWithFrame="R_G_BOOKING_M_ID">
            <geometryInfo x="8.75000" y="0.00000" width="0.00000"
             height="0.62500"/>
            <visualSettings linePattern="solid"/>
            <points>
              <point x="8.75000" y="0.62500"/>
              <point x="8.75000" y="0.00000"/>
            </points>
          </line>
        </repeatingFrame>
        <frame name="M_G_BOOKING_M_ID_HDR">
          <geometryInfo x="0.00000" y="0.00000" width="10.00000"
           height="0.31250"/>
          <advancedLayout printObjectOnPage="allPage"
           basePrintingOn="anchoringObject"/>
          <visualSettings fillBackgroundColor="r50g100b100"
           linePattern="solid"/>
          <text name="B_BOOKING_M_ID" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.37500" y="0.06250" width="0.75000"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Bk. ID]]>
              </string>
            </textSegment>
          </text>
          <text name="B_EVENT_END_DATE" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="4.06250" y="0.06250" width="0.93750"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[End Date]]>
              </string>
            </textSegment>
          </text>
          <text name="B_BOOKING_COST_M_DATE" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="1.12500" y="0.06250" width="1.00000"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Exp. Date]]>
              </string>
            </textSegment>
          </text>
          <text name="B_EVENT_NAME" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="2.10229" y="0.06250" width="1.96021"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Event Name]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_Exp" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="6.25000" y="0.06250" width="1.25000"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Total Exp]]>
              </string>
            </textSegment>
          </text>
          <text name="B_TOTAL_AMOUNT" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="5.00000" y="0.06250" width="1.25000"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Total Income]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_Exp1" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="8.77722" y="0.06250" width="1.22278"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Loss Amount]]>
              </string>
            </textSegment>
          </text>
          <text name="B_Total_Exp2" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="7.50000" y="0.06250" width="1.25000"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[Profit Amount]]>
              </string>
            </textSegment>
          </text>
          <text name="B_BOOKING_M_ID1" minWidowLines="1">
            <textSettings justify="center" spacing="0"/>
            <geometryInfo x="0.00000" y="0.06250" width="0.37500"
             height="0.18750"/>
            <textSegment>
              <font face="Courier New" size="10" bold="yes"/>
              <string>
              <![CDATA[SL#]]>
              </string>
            </textSegment>
          </text>
        </frame>
      </frame>
    </body>
    <margin>
      <text name="B_9" minWidowLines="1">
        <textSettings justify="center" spacing="single"/>
        <geometryInfo x="3.62500" y="0.62500" width="3.81250" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100"/>
        <textSegment>
          <font face="Courier New" size="14" bold="yes"/>
          <string>
          <![CDATA[Profit Loss Statement]]>
          </string>
        </textSegment>
      </text>
      <linkFile name="B_10"
       sourceFileName="D:\Project_R_DTCM_56_M\Event_Management_System\Images\Reports_Image\Untitled design.jpg"
       sourceFileFormat="image">
        <geometryInfo x="0.50000" y="0.06250" width="1.18750" height="0.87500"
        />
        <visualSettings fillBackgroundColor="r50g100b100"/>
        <points>
          <point x="0.50000" y="0.06250"/>
          <point x="1.18750" y="0.87500"/>
        </points>
        <textSettings justify="center" spacing="single"/>
        <font face="Courier New" size="14" bold="yes"/>
      </linkFile>
      <linkFile name="B_11"
       sourceFileName="D:\Project_R_DTCM_56_M\Event_Management_System\Images\Reports_Image\Company_name.txt"
       sourceFileFormat="text">
        <geometryInfo x="2.56250" y="0.12500" width="6.00000" height="0.31250"
        />
        <visualSettings fillBackgroundColor="r50g100b100"/>
        <points>
          <point x="2.56250" y="0.12500"/>
          <point x="6.00000" y="0.31250"/>
        </points>
        <textSettings justify="center" spacing="single"/>
        <font face="Courier New" size="22" bold="yes"/>
      </linkFile>
      <field name="F_DATE1" source="CurrentDate" minWidowLines="1"
       formatMask="MON-DD-RR HH:MI AM" spacing="0" alignment="center">
        <font face="Courier New" size="6"/>
        <geometryInfo x="9.56250" y="0.25000" width="1.18750" height="0.12500"
        />
        <generalLayout horizontalElasticity="variable"/>
      </field>
      <text name="B_12" minWidowLines="1">
        <textSettings justify="center" spacing="single"/>
        <geometryInfo x="8.87500" y="0.25000" width="0.62500" height="0.12500"
        />
        <visualSettings fillBackgroundColor="r50g100b100"/>
        <textSegment>
          <font face="Courier New" size="6"/>
          <string>
          <![CDATA[Print Date :]]>
          </string>
        </textSegment>
      </text>
      <text name="B_13" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.50000" y="7.87500" width="1.75000" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100"/>
        <textSegment>
          <font face="Courier New" size="6"/>
          <string>
          <![CDATA[Develped By : DDD56@IsDB-BISEW]]>
          </string>
        </textSegment>
      </text>
      <text name="B_PAGENUM1" minWidowLines="1">
        <textSettings justify="end" spacing="0"/>
        <geometryInfo x="8.37500" y="7.91663" width="2.12500" height="0.20837"
        />
        <textSegment>
          <font face="Courier New" size="8"/>
          <string>
          <![CDATA[Page &<PageNumber> of &<TotalPages>]]>
          </string>
        </textSegment>
      </text>
      <text name="B_14" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="0.50000" y="1.06250" width="1.12500" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100" linePattern="solid"
         lineForegroundColor="gray96"/>
        <textSegment>
          <font face="Courier New" size="11" bold="yes"/>
          <string>
          <![CDATA[Form Date  :]]>
          </string>
        </textSegment>
      </text>
      <text name="B_15" minWidowLines="1">
        <textSettings spacing="single"/>
        <geometryInfo x="7.75000" y="1.06250" width="1.12500" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100" linePattern="solid"
         lineForegroundColor="gray96"/>
        <textSegment>
          <font face="Courier New" size="11" bold="yes"/>
          <string>
          <![CDATA[To Date    :]]>
          </string>
        </textSegment>
      </text>
      <field name="F_1" minWidowLines="1" spacing="single" alignment="start">
        <font face="Courier New" size="10" bold="yes"/>
        <geometryInfo x="1.62500" y="1.06250" width="1.62500" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100" linePattern="solid"
         lineForegroundColor="gray96"/>
      </field>
      <field name="F_2" minWidowLines="1" spacing="single" alignment="start">
        <font face="Courier New" size="10" bold="yes"/>
        <geometryInfo x="8.87500" y="1.06250" width="1.62500" height="0.25000"
        />
        <visualSettings fillBackgroundColor="r50g100b100" linePattern="solid"
         lineForegroundColor="gray96"/>
      </field>
    </margin>
  </section>
  </layout>
  <programUnits>
    <function name="fun_profitformula" returnType="number">
      <textSource>
      <![CDATA[function Fun_ProfitFormula 
return Number 
is
v_profit     number ; 
begin
	if (:TOTAL_AMOUNT) > (:TOTAL_EXP) then 
		v_profit := (:TOTAL_AMOUNT) - (:TOTAL_EXP) ; 
	else 
			v_profit := 0 ; 
	end if ; 
	return (v_profit);
end;]]>
      </textSource>
    </function>
    <function name="fun_lossformula" returnType="number">
      <textSource>
      <![CDATA[function Fun_LossFormula return Number is

v_profit     number ; 
begin
	if (:TOTAL_AMOUNT) < (:TOTAL_EXP) then 
		v_profit := (:TOTAL_EXP) - (:TOTAL_AMOUNT)  ; 
	else 
			v_profit := 0 ; 
	end if ; 
	return (v_profit);
end;]]>
      </textSource>
    </function>
    <function name="f_loss_amountformattrigger">
      <textSource>
      <![CDATA[function F_Loss_amountFormatTrigger return boolean is
begin

  -- Automatically Generated from Reports Builder.
  if (:Fun_Loss > '0')
  then
    srw.set_foreground_fill_color('darkred');
    srw.set_fill_pattern('solid');
    srw.set_text_color('white');
    srw.set_font_face('Courier New');
    srw.set_font_size(10);
    srw.set_font_weight(srw.bold_weight);
    srw.set_font_style(srw.plain_style);
  end if;

  return (TRUE);
end;]]>
      </textSource>
    </function>
    <function name="f_profit_amountformattrigger">
      <textSource>
      <![CDATA[function F_Profit_AmountFormatTrigger return boolean is
begin

  -- Automatically Generated from Reports Builder.
  if (:Fun_Profit > '0')
  then
    srw.set_foreground_fill_color('r100g100b0');
    srw.set_fill_pattern('solid');
    srw.set_font_face('Courier New');
    srw.set_font_size(10);
    srw.set_font_weight(srw.bold_weight);
    srw.set_font_style(srw.plain_style);
  end if;

  return (TRUE);
end;]]>
      </textSource>
    </function>
  </programUnits>
  <reportPrivate defaultReportType="tabular" versionFlags2="0" templateName=""
  />
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<html>

<head>
<meta name="GENERATOR" content="Oracle 9i Reports Developer"/>
<title> Your Title </title>

<rw:style id="yourStyle">
   <!-- Report Wizard inserts style link clause here -->
</rw:style>

</head>


<body>

<rw:dataArea id="yourDataArea">
   <!-- Report Wizard inserts the default jsp here -->
</rw:dataArea>



</body>
</html>

<!--
</rw:report> 
-->
