-- TESTING TO SEE IF THERE IS A CHANGE IN THE SQL CODE FOR GITHUB
-- TESTING 1 2 3
-- Testing again 
-- Testing one more time
-- Testing Branch merge
-- Go to Sakila Schema in your MySQL Workbench.
-- With your group (that you were put in today's class), discuss the following 7 questions and solutions. 
-- Let's say your group has student called A, B, and C.
-- Each member in each group is required to verbally discuss and teach one another the following questions.
-- Group discussion will be for 30 minutes.
-- After 30 minutes group will be disbanded. 
-- However, after that 30 minutes, each student from the group will be given questions to answer (individually) based on questions learned.
-- Each student will answer the questions within 20 minutes. Open book/open notes (no internet is allowed).
-- Your grade would depend on  your group members average grade. 
-- In other word, grade received by student A, B, and C will be averaged. 
-- If the average grade is 4 out of 5 points for those three students, those three students will get 4 points added to Midterm. 
-- Thus, it's important to make sure that each student in a group is teaching other students as well so that everyone in that group is getting highest possible score.
-- See below for the questions and their answers.

-- hello jason		

Use sakila;

-- 1. Your professor wants you to find all the information related to the films whose rating is R, has “epic” phrase mentioned in its description, and language is in English.
select * 
from film 
where rating="R" and description like "%epic%" and language_id in (select language_id from language where name="English");

-- 2. What are the film categories where the average difference between the film replacement cost and the rental rate larger than 19?  
select category.name 
from category, film, film_category 
where category.category_id=film_category.category_id and film.film_id=film_category.film_id 
group by category.name 
having avg(film.replacement_cost-film.rental_rate)>17;

-- 3. Is the length (see attribute called length in film table) of English movie longer in average than the other movies? Prove your answer without manually calculating or looking for data (i.e. your answer and all part of it should depend on SQL query.
select language.name, avg(film.length) as avgFilmLength 
from film
Join language on film.language_id =  language.language_id
Group by language.name;

-- 4. Your professor wants you to find the name of the customers whose last name is equal to the first name of another customer. For example, Shirley Allen and Allen Butterfield are two customers – but the last name of one matches the first name of others. Using self-join, show those names. 
Select a.first_name, a.last_name, b.first_name, b.last_name
From customer a
join customer b 
on b.last_name = a.first_name; 

-- 5. Show the names (first and last) of all the actors whose first name is the same as the first name of the actor with ID 8. Please do not repeat Actor ID 8’s name on your output (his name shouldn’t be in your output). Tip: This question can be answered using multiple select clause and is NOT related to self-join.
select first_name, last_name 
from actor 
where first_name in 
(select first_name from actor where actor_id=8) and actor_id not in (8);

-- 6. Find all the film categories in which there are between 55 and 65 films. Return the names of these categories and the number of films per category, sorted by the number of films.
SELECT category.name, count(film_category.category_id) as NumFilm
FROM film_category 
Inner join category
on film_category.category_id = category.category_id
Group by film_category.category_id
Having NumFilm between 55 and 65
Order by NumFilm;

-- 7.	In how many film categories is the average difference between the film replacement cost and the rental rate larger than 17?
Select category.name, avg(replacement_cost) - avg(rental_rate) as AvgDiff
From film_category 
Inner join film
on film.film_id = film_category.film_id
Inner Join category
on category.category_id = film_category.category_id
Group by film_category.category_id
Having avg(replacement_cost) - avg(rental_rate) > 17

