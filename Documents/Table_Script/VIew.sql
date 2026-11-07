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




create or replace view total
as
select sum(amount)Total_expense_amount ,BOOKING_COST_M.booking_m_id,Total_amount total_service_amount
from   event_cost,BOOKING_COST_D,BOOKING_COST_M, booking_m
where  BOOKING_COST_D.COST_ID = event_cost.COST_ID
and     BOOKING_COST_M.BOOKING_COST_M_ID= BOOKING_COST_D.BOOKING_COST_M_ID
and     booking_m.booking_m_id = BOOKING_COST_M.booking_m_id
group  by BOOKING_COST_M.booking_m_id,total_amount ; 



create or replace function count_profit_loss
 (p_id       number)
 return   varchar2
is
  v_result     varchar2(100) ;
begin
select case when
     total_service_amount > total_expense_amount then
    'Profit' ||' '||(total_service_amount - total_expense_amount)
     when
    total_service_amount < total_expense_amount then
    'Loss' ||' '||(total_expense_amount - total_service_amount)
     else
    'No Profit'
     end as profit_loss
into  v_result
 from   total 
 where  booking_m_id = p_id;
 return v_result ;
 end ;
/
