
1. User_view

create view user_view
as 
select     USER_TYPE_NAME,USER_TYPE_DESCRIPTION, USER_INFO_ID, b.USER_TYPE_ID, USERNAME, USER_IMAGE, b.ACTION_USER, b.ACTION_DATE_TIME
from       user_type a , user_info b
where      a.user_type_id =  b.user_type_id ; 


2. 


create view employee_view 
as 
select         DEPARTMENT_NAME, DESIGNATION_NAME, EMPLOYEE_ID , e.DEPARTMENT_ID, e.DESIGNATION_ID , FIRST_NAME, LAST_NAME, FATHER_NAME, MOTHER_NAME 
               ,PRESENT_ADDRESS,PERMANENT_ADDRESS, SALARY, JOIN_DATE, NID, EMAIL, CELL_NUMBER, DATE_OF_BIRTH, GENDER, RELIGION, NATIONALITY, 
               BLOOD_GROUP, EMPLOYEE_IMAGE, e.ACTION_USER, e.ACTION_DATE_TIME
from           DEPARTMENT d, DESIGNATION de, EMPLOYEE e
where          d.department_id = e.department_id 
and            de.designation_id = e.designation_id  ; 


3. 


CREATE or replace VIEW EVENT_VIEW
AS
SELECT    EVENT_M_NAME, EVENT_M_DESCRIPTION, B.EVENT_M_ID, EVENT_NAME, EVENT_D_DESCRIPTION, 
          SERVICE_ID, C.EVENT_D_ID, SERVICE_NAME, SERVICE_NAME_DESCRIPTION, B.ACTION_USER Event_Created_By, 
          B.ACTION_DATE_TIME Event_Created_Date, C.ACTION_USER, C.ACTION_DATE_TIME
FROM      EVENT_M A, EVENT_D B, SERVICE C
WHERE     A.EVENT_M_ID = B.EVENT_M_ID 
AND       C.EVENT_D_ID = B.EVENT_D_ID ; 



4. 


CREATE VIEW CLIENT_VIEW
AS 
SELECT       CLIENT_ID, CLIENT_NAME, CELL_NUMBER, ADDRESS, EMAIL, WEBSITE, 
             CLIENT_STATUS, CITY, COUNTRY, ACTION_USER, ACTION_DATE_TIME
FROM         CLIENT
ORDER BY     CLIENT_ID ; 




5.


CREATE OR REPLACE VIEW BOOKING_VIEW 
AS
SELECT       BM.EVENT_M_ID, BM.CLIENT_ID, BM.EVENT_D_ID, BM.VENUE_ID, BOOKING_DATE, 
             EVENT_START_DATE, EVENT_END_DATE, TOTAL_AMOUNT, ADVANCE, DUE, BM.RECEIVE_MODE_ID,
             SERVICE_QUANTITY, BD.BOOKING_M_ID, BD.SERVICE_ID, BOOKING_D_ID, SERVICE_AMOUNT, 
             CLIENT_NAME, EVENT_M_NAME,  EVENT_NAME, SERVICE_NAME, VENUE_NAME,  RECEIVE_MODE_NAME,
             BD.ACTION_USER, BD.ACTION_DATE_TIME 
FROM         BOOKING_M BM, BOOKING_D BD, EVENT_M EM, CLIENT CL, EVENT_D ED, VENUE V, SERVICE SE, RECEIVE_MODE RM
WHERE        BD.BOOKING_M_ID = BM.BOOKING_M_ID
AND          BM.EVENT_M_ID = EM.EVENT_M_ID 
AND          BM.CLIENT_ID = CL.CLIENT_ID
AND          BM.EVENT_D_ID = ED.EVENT_D_ID 
AND          BM.VENUE_ID = V.VENUE_ID
AND          BD.SERVICE_ID = SE.SERVICE_ID 
AND          BM.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID ; 




