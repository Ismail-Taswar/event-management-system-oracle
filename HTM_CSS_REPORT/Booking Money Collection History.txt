
=====================================================================


Alter table   receive 
add           PAYABLE_AMOUNT_RE number ;



=======================================================================

create or replace view receive_view_a
as
select   re.BOOKING_M_ID, em.EVENT_M_ID, cl.CLIENT_ID, 
          ed.EVENT_D_ID, ve.VENUE_ID, BOOKING_DATE, 
          EVENT_START_DATE, EVENT_END_DATE, TOTAL_AMOUNT, 
          ADVANCE, DUE, rm.RECEIVE_MODE_ID, 
          Event_m_name, client_name, address, Event_name, venue_name, 
          receive_mode_name, RECEIVE_ID, RECEIVE_DATE, 
          nvl(PAYABLE_AMOUNT_RE, 0) Payable_amount , AMOUNT, 
          nvl(RECIEVE_DUE, 0) Receive_Due, 
          (select     nvl(sum(amount), 0)  
           from       receive 
           where      booking_m_id =  re.BOOKING_M_ID) Total_Receive
from     receive re, BOOKING_M bm, EVENT_M em, 
         CLIENT cl, EVENT_D ed, VENUE ve, 
         RECEIVE_MODE rm
where    re.BOOKING_M_ID = bm.BOOKING_M_id
and      bm.EVENT_M_ID = em.EVENT_M_ID
and      bm.CLIENT_ID = cl.CLIENT_ID
and      bm.EVENT_D_ID = ed.EVENT_D_ID 
and      bm.VENUE_ID = ve.VENUE_ID
and      bm.RECEIVE_MODE_ID = rm.RECEIVE_MODE_ID ;







Functin and Global Variable Declaration : (Under Page Property) 
================================================================



function printdiv(printpage)
{
var headstr = "<html><head><title></title></head><body>";
var footstr = "</body>";
var newstr = document.all.item(printpage).innerHTML;
var oldstr = document.body.innerHTML;
document.body.innerHTML = headstr+newstr+footstr;
window.print();
document.body.innerHTML = oldstr;
return false;
}




Inline CSS : (Under Page Property) 
==================================



.button {
background-color: #4CAF50; /* Green */
border: none;
color: white;
padding: 4px 8px;
text-align: center;
text-decoration: none;
display: inline-block;
font-size: 16px;
margin: 4px 2px;
-webkit-transition-duration: 0.4s; /* Safari */
transition-duration: 0.4s;
cursor: pointer;
}
.button1 {
background-color: white;
color: black;
border: 2px solid #008CBA;
}
.button1:hover {
background-color: #008CBA;
color: white;
}
.button3 {
background-color: white;
color: black;
border: 2px solid #f44336;
}
.button3:hover {
background-color: #f44336;
color: white;
}


=========================================================================

Create a blank page:
Create a Region:
Type: PL/SQL Dynamic Content [Legacy]
Source:
PL/SQL Code:



PL/SQL Code:
============


declare
V_COMPANY_NAME VARCHAR2(100) := 'Event Management Company' ;
cursor nur is
------------------------------------------------------
select      distinct BOOKING_M_ID, to_char(BOOKING_DATE, 'DD-Mon-YYYY') BOOKING_DATE, 
           to_char(EVENT_END_DATE, 'DD-Mon-YYYY') EVENT_END_DATE , 
            to_char(Event_start_date, 'DD-Mon-YYYY') Event_start_date , 
           CLIENT_ID, EVENT_NAME, VENUE_NAME, TOTAL_RECEIVE
from       receive_view_A 
where BOOKING_M_ID = :P80_BOOKING_M_ID ; 
------------------------------------------------------
record_nur nur%rowtype;
V_CUSTOMER_NAME VARCHAR2(100);
V_CUS_ADDRESS VARCHAR2(100);
V_PHONE_NUMBER1 VARCHAR2(50);
V_taka_in_word varchar2(3000);
begin
--------------------------------
select  distinct taka_in_word(nvl(TOTAL_RECEIVE,0))
into    V_taka_in_word
from    receive_view_A
where   BOOKING_M_ID = :P80_BOOKING_M_ID ;
--------------------------------


