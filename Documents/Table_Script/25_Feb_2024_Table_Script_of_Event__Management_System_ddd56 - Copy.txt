conn sys as sysdba


show user 

drop user ems_ddd56 cascade ; 

create      user ems_ddd56 
identified  by 123
quota       unlimited on users ; 

grant create session, create table, create sequence, 
      create synonym, create view,  create procedure, 
      create trigger 
to    ems_ddd56 ;

grant dba to  ems_ddd56 identified by 123 ; 

conn ems_ddd56/123 


--==================
-- User_type Table 
--==================

drop table user_type cascade constraint ; 

create table user_type 
(
user_type_id               number, 
user_type_name             varchar2(100)   constraint  user_type_user_type_name_nn not null
                                     constraint  user_type_user_type_name_uk unique, 
user_type_description      varchar2(250), 
action_user                varchar2(100)   default user, 
action_date_time           date           default sysdate    
) ;


alter table User_type 
add   constraint User_type_user_type_id_pk primary key (user_type_id) ; 

desc user_type ;


--------------------------------------------------------

INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (101, 'Manager');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (102, 'Employee');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (103, 'Supervisor');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (104, 'Guest');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (105, 'Moderator');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (106, 'Customer');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (107, 'Analyst');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (108, 'Tester');


INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (109, 'Developer');

INSERT INTO User_type (user_type_id, user_type_name) 
VALUES (110, 'Support');

commit ; 

--------------------------------------------------------


select     user_type_id, user_type_name
from       user_type ; 


--====================
-- User_status Table 
--====================

drop table User_status cascade constraint ; 

create table User_status 
(
user_status_id                number, 
User_status_name              varchar2(100) constraint  User_status_User_status_name_nn not null
                                            constraint  User_status_User_status_name_uk unique, 
user_status_description      varchar2(250),   
action_user                  varchar2(100)   default user, 
action_date_time  date       default sysdate    
) ; 


alter table User_status 
add   constraint User_status_user_status_id_pk primary key (user_status_id) ; 

desc user_status ;

--------------------------------------------------------------- 
 

insert into user_status ( user_status_id, User_status_name)
values (200,'Active'); 

insert into user_status ( user_status_id, User_status_name)
values (201,'Admin Review Required');

insert into user_status ( user_status_id, User_status_name)
values (202,'Pending Approval'); 
 
insert into user_status ( user_status_id, User_status_name)
values (203,'Locked'); 

insert into user_status ( user_status_id, User_status_name)
values (204,'Expired'); 

insert into user_status ( user_status_id, User_status_name)
values (205,'Suspended'); 

insert into user_status ( user_status_id, User_status_name)
values (206,'Password Reset Required'); 

insert into user_status ( user_status_id, User_status_name)
values (207,'Two-Factor Authentication Required'); 

insert into user_status ( user_status_id, User_status_name)
values (208,'Guest/Temporary'); 

insert into user_status ( user_status_id, User_status_name)
values (209,'Onboarding'); 

insert into user_status ( user_status_id, User_status_name)
values (210,'Read-Only'); 

insert into user_status ( user_status_id, User_status_name)
values (211,'Time-Limited'); 

commit ; 

Select *
from  user_status ; 

--------------------------------------------------------------- 

--==============
-- Branch Table 
--==============

drop table Branch cascade constraint ; 


create table Branch 
(
Branch_id            number, 
Branch_name          varchar2(100)   constraint branch_branch_name_nn not null, 
cell_number          varchar2(100)   constraint branch_cell_number_uk unique, 
Branch_address       varchar2(250),
email                varchar2(100)   constraint branch_email_uk unique, 
action_user          varchar2(100)   default user, 
action_date_time     date           default sysdate   
) ; 

alter table branch 
add constraint branch_Branch_id_pk primary key (Branch_id) ; 

desc branch ;