6.
CREATE OR REPLACE VIEW BOOKING_LOV_VIEW 
AS 
SELECT        BOOKING_M_ID,  BM.EVENT_M_ID,  BM.CLIENT_ID,  BM.EVENT_D_ID,  BM.VENUE_ID, 
              BOOKING_DATE, EVENT_START_DATE, EVENT_END_DATE, TOTAL_AMOUNT, ADVANCE, 
              DUE,  BM.RECEIVE_MODE_ID,  BM.ACTION_USER,  BM.ACTION_DATE_TIME,
              EVENT_M_NAME, CLIENT_NAME, EVENT_NAME, VENUE_NAME, RECEIVE_MODE_NAME
FROM          BOOKING_M BM, EVENT_M EM, CLIENT CL, EVENT_D ED, VENUE VE,  RECEIVE_MODE RM
WHERE         BM.EVENT_M_ID = EM.EVENT_M_ID 
AND           BM.CLIENT_ID = CL.CLIENT_ID 
AND           BM.EVENT_D_ID = ED.EVENT_D_ID 
AND           BM.VENUE_ID = VE.VENUE_ID
AND           BM.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID 
ORDER BY      BOOKING_M_ID ; 




7.

create or replace view bill_view 
as 
SELECT    BILL_ID, BI.BOOKING_M_ID, INVOICE_NUMBER, BILLING_DATE, 
          PAYABLE_AMOUNT, DISCOUNT, NET_AMOUNT,  PAID_AMOUNT, 
          DUE_AMOUNT, BI.RECEIVE_MODE_ID, 
          RETURN_AMOUNT, BI.ACTION_USER, BI.ACTION_DATE_TIME, 
          BM.EVENT_M_ID, BM.CLIENT_ID, BM.EVENT_D_ID, BM.VENUE_ID, 
          BOOKING_DATE, EVENT_START_DATE, EVENT_END_DATE, 
          TOTAL_AMOUNT, ADVANCE, DUE, EVENT_M_NAME, 
          CLIENT_NAME, EVENT_NAME, VENUE_NAME, 
          BOOKING_D_ID, SERVICE_QUANTITY, SERVICE_AMOUNT,
          BD.SERVICE_ID, SERVICE_NAME, RECEIVE_MODE_NAME
FROM      BILL BI, BOOKING_M BM, EVENT_M EM,
          CLIENT CL, EVENT_D ED, VENUE VE, RECEIVE_MODE RM,
          BOOKING_D BD, SERVICE SE
WHERE     BM.BOOKING_M_ID = BI.BOOKING_M_ID 
AND       BM.EVENT_M_ID = EM.EVENT_M_ID
AND       BM.EVENT_M_ID = ED.EVENT_M_ID(+)
AND       BM.CLIENT_ID = CL.CLIENT_ID(+)
AND       BM.EVENT_D_ID = ED.EVENT_D_ID(+)
AND       BM.VENUE_ID = VE.VENUE_ID 
AND       BI.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID 
AND       BD.BOOKING_M_ID = BM.BOOKING_M_ID 
AND       BD.SERVICE_ID = SE.SERVICE_ID 
order by  INVOICE_NUMBER ;






8.


create or replace view profit_loss_view  
as 
SELECT       BM.EVENT_M_ID, BM.CLIENT_ID, BM.EVENT_D_ID, BM.VENUE_ID, BOOKING_DATE, 
             EVENT_START_DATE, EVENT_END_DATE, TOTAL_AMOUNT, ADVANCE, DUE, BM.RECEIVE_MODE_ID,
             SERVICE_QUANTITY,  SERVICE_AMOUNT, (SERVICE_QUANTITY * SERVICE_AMOUNT) service_total, 
             BD.SERVICE_ID, BOOKING_D_ID,  CLIENT_NAME, EVENT_M_NAME,  EVENT_NAME, SERVICE_NAME, 
             VENUE_NAME,  RECEIVE_MODE_NAME,  BCM.BOOKING_M_ID, 
             BOOKING_COST_M_DATE, BCD.BOOKING_COST_M_ID, BOOKING_COST_D_ID,   BCD.COST_ID, COST_NAME, 
             AMOUNT, BCD.ACTION_USER, BCD.ACTION_DATE_TIME