htp.p('<a id="b_exit" type="button1" class="button button3" class="exit"
'||'href="'||APEX_UTIL.PREPARE_URL('r/ws_ems_ddd56/event-management-system21198102/receive-history?&&session')||'">Close</a>
<input type="button1" class="button button1" class="t-Icon t-Icon--right fa fa-print" id="print"
type="button" onclick="printdiv(''div_print1'');" value="Print"/><br/>
<div id="div_print1" style="margin-top:5px;"> ');
---------------------
OPEN nur;
FETCH nur INTO record_nur;
CLOSE nur;
select        client_name, address, CELL_NUMBER
INTO          V_CUSTOMER_NAME, V_CUS_ADDRESS, V_PHONE_NUMBER1
from          client
where         CLIENT_ID = record_nur.CLIENT_ID ;
-------------------------------
htp.p('
<html>
<header>
<title>Invoice</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
img {float: left;}
h2.page-header {
margin: 0;
padding: 0;
}
h3.page-header {
align:center;
margin: 0;
padding: 0;
}
h1 {
text-align: center;
text-transform: uppercase;
}
p {text-align: center;}
.napkin2,th,td {
border: 1px solid black ;
border-collapse: collapse;


padding: 5px;
}
.napkin,th {
border: 1px solid #607d8b ;
border-collapse: collapse;
padding: 5px;
}
.p1 {
border: 0px;
text-align: left;
}
.td1 {
border: 0px;
text-align: left;
}
.td1 {
border: 0px;
text-align: left;
}
.full {
width:100%;
}
.p00 {text-align: right; border: 0px;}
.m2 {text-align:center;}
.m3{text-align: center;
.m4{text-align: center;
border: 1px solid #607d8b;}
.m4{text-align: center;
border: 1px solid #607d8b;
}
.m5{text-align: center;}
.m1,.m2,.m3.m4,.m5 {border: 0px solid #607d8b;}
.m1{padding-left: 5px;}
.m2{padding-right: 5px;}
.m3{padding-right: 5px;}
.m4{padding-right: 5px;}
.lower { padding-top: 50px;}
.low,.low1 {text-align: center;}
</style>
</header>


<body>
');
htp.p('
<h2 class="page-header" align="center">'||V_COMPANY_NAME||'</h2>
<h5 class="page-header" align="center" margin-right="50px">Mir Villa, Road No - 7, Mohammadpur, Dhaka-1207.</h5>
<h5 class="page-header" align="center"margin-right="50px">+8801917975575</h5>
<h5 class="page-header" align="center"margin-right="50px">helloems@yahoo.com </h5>
<h4 class="page-header" align="center"><u>Booking Money Collection Invoice</u></h4>
');
htp.p('
<table class="full" align="center" width="100%">
<tr>
<td class="td1">
<table class="Patient">
<tr>
<th class="p1">Booking ID: </th>
<td class="p1">: &nbsp; '||record_nur.BOOKING_M_ID||'</td>
</tr>
<tr>
<th class="p1">Client Name: </th>
<td class="p1">: &nbsp; '||V_CUSTOMER_NAME||'</td>
</tr>

<tr>
<th class="p1">Client Address: </th>
<td class="p1">: &nbsp; '||V_CUS_ADDRESS||'</td>
</tr>

<tr>
<th class="p1">Event Name : </th>
<td class="p1">: &nbsp; '||record_nur.EVENT_NAME||'</td>
</tr>


<tr>
<th class="p1">Venue Name : </th>
<td class="p1">: &nbsp; '||record_nur.VENUE_NAME||'</td>
</tr>


</table>
</td>
<td class="td1">
<table class="patient2" align="right">
<tr>
<th class="p1">Booking Date:</th>
<td class="p1"> &nbsp; '||record_nur.Booking_Date||'</td>
</tr>
<tr>
<th class="p1">Cell Number:</th>
<td class="p1"> &nbsp; '||V_PHONE_NUMBER1||'</td>

<tr>
<th class="p1">Event Start Date:</th>
<td class="p1"> &nbsp; '||record_nur.Event_start_date||'</td>
</tr>

<tr>
<th class="p1">Event End Date:</th>
<td class="p1"> &nbsp; '||record_nur.Event_end_date||'</td>
</tr>


</table>
</td>
</tr>

');
-------------------------------------
htp.p('
<table class="napkin2" align="center" width=100% >
<thead>
<tr>
<th width="50px">SL#</th>
<th width="400px">Receive ID</th>
<th width="100px">Receive Date </th>
<th width="100px">Payable Amount</th>
<th width="100px">Paid Amount</th>
</tr>
</thead>
');
for r in (
select     rownum SL#, RECEIVE_ID, to_char(RECEIVE_DATE, 'DD-Mon-YYYY')Receive_Date, 
           nvl(PAYABLE_AMOUNT, 0) Payable_amount, nvl(AMOUNT,0) Paid_Amount
from       receive_view_A
where      booking_m_id = :P80_BOOKING_M_ID 
) loop
htp.p('
<tbody>
<tr>
<td width="50px" align=center>'||' '||htf.escape_sc(r.SL#)||'</td>
<td width="90px" align=center>'||' '||htf.escape_sc(r.RECEIVE_ID)||'</td>
<td width="100px" align=center>'||''||htf.escape_sc(r.Receive_Date)||'</td>
<td width="100px" align=right>'||' '||htf.escape_sc(to_char((r.Payable_amount), '99,99,99,999.00'))||'</td>
<td width="100px" align=right>'||' '||htf.escape_sc(r.Paid_Amount)||'</td>
</tr>
</tbody>
');
end loop;
htp.p('
</table>
</body>
');
htp.p('
<tr>
<th class="p1"></th>
<td class="p1"> &nbsp; '||V_taka_in_word||'</td>
</tr>
<td class="td1">
<table class="patient2" align="right">
<tr>
<th class="p1">Total Amount :</th>
<td class="p1"> &nbsp; '||to_char(record_nur.TOTAL_RECEIVE,'99,99,99,999.99')||'</td>
</tr>
</table>
</td>
') ;
htp.p('</div>') ;
end ;



