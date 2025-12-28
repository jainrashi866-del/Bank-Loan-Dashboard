Use Bank_Loan

--Bank Loan Queary
--Key Preformation Indicators (KPI’s) Requirement:
--Total Loan Applications
--1. Total Loan Application:
select count(id) as Total_Loan_Application from financial_loan
 
--2. MTD Loan Application:
select count(id) as MTD_Total_Loan_Application from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021
 
--3. PMTD Loan Application:
select count(id) as PMTD_Total_Loan_Application from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021
 
--Total Funded Amount
--4. Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount from financial_loan
 
--5. MTD Funded Amount
select sum(loan_amount) as MTD_Funded_Amount from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021
 
--6. PMTD Funded Amount
select sum(loan_amount) as PMTD_Funded_Amount from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021
 
--Total Amount Received
--7. Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
 
--8. MTD Amount Received
SELECT SUM(total_payment) AS MTD_Amount_Collected FROM financial_loan
Where month(issue_date) = 12 and year(issue_date) = 2021
 
--9. PMTD Amount Received
SELECT SUM(total_payment) AS PMTD_Amount_Collected FROM financial_loan
Where month(issue_date) = 11 and year(issue_date) = 2021
 
--Average Interest Rate
10. Average Interest Rate
select Avg(int_rate) * 100 as Avg_interest_Rate from financial_loan
 
--11. MTD Average Interest Rate
select Avg(int_rate) * 100 as MPT_Avg_interest_Rate from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021
 
--12. PMTD Average Interest Rate
select Avg(int_rate) * 100 as MPT_Avg_interest_Rate from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021
 
--13. Avg. DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan
 
--14. MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021
 
--15. PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11 and year(issue_date) = 2021
 
--GOOD LOAN ISSUED
16. Good Loan Percentage
Select (count(case when loan_status = 'Fully Paid' or loan_status ='Current' then id end) * 100) / count(id) as Good_Loan_Persentage from financial_loan
 
--17. Good Loan Application
select COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 
--18. Good Loan Funded Amount
select SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 
--19. Good Loan Amount Received
select SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
 
--BAD LOAN ISSUED
--20. Bad Loan Percentage
SELECT (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / COUNT(id) AS Bad_Loan_Percentage FROM financial_loan
 
--21. Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'
 
--22. Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'
 
--23. Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'
 
--LOAN STATUS
SELECT loan_status,
COUNT(id) AS LoanCount,
       SUM(total_payment) AS Total_Amount_Received,
       SUM(loan_amount) AS Total_Funded_Amount,
       AVG(int_rate * 100) AS Interest_Rate,
       AVG(dti * 100) AS DTI
FROM financial_loan
GROUP BY loan_status
 
--MONTH
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
 
--STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state
 
--TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term
 
--EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length
 
--PURPOSE
SELECT purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose
 
--HOME OWNERSHIP--
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership
 