FROM         BOOKING_COST_M BCM, BOOKING_M BM, BOOKING_D BD, EVENT_M EM, 
             CLIENT CL, EVENT_D ED, VENUE V, SERVICE SE, RECEIVE_MODE RM, 
             BOOKING_COST_D BCD, EVENT_COST EC
WHERE        BD.BOOKING_M_ID = BM.BOOKING_M_ID
AND          BM.EVENT_M_ID = EM.EVENT_M_ID 
AND          BM.CLIENT_ID = CL.CLIENT_ID
AND          BM.EVENT_D_ID = ED.EVENT_D_ID 
AND          BM.VENUE_ID = V.VENUE_ID
AND          BD.SERVICE_ID = SE.SERVICE_ID 
AND          BM.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID 
AND          BCM.BOOKING_M_ID = BM.BOOKING_M_ID 
AND          BCD.COST_ID = EC.COST_ID 
AND          BCM.BOOKING_COST_M_ID= BCD.BOOKING_COST_M_ID ; 





9. 
====


create or replace view RECEIVE_DETAILS_LOV_VIEW   
as 
SELECT       EM.EVENT_M_ID, EVENT_M_NAME,  CL.CLIENT_ID, CLIENT_NAME, 
             ED.EVENT_D_ID, EVENT_NAME, VE.VENUE_ID, VENUE_NAME,
             BOOKING_DATE, EVENT_START_DATE, EVENT_END_DATE, 
             TOTAL_AMOUNT, ADVANCE, DUE, BI.BILL_ID, BI.BOOKING_M_ID,
             INVOICE_NUMBER, BILLING_DATE, PAYABLE_AMOUNT, DISCOUNT,
             NET_AMOUNT, PAID_AMOUNT, DUE_AMOUNT, 
            f_due_rcv(BI.BOOKING_M_ID)TOTAL_PAID 
FROM         BOOKING_M BM, EVENT_M EM, CLIENT CL, EVENT_D ED, 
             VENUE VE , BILL BI
WHERE        BI.BOOKING_M_ID = BM.BOOKING_M_ID
AND          BM.EVENT_M_ID = EM.EVENT_M_ID 
AND          BM.CLIENT_ID = CL.CLIENT_ID
AND          BM.EVENT_D_ID = ED.EVENT_D_ID 
AND          BM.VENUE_ID = VE.VENUE_ID 
ORDER BY     BI.BOOKING_M_ID ; 



10.
=====



CREATE OR REPLACE VIEW RECEIVE_VIEW 
AS
SELECT       EM.EVENT_M_ID, EVENT_M_NAME,  CL.CLIENT_ID, CLIENT_NAME, ADDRESS,
             ED.EVENT_D_ID, EVENT_NAME, VE.VENUE_ID, VENUE_NAME,
             BOOKING_DATE, EVENT_START_DATE, EVENT_END_DATE, 
             TOTAL_AMOUNT, ADVANCE, DUE,INVOICE_NUMBER, BILLING_DATE, 
             PAYABLE_AMOUNT, DISCOUNT, NET_AMOUNT, PAID_AMOUNT, 
             DUE_AMOUNT, f_due_rcv(BI.BOOKING_M_ID) Total_Receive, 
             RECEIVE_ID, RE.BILL_ID, RE.BOOKING_M_ID, 
             RECEIVE_DATE, RE.RECEIVE_MODE_ID, RECEIVE_MODE_NAME, AMOUNT, 
             RECIEVE_DUE, RE.ACTION_USER, RE.ACTION_DATE_TIME
FROM         BOOKING_M BM, EVENT_M EM, CLIENT CL, EVENT_D ED, 
             VENUE VE , BILL BI, RECEIVE RE, RECEIVE_MODE RM
WHERE        BI.BOOKING_M_ID = BM.BOOKING_M_ID
AND          BM.EVENT_M_ID = EM.EVENT_M_ID 
AND          BM.CLIENT_ID = CL.CLIENT_ID
AND          BM.EVENT_D_ID = ED.EVENT_D_ID 
AND          BM.VENUE_ID = VE.VENUE_ID
AND          RE.BILL_ID = BI.BILL_ID
AND          RE.BOOKING_M_ID = BM.BOOKING_m_ID 
AND          RE.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID 
ORDER        BY RE.BILL_ID ; 



