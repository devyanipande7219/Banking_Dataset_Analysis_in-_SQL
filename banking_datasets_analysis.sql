create database mybankdb;
use mybankdb;

select *from customers;
select *from accounts;
select *from transactions;
select *from loans;
select *from CreditCards;
select *from branches;
select *from atms;

-- calculate total number of customers
select count(*) as totalcustomers from customers;

-- calculate total number of accounts
select count(*) as totalaccounts from accounts;

-- calculate total loan amount
select sum(amount) as TotalLoansAmount from loans;

-- calculate total credit limit across all credit cards
select sum(creditlimit) as TotalCreditLimit from creditcards;

-- find all active accounts
select *from accounts 
where status = 'Active';

-- find all accounts made on 15th jan 2023
select *from transactions 
where transactionDate > '2023-01-15';

-- find loans with interest rates above 5.0
select *from loans 
where interestRate > 5.0;

-- find credit with balances exceeding the credit limit
select *from creditcards 
where balance > creditlimit;

-- retrive customer details along with their accounts
select c.customerid,c.name,c.age,a.accountnumber,a.accounttype,a.balance
from customers c
join accounts a on c.customerid = a.customerid;

-- retrive transaction details along with associated account and customer information
select t.transactionID,t.transactionDate,t.Amount,t.Type,t.Description,
a.AccountNumber,a.AccountType,c.Name as cutomerName
from Transactions t 
join accounts a on t.AccountNumber = a.AccountNumber
join customers c on a.CustomerId = c.CustomerId;

-- top 10 Customers with hughest loan amount
select c.Name,l.Amount as LoanAmount
from Customers c
join Loans l on c.customerID = l.customerID
order by l.amount desc
limit 10 ;

-- delete inactive accounts
set sql_safe_updates = 0;
delete from accounts
where status = 'inactive';

-- find customers with multiple accounts
select c.customerID,c.Name, count( a.AccountNumber) as NumAccounts
from customers c
join Accounts a on c.CustomerID = a.CustomerID
group by c.customerID,c.Name
having count(a.AccountNumber) >1;

-- print the first 3 characters of name from customers table
select substring(Name ,1,3) as firstthreecustomersofname
from customers;

-- print the name from customers table  into two columns firstname and lastname
select 
substring_index(Name, ' ',1) as FirstName,
substring_index(Name,' ',-1) as lastName
from customers;

-- sql query to show only odd rows from customers table 
select *from customers
where mod(CustomerID,2) <> 2;


