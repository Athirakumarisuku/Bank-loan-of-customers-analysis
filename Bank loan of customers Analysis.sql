### Year wise loan amount Stats ###

select year(issue_d) as year, sum(loan_amnt) as total_loan_amnt
from finance_1
group by year(issue_d)
order by year;

/*-------------------------------------------------------------------------*/

### Grade and Subgrade wise Revol Balance ####

select f1.grade, f1.sub_grade, sum(f2.revol_bal) as total_revol_bal
from finance_1 f1
join finance_2 f2
on f1.id = f2.id
group by f1.grade, f1.sub_grade
order by f1.grade, f1.sub_grade;

/*-------------------------------------------------------------------------*/

### Total Payment for Verified Status Vs Total Payment for Non Verified Status ###

select f1.verification_status, floor(sum(f2.total_pymnt)) as total_payment
from finance_1 f1
join finance_2 f2
on f1.id=f2.id
group by f1.verification_status
order by f1.verification_status;

/*-------------------------------------------------------------------------*/

### State wise and month wise loan status ###

select addr_state, month(issue_d), loan_status, count(*) as total_count
from finance_1
group by addr_state, month(issue_d),loan_status
order by addr_state, month(issue_d), loan_status;

/*-----------------------------------------------------------------------------------*/

### Home ownership Vs last payment date stats ###

select f1.home_ownership,f2.last_pymnt_d,count(*) as total_count
from finance_1 f1
join finance_2 f2
on f1.id=f2.id
group by f1.home_ownership,f2.last_pymnt_d
order by f1.home_ownership,f2.last_pymnt_d;

