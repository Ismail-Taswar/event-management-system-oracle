

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



create or replace function function_name
() --Parameter 
return 
is 
-- Declare Section 
begin

exception

return 
end ; 
/ 



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


select     count(service_id) 
from       booking_d 
where      booking_m_id = 10011 ; 



create or replace function f_se
(p_booking_m_id           number) 
return    number 
is 
 v_total_service        number  ; 
begin 
 select     count(service_id) 
 into       v_total_service
 from       booking_d 
 where      booking_m_id = p_booking_m_id ; 
return (v_total_service )  ; 
end ; 
/



select    f_se(10011) 
from      booking_d ; 




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



select     sum(SERVICE_QUANTITY) 
from       booking_d 
where      booking_m_id = 10011; 


create or replace function f_sq
(p_booking_m_id           number) 
return    number 
is 
 v_total_service_qty        number  ; 
begin 
 select     sum(SERVICE_QUANTITY) 
 into       v_total_service_qty
 from       booking_d 
 where      booking_m_id = p_booking_m_id ; 
return (v_total_service_qty )  ; 
end ; 
/




select     sum(SERVICE_AMOUNT) 
from       booking_d 
where      booking_m_id = 10011; 



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



create or replace function f_sa
(p_booking_m_id           number) 
return    number 
is 
 v_total_service_amt        number  ; 
begin 
 select     sum(SERVICE_QUANTITY) 
 into       v_total_service_qty
 from       booking_d 
 where      booking_m_id = p_booking_m_id ; 
return (v_total_service_qty )  ; 
end ; 
/


select    (event_end_date) - (event_start_date) 
from      booking_M 
where     booking_m_id = 10011 ; 




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



drop  function f_sa ; 
create or replace function f_tsd
(p_booking_m_id           number) 
return    number 
is 
 v_total_Book_days        number  ; 
begin 
  select    (event_end_date) - (event_start_date) 
  into      v_total_Book_days
  from      booking_M 
  where     booking_m_id = p_booking_m_id ; 
return (v_total_Book_days )  ; 
end ; 
/





@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



drop  function f_sa ; 
create or replace function f_tsd
(p_booking_m_id           number) 
return    number 
is 
 v_total_Book_days        number  ; 
begin 
  select    (event_end_date) - (event_start_date) 
  into      v_total_Book_days
  from      booking_M 
  where     booking_m_id = p_booking_m_id ; 
return (v_total_Book_days )  ; 
end ; 
/



select    sum (amount)  
from      booking_cost_d
where     booking_cost_m_id = 1  ; 




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



drop function f_total_exp ; 
create or replace function f_total_exp 
(p_booking_cost_m_id        number) 
return       number 
is 
v_total_exp         number ; 
begin
  select    sum (amount) 
  into      v_total_exp 
  from      booking_cost_d
  where     booking_cost_m_id = p_booking_cost_m_id  ; 
return (v_total_exp) ; 
end ; 
/



select     f_total_exp(1)
from       booking_cost_d ; 



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



select   sum(amount) 
from     receive
where    booking_m_id = 10018
group by booking_m_id  ;





drop function f_due_rcv  ; 


create or replace function f_due_rcv
(p_booking_m_id      number)
return              number
is 
v_total_due_rcv         number ; 
begin
   SELECT    (NVL(SUM(AMOUNT), 0 )) 
   INTO      v_total_due_rcv 
   FROM      RECEIVE RE , BILL BI
   WHERE     RE.BILL_ID = BI.BILL_ID 
   AND       BI.BOOKING_M_ID = p_booking_m_id 
   GROUP BY  BI.BOOKING_M_ID ; 
return (v_total_due_rcv) ; 
end ;
/  
s

execute Date : 25-Feb-2024


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


create or replace procedure pro_upd_bill
(
 P_bill_id     in bill.bill_id%type,
 p_paid_amount in bill.paid_amount%type 
)
is
begin
update bill
set    PAID_AMOUNT = paid_amount + p_paid_amount, 
        DUE_AMOUNT = DUE_AMOUNT - p_paid_amount
where  BILL_ID = P_bill_id ;
commit ;
end ;
/




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


create or replace function f_total_exp
(p_booking_cost_m_id        number)
return       number
is
v_total_exp         number ;
begin
  select    sum (amount)
  into      v_total_exp
  from      booking_cost_d
  where     booking_cost_m_id = p_booking_cost_m_id  ;
return (v_total_exp) ;
end ;


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

create or replace function count_profit_loss
 (p_id       number)
 return      number
as
  v_result     number ; 
begin
select case when
     total_service_amount > total_expense_amount then
    (total_service_amount - total_expense_amount)
     when
       total_service_amount < total_expense_amount then
       (total_expense_amount - total_service_amount)
     else
      null  
     end as profit_loss
into  v_result
 from   total
 where  booking_m_id = p_id ;
 return v_result ;
end ;




@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
