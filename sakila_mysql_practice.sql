
use sakila;

show tables;

select * from language;

select count(*) from film where language_id = 1;

select concat(concat(cs.first_name, ' '), cs.last_name) as '고객명'
	, sum(amount) as '총금액'
from payment pm join customer cs
on pm.customer_id = cs.customer_id
group by 고객명
order by sum(amount) desc; 


-- 고백ID 별 대여 수를 출력(대여 수가 많은 고객부터)
-- select customer_id as '고객ID', CAST(sum(active) AS signed integer) as '대여수'
--      from customer
--      group by customer_id
-- 	 order by '대여수' desc;

select * from rental limit 10;
-- 고백ID 별 대여 수를 출력(대여 수가 많은 고객부터)
select customer_id as '고객ID', count(rental_id) as '대여수'
from rental
group by customer_id
order by count(rental_id) desc;

-- 맞는지 확인 
select count(*) from rental where customer_id = 236;

select * from customer limit 10; 

-- 위 쿼리에서 고객ID 대신 고객의 first_name, last_name을 출력하라
select concat(concat(cus.first_name, ' '), cus.last_name) as '고객이름',
		count(rental_id) as '대여수'
        from rental ren join customer cus
        on ren.customer_id = cus.customer_id
        group by 고객이름
        order by 대여수 desc;
        
-- action 분야 영화의 다음 속성들을 출력하시오
-- 필름번호, 제목, 설명, 분야, 발매년도, 언어
select * from category;
select fi.film_id as 필름번호,
		fi.title as 제목,
		fi.description as 설명,
        ca.name as 분야,
		fi.release_year as 발매년도,
        li.name as 언어
from film fi 
join film_category fca
on fi.film_id = fca.film_id
join category ca 
on fca.category_id = ca.category_id
join language li
on li.language_id = fi.language_id
where ca.name = 'action';

-- 출연작이 많은 순으로 배우의 first_name, last_name 작품수를 출력하시오
select count(*) from actor;
select concat(concat(AC.first_name, ' '), AC.last_name) as '배우이름',
		count(FIAC.actor_id) as '작품수'
        from actor AC
        join film_actor FIAC
        on AC.actor_id = FIAC.actor_id
        group by 배우이름
        order by 작품수 desc;

select count(actor_id) from film_actor
		where actor_id=101;

select * from actor where first_name='SUSAN' and last_name='DAVIS';

-- MARY KEITEL의 출연작을 영화제목 오름차순으로 출력하시오
-- 출력 컬럼은 다음과 같다.
-- first_name, last_name, 영화제목, 출시일, 대여 비용
select rental_rate from film limit 10;
select concat(concat(AC.first_name, ' '), AC.last_name) as '배우이름',
		FI.TITLE as '영화제목',
        FI.release_year as '출시일',
        FI.rental_rate as '대여 비용'
        from film FI
        join film_actor FIAC
        on FI.film_id = FIAC.film_id
        join actor AC
        on FIAC.actor_id = AC.actor_id
        where AC.first_name='MARY' and AC.last_name='KEITEL'
        order by FI.title DESC;

select count(actor_id) from film_actor
		where actor_id=198;

-- 배우의 'R' 등급 영화 작품 수를 카운트하여, 가장 많은 작품수를 가지는 배우부터 출력하시오,
-- 출력 컬럼은 다음과 같다.
-- actor_id, first_name, last_name, 'R'등급 작품수
select * from film limit 10;
select AC.actor_id as '배우번호',
		concat(concat(AC.first_name, ' '), AC.last_name) as '배우이름',
        count(FI.rating) as 'R등급'
        from film FI
        join film_actor FIAC
        on FI.film_id = FIAC.film_id
        join actor AC
        on FIAC.actor_id = AC.actor_id
        where rating='R'
        group by AC.actor_id
        order by R등급 DESC;
        
-- 'R' 등급 영화에 출연한 적이 없는 배우의 first_name, last_name, 출연영화제목을
-- 출시일 순으로 출력하시오
select concat(concat(AC.first_name, ' '), AC.last_name) as '배우이름',
		FI.title as '영화제목',
        FI.release_year as '출시일'
        from film FI
        join film_actor FIAC
        on FI.film_id = FIAC.film_id
        join actor AC
        on FIAC.actor_id = AC.actor_id
        where AC.actor_id NOT IN (select FIAC.actor_id
			from film FI join film_actor FIAC on FI.film_id = FIAC.film_id
            where rating = 'R')
        order by FI.release_year;

-- select AC.first_name, AC.last_name, FL.title, FL.release_year
-- from film FL join film_actor FA on FL.film_id = FA.film_id
-- join actor AC on AC.actor_id = FA.actor_id
-- where AC.actor_id not in (select FA.actor_id
-- 	from film FL join film_actor FA on FL.film_id = FA.film_id
-- 	where rating = 'R')
-- order by FL.release_year;
select count(rating)
        from film
        where rating NOT IN('R');

-- 영화 'AGENT TRUMAN'를 보유하고 있는 매장의 정보를 아래와 같이 출력함.
-- 영화제목, 매장ID, 매장 staff first_name, 매장staff last_name, 매장의 address, address2,
-- districe, city, country, 해당 타이틀 "보유수량"
select FL.title,
		ST.store_id,
        SF.first_name,
        SF.last_name,
        AD.address,
        AD.address2,
        AD.district,
        CT.city,
        CU.country,
        count(FL.title) as "보유수량"
from film FL 
join inventory IV 
on FL.film_id = IV.film_id
join store ST 
on IV.store_id = ST.store_id
join staff SF 
on ST.store_id = SF.store_id
join address AD 
on ST.address_id = AD.address_id
join city CT 
on AD.city_id = CT.city_id
join country CU 
on CT.country_id = CU.country_id
where FL.title = 'AGENT TRUMAN'
group by FL.title, ST.store_id, SF.first_name, SF.last_name,
			AD.address, AD.address2,
            AD.district, CT.city, CU.country;
    
-- 영화 'AGENT TRUMAN'를 보유하고 있는 매장의 정보와 해당 타이틀의.
-- 대여 정보를(대여 정보가 없을 경우에는 관련 컬럼은 null 처리) 아래와 같이 출력함
-- 영화제목, 매장ID, 인벤토리ID, 매장의 address, address2,
-- districe, city, country, 대여 일자, 회수일자, 대여 고객의 first_name, last_name
select FL.title, ST.store_id, IV.inventory_id, AD.address, AD.address2
, AD.district, CT.city, CU.country, RT.rental_date, RT.return_date, CS.first_name, CS.last_name
from film FL join inventory IV on FL.film_id = IV.film_id
join store ST on IV.store_id = ST.store_id
join address AD on ST.address_id = AD.address_id
join city CT on AD.city_id = CT.city_id
join country CU on CT.country_id = CU.country_id
left join rental RT on IV.inventory_id = RT.inventory_id
join customer CS on RT.customer_id = CS.customer_id
where FL.title = 'AGENT TRUMAN'
    

    