--------------------------------------------------------------------------------


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 1, 'Dhaka Branch', '+8801521300',  'Motejeel, Dhaka ', 
         'dhakabr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values (2, 'Commilla Branch', '+8801521301',  
         'Commilla Sadar, Commila ', 'commillabr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values (3, 'Chadpur Branch', '+8801521302',  
         'Chadpur Sadar, Chadpur ', 'chadpurbr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 4, 'Noakhali Branch', '+8801521303',  
         'Noakhali Sadar, Noakhali', 'noakhalibr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values (5, 'Bagura Branch', '+8801521304',  
         'Bagura Sadar, Bagura', 'bogurabr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 6, 'Rangpur Branch', '+8801521305',  
         'Rangpur Sadar, Rangpur ', 'rangpurbr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 7, 'Barisal Branch', '+8801521306',  
         'Barishal Sadar, Barishal', 'barishalbr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 8, 'Bhola Branch', '+8801521307',  
         'Bhola Sadar, Bhola', 'bholabr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 9, 'Shylhet Branch', '+8801521308',  
         'Shylhet Sadar, Shylhet', 'shylhetbr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 10, 'Bandarban Branch', '+8801521309',  
         'Bandarban Sadar, Bandarban', 'bandarbanbr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 111, 'Rangamati Branch', '+8801521310',  
         'Rangamati Sadar, Rangamati', 'rangamatibr@yahoo.com') ; 


insert into branch(Branch_id, Branch_name, cell_number, Branch_address, email )
values ( 12, 'Chittagong Branch', '+8801521311',  
         'Chittagon Sadar, Chittagon', 'chittagonbr@yahoo.com') ; 

commit ; 

select* 
from branch ; 

-------------------------------------------------------------------------------




--==================
--Department Table 
--==================

drop table Department cascade constraints ;

create table Department 
(
Department_id            number,
Department_name          varchar2(100) constraints Department_Department_name_nn not null
                                       constraints Department_Department_name_uk unique,
Department_location      varchar2(100),
Department_country       varchar2(100) ,
action_user              varchar2(100)   default user, 
action_date_time         date            default sysdate   
) ; 


alter table department
add constraint Department_Department_id_pk primary key (Department_id) ; 

desc department ;


