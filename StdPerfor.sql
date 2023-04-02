select * from dbo.StudentsPerformance;


--Exploring the DataSet


--unique race/ethnicity
select distinct(s.[race/ethnicity]) from dbo.StudentsPerformance s
order by s.[race/ethnicity];

select distinct(s.[parental level of education]) from dbo.StudentsPerformance s
order by s.[parental level of education];

select distinct(s.[test preparation course]) from dbo.StudentsPerformance s
order by s.[test preparation course];

select distinct(s.lunch) from dbo.StudentsPerformance s
order by s.lunch;


-- How many lunch who is standard & free/reduced

select count(s.lunch) as numOfStand from  dbo.StudentsPerformance s
where s.lunch = 'standard';

select count(s.lunch) from dbo.StudentsPerformance s
where s.lunch = 'free/reduced';

select s.[race/ethnicity],count(*) as countofEachRace
from dbo.StudentsPerformance s
group by s.[race/ethnicity]
order by s.[race/ethnicity];


select * from dbo.StudentsPerformance;
	
-- explore math Score
select avg([math score]) as avr from  dbo.StudentsPerformance s;


select s.[race/ethnicity],
avg([math score]) over(partition by s.[race/ethnicity] order by s.[math score] desc) as ave_Of_math_score_per_race
from  dbo.StudentsPerformance s;

select s.[race/ethnicity],s.[parental level of education],
rank() over(order by s.[math score] desc,s.[race/ethnicity],s.[parental level of education]) as Rank_of_math_score_from_the_highest
from  dbo.StudentsPerformance s;


select s.*,count(*) over(partition by [race/ethnicity]) as CountOfRaceWhoCompletedTestCourse   from  dbo.StudentsPerformance s
where s.[test preparation course] = 'completed' and [race/ethnicity] = 'group E';


select s.*,count(*) over(partition by [race/ethnicity]) as CountOfRaceWhoCompletedTestCourse   from  dbo.StudentsPerformance s
where s.[test preparation course] = 'completed' and [race/ethnicity] = 'group D';


select s.*,count(*) over(partition by [race/ethnicity]) as CountOfRaceWhoCompletedTestCourse   from  dbo.StudentsPerformance s
where s.[test preparation course] = 'completed' and [race/ethnicity] = 'group A';


select s.*,count(*) over(partition by [race/ethnicity]) as CountOfRaceWhoCompletedTestCourse   from  dbo.StudentsPerformance s
where s.[test preparation course] = 'completed' and [race/ethnicity] = 'group A' and gender='female';


select s.*,s.[math score] + s.[reading score]+s.[writing score] as TotalMarks,
(s.[math score] + s.[reading score]+s.[writing score]) / 3 as [percentage] from 
dbo.StudentsPerformance s

alter table dbo.StudentsPerformance 
add TotalMarks numeric ,perc numeric;

select * from dbo.StudentsPerformance;

update dbo.StudentsPerformance 
set dbo.StudentsPerformance .TotalMarks = dbo.StudentsPerformance .[math score] +
dbo.StudentsPerformance .[reading score]+
dbo.StudentsPerformance .[writing score];


update dbo.StudentsPerformance 
set dbo.StudentsPerformance .perc = (dbo.StudentsPerformance .[math score] +
dbo.StudentsPerformance .[reading score]+
dbo.StudentsPerformance .[writing score]) / 3;

create table #temp_table
(
gender varchar(77),
Race varchar(12),
level_of_education varchar(12),
test_course varchar(18),
math_mark numeric,
reading_mark numeric);




-- You Can Do The Same Thing in The Columns #############
