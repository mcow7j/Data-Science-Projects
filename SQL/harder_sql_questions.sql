SELECT CONCAT(NAME,'(',SUBSTRING(OCCUPATION, 1, 1),')') FROM OCCUPATIONS ORDER BY NAME;

SELECT 'There are a total of ', COUNT(OCCUPATION),' ',CONCAT(LOWER(OCCUPATION),'s.')
FROM OCCUPATIONS GROUP BY OCCUPATION ORDER BY COUNT(Occupation), OCCUPATION;

select (salary * months)as EARNINGS ,count(*) from employee group by EARNINGS order by earnings desc limit 1;



SELECT Students.Name, Grades.Grade, Students.Marks FROM Students INNER JOIN Grades ON
Students.Marks BETWEEN Grades.Min_Mark AND Max_Mark WHERE Grades.Grade > 7 ORDER BY Grades.Grade DESC, Students.Name ASC;


SELECT W.id, P.age, W.coins_needed, W.power
FROM WANDS AS W
    INNER JOIN WANDS_PROPERTY AS P ON W.code = P.code
WHERE P.is_evil = 0 AND W.coins_needed =
    (SELECT MIN(coins_needed)
     FROM WANDS AS W1
        INNER JOIN WANDS_PROPERTY AS P1 ON W1.code = P1.code
     WHERE W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC, P.age DESC


SELECT BUYER_ID,SUM(PRICE) FROM HOUSE JOIN PRICE ON HOUSE.HOUSE_ID=PRICE.HOUSE_ID GROUP BY BUYER_ID HAVING SUM(PRICE)>100;

/*
https://www.hackerrank.com/challenges/occupations/problem
*/

set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
) Temp
group by RowNumber;

/*
JOINS MULTPLE TABLES TOGETHER
*/

SELECT Company.company_code,Company.founder, COUNT(DISTINCT(Lead_Manager.lead_manager_code)),
COUNT(DISTINCT(Senior_Manager.Senior_Manager_code)),
COUNT(DISTINCT(Manager.Manager_code)),
COUNT(DISTINCT(Employee.Employee_code))
FROM Company RIGHT JOIN Lead_Manager ON Company.company_code=Lead_Manager.company_code 
RIGHT JOIN Senior_Manager ON Company.company_code=Senior_Manager.company_code 
RIGHT JOIN Manager ON Company.company_code=Manager.company_code
RIGHT JOIN Employee ON Company.company_code=Employee.company_code
GROUP BY company_code,founder ORDER BY  company_code ASC;