11.
=====

create or replace view cost_view
as
select bcm.booking_m_id, event_m_name,bcd. booking_cost_m_id,booking_cost_d_id,cost_name, amount expense_amount,total_amount total_service_amount,event_name,client_name,
       VENUE_name,RECEIVE_MODE_name, BOOKING_DATE,EVENT_START_DATE,EVENT_END_DATE
from   booking_m bm, event_m em, booking_cost_m bcm,booking_cost_d bcd, event_cost ec,event_d ed,CLIENT c,VENUE v,RECEIVE_MODE rm
where  bm. event_m_id = em.event_m_id
and    bm.booking_m_id = bcm.booking_m_id
and    bcm.booking_cost_m_id = bcd. booking_cost_m_id
and    bcd.cost_id = ec.cost_id
and    bm.event_d_id = ed.event_d_id
and    bm.client_id = c.client_id
and    bm.VENUE_id = v.VENUE_id
and    bm.RECEIVE_MODE_ID = rm.RECEIVE_MODE_ID ; 





12.
=====


create or replace view total
as
select sum(amount)Total_expense_amount ,BOOKING_COST_M.booking_m_id,Total_amount total_service_amount
from   event_cost,BOOKING_COST_D,BOOKING_COST_M, booking_m
where  BOOKING_COST_D.COST_ID = event_cost.COST_ID
and     BOOKING_COST_M.BOOKING_COST_M_ID= BOOKING_COST_D.BOOKING_COST_M_ID
and     booking_m.booking_m_id = BOOKING_COST_M.booking_m_id
group  by BOOKING_COST_M.booking_m_id,total_amount ; 


13. 
====
Create Date : 22-Apr-2024 
Reason :  Implement New Business Logic on Oracle Apex.


=================================
create or replace view BILL_VIEW_A
as
SELECT    BILL_ID, BI.BOOKING_M_ID, INVOICE_NUMBER, BILLING_DATE,
          PAYABLE_AMOUNT, DISCOUNT, NET_AMOUNT,  PAID_AMOUNT,
          DUE_AMOUNT, BI.RECEIVE_MODE_ID, (select   nvl(sum(amount), 0) from     
          receive  where    booking_m_id = BI.booking_m_id) Total_Receive,
          RETURN_AMOUNT, BI.ACTION_USER, BI.ACTION_DATE_TIME,
          BM.EVENT_M_ID, BM.CLIENT_ID, BM.EVENT_D_ID, BM.VENUE_ID,
          BOOKING_DATE, EVENT_START_DATE, EVENT_END_DATE,
          TOTAL_AMOUNT, ADVANCE, DUE, EVENT_M_NAME,
          CLIENT_NAME, EVENT_NAME, VENUE_NAME,
          BOOKING_D_ID, SERVICE_QUANTITY, SERVICE_AMOUNT,
          BD.SERVICE_ID, SERVICE_NAME, RECEIVE_MODE_NAME
FROM      BILL BI, BOOKING_M BM, EVENT_M EM,
          CLIENT CL, EVENT_D ED, VENUE VE, RECEIVE_MODE RM,
          BOOKING_D BD, SERVICE SE
WHERE     BM.BOOKING_M_ID = BI.BOOKING_M_ID
AND       BM.EVENT_M_ID = EM.EVENT_M_ID
AND       BM.EVENT_M_ID = ED.EVENT_M_ID(+)
AND       BM.CLIENT_ID = CL.CLIENT_ID(+)
AND       BM.EVENT_D_ID = ED.EVENT_D_ID(+)
AND       BM.VENUE_ID = VE.VENUE_ID
AND       BI.RECEIVE_MODE_ID = RM.RECEIVE_MODE_ID
AND       BD.BOOKING_M_ID = BM.BOOKING_M_ID
AND       BD.SERVICE_ID = SE.SERVICE_ID
order by  INVOICE_NUMBER ;


=================================


14. 
====

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


=================================





