-----------------------------------------------------------------------


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (1, 'Finance', 'Dhaka Sadar, Dhaka', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (2, 'Accounts Payable (AP)', 'Commilla Sadar, Commilla', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (3, 'Accounts Receivable (AR)', 'Chadpur Sadar, Chadpur', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (4, 'Payroll', 'Bagura Sadar, Bagura', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (5, 'Human Resources (HR)', 'Rangpur Sadar, Rangpur', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (6, 'Purchasing and Procurement', 'Barishal Sadar, Barishal', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (7, 'Sales and Marketing', 'Bhola Sadar, Bhola', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (8, 'Taxation', 'Dhaka Sadar, Dhaka', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (9, 'Treasury','Dhaka Sadar, Dhaka', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (10, 'Budgeting and Forecasting', 'Dhaka Sadar, Dhaka', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (11, 'Capital Expenditures (CapEx)', 'Motejeel, Dhaka', 'Bangladesh'); 


insert into department (Department_id, Department_name, Department_location,
                        Department_country )
values (12, 'Project Management', 'Mirpur, Dhaka', 'Bangladesh'); 


commit; 

select*
from department;

-------------------------------------------------------------------------------------


--==================
--Designation Table 
--==================



drop table Designation cascade constraint ; 

create table Designation 
(
Designation_id                number, 
Designation_Name              varchar2(100)   constraint Designation_Designation_Name_nn Not Null
                                         constraint Designation_Designation_Name_uk unique,
Designation_description       varchar2(250), 
action_user                   varchar2(100)   default user, 
action_date_time              date            default sysdate   
) ; 


alter table designation 
add constraint Designation_Designation_id_pk primary key (Designation_id) ; 

desc designation ; 


----------------------------------------------------------------


insert into designation (Designation_id, Designation_Name)
values (1, 'Chief Financial Officer');

insert into designation (Designation_id, Designation_Name)
values (2, 'Finance Manager');

insert into designation (Designation_id, Designation_Name)
values (3, 'Accountant');

insert into designation (Designation_id, Designation_Name)
values (4, 'Accounts Payable Clerk');

insert into designation (Designation_id, Designation_Name)
values (5, 'Accounts Receivable Clerk');

insert into designation (Designation_id, Designation_Name)
values (6, 'Payroll Manager');

insert into designation (Designation_id, Designation_Name)
values (7, 'Payroll Clerk');

insert into designation (Designation_id, Designation_Name)
values (8, 'Internal Auditor');

insert into designation (Designation_id, Designation_Name)
values (9, 'Tax Analyst');

insert into designation (Designation_id, Designation_Name)
values (10, 'Financial Analyst');

insert into designation (Designation_id, Designation_Name)
values (11, 'Billing Specialist');

insert into designation (Designation_id, Designation_Name)
values (12, 'Cost Accountant');

commit; 

select* from designation ; 

--------------------------------------------------------------------------



--================
--Employee Table 
--================

drop table employee cascade constraint ; 

create table employee
( 
employee_id               number, 
Department_id             number,
Designation_id            number,
Branch_id                 number, 
first_name                varchar2(100) constraint employee_first_name_nn NOT NULL,
last_name                 varchar2(100) constraint employee_last_name_nn NOT NULL,
Father_name               varchar2(100),
Mother_name               varchar2(100),
Present_address           varchar2(350),
Permanent_address         varchar2(350), 
salary                    number constraint Employee_salary_ck check (salary > 0 ),
join_date                 date default sysdate,
NID                       number  constraint employee_NID_UK unique, 
Email                     varchar2(100) constraint employee_email_uk unique, 
cell_number               varchar2(100) constraint employee_cell_number_uk unique, 
date_of_birth             date,
Gender                    varchar2(100),
Religion                  varchar2(100), 
Nationality               varchar2(100), 
Blood_Group               varchar2(100),
Employee_Image            Blob,
action_user               varchar2(100)   default user, 
action_date_time          date                   default sysdate   
) ; 

alter table employee
add   constraint employee_employee_id_pk primary key (employee_id) ;

alter table employee
add   constraint employee_Department_id_fk foreign key (Department_id)
references Department (Department_id) ; 

alter table employee
add   constraint employee_Designation_id_fk foreign key (Designation_id)
references Designation(Designation_id) ; 


alter table employee
add   constraint employee_Branch_id_fk foreign key (branch_id) 
references branch(branch_id) ; 


--------------------------------------------------------------------------------

=========
--INSERT
=========


insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email, cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (1, 1, 1, 1, 'Manju', 'Ahamed', 'Mobasser Ahamed', 
        'Nasima Begum', 'Dhaka Sadar, Dhaka', 'Dhaka Sadar, Dhaka', 
         12000,6453600, 'manju600@gmail.com', '+880197272600','10-Apr-2002',
         'Male', 'Islam', 'Bangladeshi', 'AB+' ); 


insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (2, 2, 3,3, 'Montaj', 'Ahamed', 'Faruk Ahamed',
          'Fabiha Islam', 'Mirpur, Dhaka',  'Buddah, Dhaka',
           12001, 6453601 , 'mahamed601@gmail.com' , '+880197272601',
          '11-Jan-1997', 'Male', 'Islam',
           'Bangladeshi', 'AB+' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (3, 2, 3,3, 'Opu', 'Majumdar', 'Ponkaj Majumdar',
          'Bithi Rani', 'Gosaildanga, Chittagong',  'Gosaildanga, Chittagong',
           12002, 6453602 , 'opum602@gmail.com' , '+880197272602',
          '22-Feb-1997', 'Male', 'Hindu',
           'Bangladeshi', 'A-' ); 


insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (4, 2, 3,3, 'Nurul', 'Islam', 'Mohiuddin Islam',
          'Fatema Begum', 'Mirpur-1101, Dhaka',  'Gulsha, Dhaka',
           12003, 6453603 , 'nurul603@gmail.com' , '+880197272603',
          '23-Apr-1997', 'Male', 'Islam',
           'Bangladeshi', 'A+' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (5, 2, 3,3, 'Nahida', 'Khatun', 'Boshirurl Hoque',
          'Bibi Fatema', 'Puranpaltan, Dhaka',  'Jatrabari, Dhaka',
           12004, 6453604 , 'Nahida604@gmail.com' , '+880197272604',
          '24-Apr-1997', 'female', 'Islam',
           'Bangladeshi', 'O+' ); 


insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (6,2, 3,3, 'Prodipto', 'Chowdhury', 'Bishwajit Chowdhury',
          'Rita Cohwdhury', 'Rangamati, Sadar',  'Rangamati',
           12005, 6453605 , 'Prodipto605@gmail.com' , '+880197272605',
          '14-Apr-1997', 'Male', 'Hindu',
           'Bangladeshi', 'AB+' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (7, 2, 3,3,'Saiful', 'Islam', 'Rafiqul Islam Nabi',
          'Bibi Jahura ', 'Jatrabari, Dhaka',  'Jatrabari, Dhaka',
           12006, 6453606 , 'saiful60@gmail.com' , '+880197272606',
          '26-Dec-1997', 'Male', 'Islam',
           'Bangladeshi', 'AB-' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (8, 2, 3,3, 'Sibli', 'Sadek', 'Rfaiqullah Sadek',
          'Rogina Begum', 'Mohammadpur, Dhaka',  'Jatrabari, Dhaka',
           12007, 6453607 , 'sibli607@gmail.com' , '+880197272607',
          '27-Apr-1997', 'Male', 'Islam',
           'Bangladeshi', 'AB+' ); 




insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (9,2, 3,3, 'Rafi', 'Chowdhury', 'Kibria Chowdhury',
          'Momtaj Begum', 'Purnapltan, Dhaka',  'Noypaltan, Dhaka',
           12008, 6453608 , 'rafi60@gmail.com' , '+880197272608',
          '28-Apr-1997', 'Male', 'Islam',
           'Bangladeshi', 'B-' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (10,2, 3,3, 'Ragib', 'Hayder', 'Motaleb Hossain',
          'Fatema Majumdar', 'Mirpur, Dhaka',  'Badda, Dhaka',
           12009, 6453609 , 'ragib609@gmail.com' , '+880197272609',
          '29-Apr-1997', 'Male', 'Islam',
           'Bangladeshi', 'B+' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (11, 2, 3,3, 'Mosleh', 'Uddin', 'Jameel Uddin',
          'Monira Begum', 'Baddah, Dhaka',  'Narayanganj, Dhaka',
           12010, 6453610 , 'moslehu610@gmail.com' , '+880197272610',
          '13-Apr-1997', 'Male', 'Islam',
           'Bangladeshi', 'AB-' ); 



insert into employee (employee_id,Department_id ,Designation_id,
                      Branch_id, first_name, last_name ,Father_name, 
                      Mother_name, Present_address , 
                      Permanent_address ,salary ,
                      NID, Email,cell_number, 
                      date_of_birth, Gender , Religion , 
                      Nationality, Blood_Group) 
Values (12, 2, 3,3, 'Rasul', 'Ahamed', 'Mozaffar Hossain',
          'Sabina Chowdhury', 'Keraniganj, Dhaka',  'Mogbajar, Dhaka',
           12011, 6453611 , 'rasula611@gmail.com' , '+880197272611',
          '10-Apr-1996', 'Male', 'Islam',
           'Bangladeshi', 'O+' ); 

commit ;

select* 
from  employee ; 

--------------------------------------------------------------------------------

--================
--User_info Table 
--================

drop table User_info cascade constraint ; 

create table User_info
(
User_info_id            number, 
User_type_id            number, 
user_status_id          number, 
Employee_id             number, 
branch_id               number, 
username                varchar2(100) constraint User_info_username_nn not null
                                      constraint User_info_username_uk unique,
password                varchar2(100) constraint user_info_password_nn Not Null,
user_image              Blob,
action_user             varchar2(100)   default user, 
action_date_time        date            default sysdate   
) ;

alter table user_info 
add constraint  User_info_User_info_id_pk primary key (User_info_id) ; 

alter table user_info 
add   constraint  user_info_User_type_id_fk foreign key (User_type_id)
references User_type(User_type_id) ; 

alter table user_info 
add   constraint User_info_user_status_id_fk foreign key (user_status_id)
references user_status(user_status_id) ;

alter table user_info 
add   constraint User_info_Employee_id_fk foreign key (Employee_id) 
References Employee(Employee_id) ; 

alter table user_info 
add   constraint user_info_branch_id_fk foreign key (branch_id) 
references branch(branch_id) ; 


desc   user_info ; 


----------------------------------------------------------------------------

insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (1, 1, 1, 1, 1, 'account_pay_clrk', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (2, 1, 1, 1, 1, 'account_receiveable_clrk', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (3, 1, 1, 1, 1, 'admin', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (4, 1, 1, 1, 1, 'bookkeeper', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (5,  1, 1, 1, 1, 'Budget Cooridnatior', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (6, 1, 1, 1, 1,'Financial Analyst', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (7,  1, 1, 1, 1,'Guest_User', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (8,  1, 1, 1, 1, 'inventory_manager', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (9, 1, 1, 1, 1, 'Manager', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (10, 1, 1, 1, 1, 'Payroll Clerk', 123 ) ;


insert into user_info (User_info_id, User_type_id, user_status_id,
                       Employee_id, branch_id, username, password)
values (11, 1, 1, 1, 1, 'sales_rep', 123 ) ;


commit ;

select* 
from   user_info ; 

----------------------------------------------------------------------------


--===================
--Expense_Type Table 
--===================

drop table Expense_Type cascade constraint; 

create table Expense_Type
(
Expense_Type_ID     number, 
Expense_Type_Name    varchar2(100) constraint Expense_TypeExpense_Type_Name_NN Not NULL
                                   constraint Expense_TypeExpense_Type_Name_UK Unique, 
action_user          varchar2(100)   default user, 
action_date_time     date            default sysdate   
) ;

alter table Expense_Type
add constraint Expense_Type_Expense_Type_ID_PK Primary Key (Expense_Type_ID) ; 


desc Expense_Type; 

----------------------------------------------------------------------------------


--===================
--Expense_M Table 
--===================

drop table Expense_M cascade constraint ; 

create table Expense_M 
(
Expense_M_ID            number, 
Branch_ID               number, 
Expense_date            date   constraint Expense_M_Expense_date_NN Not Null 
                               constraint Expense_M_Expense_date_UK Unique, 
action_user             varchar2(100)   default user, 
action_date_time        date            default sysdate   
) ;

alter table Expense_M
add constraint Expense_M_Expense_M_ID_PK Primary Key (Expense_M_ID ) ;

alter table Expense_M
add constraint Expense_M_Branch_ID_FK Foreign Key (Branch_ID) 
References Branch(Branch_ID) ; 

desc Expense_M ; 



--================
--Expense_D Table 
--================


drop table Expense_D cascade Constraint ; 

create table Expense_D
(
Expense_M_ID            number, 
Expense_Type_ID         number constraint Expense_D_Expense_Type_ID_NN Not Null, 
Expense_Amount          number constraint Expense_D_Expense_Amount_NN Not Null,
Receive_Mode_id         number Constraint Expense_D_Receive_Mode_id_NN Not Null, 
employee_id             number,
Description             varchar2(250),
action_user             varchar2(100),
action_date_time        varchar2(100)
); 

alter Table Expense_D
add   constraint Expense_D_Expense_M_ID_FK Foreign Key (Expense_M_ID) 
references Expense_M(Expense_M_ID) ; 

alter table Expense_D
add   constraint Expense_D_Expense_Type_ID_FK Foreign Key (Expense_Type_ID)
references Expense_Type(Expense_Type_id) ; 

alter table Expense_D
add   constraint Expense_D_Receive_Mode_id_fk foreign key (Receive_Mode_id) 
references Receive_Mode(Receive_Mode_id) ; 

desc Expense_d; 




commit ;

select* 
from   expense_D ;


 



--==============
--Event_M Table
--==============



drop table event_m cascade constraint;

create table event_m
(
event_category_id                number,
event_category_name              varchar2(100) ,
event_category_description       varchar2(100) ,
action_user                      varchar2(100) default user,
action_date_time                 date default sysdate
);

alter table event_m
add constraint event_m_event_category_id_pk primary key(event_category_id);





--==============
--Event_D Table
--==============


drop   table event_d cascade constraint;

create table event_d
(
event_category_id      number,
event_id               varchar2(100)  constraint event_d_event_id_nn not null
                                     constraint event_d_event_id_uk unique,
event_name             varchar2(250)  constraint event_d_event_name_nn not null
                                      constraint event_d_event_name_uk unique,
event_description      varchar2(350),
action_user            Varchar2(100)  default user, 
action_date_time       date           default sysdate
);

alter      table event_d 
add        constraint event_devent_category_id_fk foreign key(event_category_id)
references event_m(event_category_id);


--========================
--Service_category Table
--========================



drop table service_category cascade constraint;

create table service_category
(
 service_category_id             number,
 service_category_name           varchar2(100)   constraint service_category_service_category_name_nn not null
                                                 constraint service_category_service_category_name_uk unique,
 service_category_description    varchar2(350),
 action_user                     varchar2(100)  default user,
 action_date_time                date          default sysdate 
);

alter table      service_category
add   constraint service_category_service_category_id_pk primary key(service_category_id);




--==============
--Service Table
--==============


drop table service cascade constraint;

create table service
(
service_id                  number,
service_category_id         number , 
service_name                varchar2(100) constraint service_service_name_uk unique
                                          constraint service_service_name_nn not null,
service_fee                 number,
service_name_description    varchar2(350),
action_user                 varchar2(100) default user,
action_date_time            date         default sysdate
);

alter table service
add   constraint service_service_id_pk primary key(service_id);

alter      table service
add        constraint service_service_category_id_fk foreign key(service_category_id)
references service_category(service_category_id);





--==============
-- Client table 
--==============



drop   table client cascade constraint;

create table client
(
client_id           number,  
client_name         varchar2(100) constraint client_client_name_nn not null,
cell_number         varchar2(100) constraint client_cell_number_uk unique,
address             varchar2(100),
gmail               varchar2(100) constraint client_gmail_uk unique,
website             varchar2(100),
client_status       varchar2(100) ,             --active/inactive
city                varchar2(100),
country             varchar2(100),
action_user         Varchar2(100) default user, 
action_date_time date         default sysdate
)
;

alter table client
add   constraint client_client_id_pk primary key(client_id);



--=======
--Insert 
--=======


insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (1, 'Jack Reacher', 0968746209, 'Bosila',
       'jack2345@gmail.com', 'happyshop.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (2, 'Brad Pitt', 0960006209, 'Borikaa',
       'bripitt@gmail.com', 'foodb.co', null,'Borishal', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (3, 'Tom Cruise', 0968746123, 'rahmatganj',
       'tommy@gmail.com', 'bdjobs.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (3, 'Aksar patel', 09621346209, 'jamalpur',
      ' akbhai@gmail.com', 'yoyohoney.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (4, 'Shakib Bhai', 0960746209, 'Bosila',
       'shakib123@gmail.com', 'bdhome.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (5, 'Shilpy Akter', 0965546209, 'Bosila',
       'shilpy2535@gmail.com', 'amishilpy.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (6, 'Nadia Akter', 0968046209, 'Bosila',
       'nadiaakter@gmail.com', 'nadiaskitchen.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                    website,client_status, city ,country )
values (7, 'Yusuf Khan', 0944746209, 'Bosila',
       'khanyusuf@gmail.com', 'khanshop.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (8, 'Rafik Ullah', 0912746209, 'Bosila',
       'rafik@gmail.com', 'uniquebd.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (9, 'Parvati Patel', 0988906209, 'Bosila',
       'ppatel@gmail.com', 'patelhome.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (10, 'Abrar Fahim', 0968741209, 'Bosila',
       'abrargunner@gmail.com', 'gunnercu.com', null,'Dhaka', 'Bangladesh');

insert into client(client_id, client_name,cell_number,address,gmail,
                   website,client_status, city ,country )
values (11, 'Tarek Zia', 0968746200, 'Bosila',
       'zia1242@gmail.com', 'tarekbd.com', null,'Dhaka', 'Bangladesh');

select * from client;




--============
--VENUE Table
--============


drop table venue cascade constraint;


create table venue
(
venue_id              number,
venue_name            varchar2(100) constraint venue_venue_name_nn not null
                                   constraint venue_venue_name_uk unique,
venue_location        varchar2(100),
action_user           varchar2(100) default user,
action_date_time      date         default sysdate
);

alter table venue
add constraint venue_venue_id_pk primary key(venue_id);



--================
--BOOKING_M Table
--================


drop table booking_m cascade constraint;

create table booking_m
(
booking_m_id            number,
client_id               number,
event_id                varchar2(100),
venue_id                number,
booking_date            date,
start_event_date        date,
end_event_date          date,
total_amount            number,
advance                 number,
due                     number,
receive_mode_id         number,
Receive_description     varchar2(350),
action_user             varchar2(100)  default user,
action_date_time        date          default sysdate
);

alter table booking_m
add constraint booking_m_booking_m_id_pk primary key(booking_m_id);

alter table booking_m
add   constraint booking_m_client_id_fk foreign key(client_id)
references client(client_id);


alter table booking_m
add   constraint booking_m_event_id_fk foreign key(event_id)
references event_d(event_id);

alter table booking_m
add   constraint booking_m_venue_id_fk foreign key(venue_id)
references venue(venue_id);

alter table booking_m
add   constraint booking_m_receive_mode_id_fk foreign key (receive_mode_id)
references receive_mode(receive_mode_id) ; 




--======================
--Booking_D Table
--======================


drop table booking_d cascade constraint;

create table booking_d
(
booking_d_id             number,
booking_m_id             number,
service_id               number,
service_quantity         number,
service_amount           number,
action_user              varchar2(100) default user,
action_date_time         date         default sysdate
);

alter table booking_d
add constraint booking_d_booking_d_id_pk primary key(booking_d_id);

alter table booking_d
add constraint booking_d_booking_m_id_fk foreign key(booking_m_id)
references  booking_m(booking_m_id);

alter table booking_d
add constraint booking_d_service_id_fk foreign key(booking_m_id)
references  service(service_id);




--=========================
--Booking_Schedule Table 
--=========================


drop table booking_schedule cascade constraint;

create table booking_schedule
(
booking_schedule_id       number,
booking_m_id              number,
event_id                  varchar2(100),
venue_id                  number,
client_id                 number,
booking_date              date,
start_event_date          date,
end_event_date            date,
action_user               varchar2(100) default user,
action_date_time          date          default sysdate
); 

alter table booking_schedule
add constraint booking_schedule_booking_schedule_id_pk primary key(booking_schedule_id);

alter table booking_schedule
add constraint booking_schedule_booking_m_id_fk foreign key(booking_m_id)
references booking_m(booking_m_id);

alter table booking_schedule
add constraint booking_schedule_event_id_fk foreign key(event_id)
references event_d(event_id);

alter table booking_schedule
add constraint booking_schedule_venue_id_fk foreign key(venue_id)
references venue(venue_id);

alter table booking_schedule
add constraint booking_schedule_client_id_id_fk foreign key(client_id)
references client(client_id);





--====================
--Receive Mode Table
--====================

drop table Receive_mode cascade constraints ; 

create table Receive_mode
(
Receive_mode_id                     number,
Receive_mode_name                   varchar2(100) constraints Receive_mode_Receive_mode__name_nn not null
                                                  constraints Receive_mode_Receive_mode__name_uk unique, 
Receive_mode_description            varchar2(250), 
action_user                         varchar2(50) default user , 
action_date_time                    date default sysdate
) ; 

alter table Receive_mode 
add constraint Receive_mode_Receive_mode_id_pk primary key (Receive_mode_id ) ; 





--================
--Bill Talbe 
--===============


drop table bill cascade constraint;

create table bill
(
bill_id             number, 
booking_m_id        number,
invoice_number      number  constraint bill_invoice_number_uk unique,
billing_date        date,
payable_amount      number,
discount            number,
net_amount          number,
paid_amount         number  constraint bill_paid_amount_nn not null ,
due_amount          number,
payment_status      varchar2(50),
Receive_mode_id     number,
RETURN_AMOUNT       number,
action_user         varchar2(100)  default user,
action_date_time    date           default sysdate  
) ;



alter table bill
add constraint bill_bill_id_pk primary key(bill_id);

alter table bill
add constraint bill_booking_m_id_fk foreign key(booking_m_id)
references booking_m(booking_m_id);

alter table bill
add   constraint bill_receive_mode_id_fk foreign key (receive_mode_id)
references receive_mode(receive_mode_id) ; 




--====================
--Receive table 
--====================


drop table receive cascade constraint ;

create table receive
(
receive_id           number,
bill_id              number, 
booking_m_id         number,
receive_date         date     constraint receive_receive_nn not null,
Receive_mode_id      number,
amount               number    constraint receive_amount_nn not null ,
recieve_due          number, 
action_user          varchar2(100) default user,
action_date_time     date         default sysdate
) ;


alter table receive
add constraint receive_receive_id_pk primary key(receive_id);


alter table receive
add constraint receive_bill_id_fk foreign key(bill_id)
references bill(bill_id);


alter table receive
add constraint receive_booking_m_id_fk foreign key(booking_m_id)
references booking_m(booking_m_id);


alter table receive
add constraint Receive_Receive_mode_id_fk foreign key(Receive_mode_id)
references Receive_mode(Receive_mode_id) ; 




--===========
--Event_Cost
--===========


drop table Event_cost cascade constraint ;


create table Event_cost
(
cost_id                number,     
cost_name              varchar2(100)  constraint Event_Cost_cost_name_nn not null 
                                      constraint Event_Cost_cost_name_uk unique, 
cost_description       varchar2(250), 
action_user            varchar2s(100)  default user,
action_date_time       date           default sysdate
);

alter table Event_Cost
add constraint Event_Cost_cost_id_pk primary key (cost_id) ;




--================
--Booking_Cost_M
--================

drop table Booking_Cost_M cascade constraint ; 

create table Booking_Cost_M 
(
Booking_Cost_M_id           number, 
BOOKING_M_ID                number, 
Booking_cost_M_date         date   constraint Booking_cost_M_Booking_cost_M_date_nn not null, 
action_user                 varchar2(100)   default user,
action_date_time            date            default sysdate
);

alter table Booking_Cost_M 
add constraint Booking_Cost_M_Booking_Cost_M_id_pk primary key  (Booking_Cost_M_id) ;  


alter table Booking_Cost_M
add constraint Booking_Cost_M_BOOKING_M_ID_fk foreign key (BOOKING_M_ID)
references BOOKING_M(BOOKING_M_ID) ; 


--================
--Booking_Cost_D
--================


drop table booking_cost_d cascade constraint  ; 

create table booking_cost_d 
(
booking_cost_d_id              number, 
booking_cost_m_id              number, 
cost_id                        number, 
amount                         number , 
action_user                    varchar2(100)   default user,
action_date_time               date            default sysdate
);


alter table Booking_cost_d   
add constraint Booking_cost_d_Booking_cost_d_id_pk primary key (Booking_cost_d_id) ; 

alter table Booking_cost_d
add constraint Booking_cost_d_booking_cost_m_id_fk foreign key (booking_cost_m_id)
references booking_cost_m(booking_cost_m_id) ; 

alter table Booking_cost_d
add constraint Booking_cost_d_cost_id_fk foreign key (cost_id)
references Event_cost(cost_id) ; 























