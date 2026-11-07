# Event Management System (Oracle Forms, Reports & APEX)

An event management system built as a university course project (team code:
DDD-56). Handles clients, venues, services, bookings, billing, payments,
expenses, employees, and role-based users — with printable invoices and
profit/loss reports.

## Tech Stack

- **Oracle Forms Builder** (10g/11g) — data-entry modules (`.fmb` sources + `.fmx` runtime)
- **Oracle Reports Builder** — printable reports (`.rdf`), plus BI Publisher and JasperSoft report definitions
- **Oracle APEX** — table scripts for the APEX side
- **Oracle Database** — schema via SQL table scripts; full DB data backup (`.dmp`) included

## Modules

| Area | Forms |
|------|-------|
| Bookings | BOOKING, EVENT_WISE_SERVICE, Booking_wise_cost |
| Billing | BILL_ENTRY, RECEIVE_ENTRY, Payment_Mode, EXPENSE_ENTRY, EXPENSE_TYPE |
| Clients & Venue | CLIENT_INFORMATION, VENUE, SERVICES |
| HR | DEPARTMENT, DESIGNATION, EMPLOYEE |
| System | LOGIN, HOMEPAGE, USER_INFO, USER_TYPE, USER_STATUS, USER_ACCESSS_PRIVILEGE, FORM_INFORMATION |

Reports include booking-wise invoices, bills, expenses, client profiles,
employee lists, and booking-wise profit/loss under `Reports/`; HTML/CSS report
variants under `HTM_CSS_REPORT/`; JasperSoft under `Jasper Soft Reports/`.

## Repository Layout

```
Forms/            .fmb sources + .fmx runtime modules
Reports/          .rdf report definitions
Apex/             APEX table scripts
BI_Publisher/     BI Publisher report definitions
HTM_CSS_REPORT/   HTML/CSS-styled reports
Jasper Soft Reports/  JasperSoft report sources
Documents/        ERD & DFD, table scripts, report server batch files
Databackup/       Oracle DB export dump (EMS_DDD56, 19-MAR-2024)
Menu/             Forms menus (.mmb/.mmx)
Object_Library/   shared Forms object library (.olb)
Images/           UI assets (logos, backgrounds, user images)
```

## How to Run

1. Create a schema in Oracle DB and run `Apex/Table_Script_For_Appex.txt` and
   the scripts under `Documents/`.
2. Open `.fmb` files in Oracle Forms Builder, connect to the schema, compile,
   and run through the Forms runtime.
3. Restore sample data with the dump in `Databackup/` (IMPDP).

## Author

Ismail Taswar ([@Ismail-Taswar](https://github.com/Ismail-Taswar)) — educational project.
