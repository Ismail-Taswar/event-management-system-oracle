# Event Management System (Oracle Forms, Reports & APEX)

An event management system built as a university course project.
Handles clients, venues, services, bookings, billing, payments,
expenses, employees, and role-based users — with printable invoices and
profit/loss reports.

## Tech Stack

- **Oracle Forms Builder** (10g/11g) — data-entry modules (`.fmb` sources + `.fmx` runtime)
- **Oracle Reports Builder** — printable reports (`.rdf`), plus BI Publisher report definitions
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
employee lists, and booking-wise profit/loss under `Reports/` and
HTML/CSS report variants under `HTM_CSS_REPORT/`.

## Repository Layout

```
Forms/            .fmb sources + .fmx runtime modules
Reports/          .rdf report definitions
Apex/             APEX table scripts
BI_Publisher/     BI Publisher report definitions
HTM_CSS_REPORT/   HTML/CSS-styled reports
Documents/        ERD & DFD, table scripts, report server batch files
Databackup/       Oracle DB export dumps (2024)
Menu/             Forms menus (.mmb/.mmx)
Object_Library/   shared Forms object library (.olb)
Images/           UI assets (logos, backgrounds, user images)
```

## How to Run

1. Create a schema in Oracle DB and run
   `Documents/Table_Script/Table_Script_of_Event_Management_System.sql`
   (schema + sample data, incl. login users — default `admin` / `123`),
   then `Documents/Table_Script/Table_Script_for_Menu_Access_Control_for_Forms_10g.sql`,
   and optionally `All_Procedure_and_Function.sql` and `ALL_Views_Ems.sql`.
   For the APEX side run `Apex/Table_Script_For_Appex.sql`.
2. Open `.fmb` files in Oracle Forms Builder, connect to the schema, compile,
   and run through the Forms runtime.
3. Alternatively, restore the full database with a dump from `Databackup/`
   (IMPDP) instead of step 1.

## Author

Ismail Taswar ([@Ismail-Taswar](https://github.com/Ismail-Taswar)) — educational project.
