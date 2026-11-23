-- (Query 5) Dias da semana com maior número de visitas ao site
-- Colunas: dia_semana, dia da semana, visitas (#)


select
	date_trunc('month', visit_page_date)::date as "mês",
	extract('dow' from visit_page_date) as dia_semana,
	case 
		when extract('dow' from visit_page_date)=0 then 'domingo'
		when extract('dow' from visit_page_date)=1 then 'segunda'
		when extract('dow' from visit_page_date)=2 then 'terça'
		when extract('dow' from visit_page_date)=3 then 'quarta'
		when extract('dow' from visit_page_date)=4 then 'quinta'
		when extract('dow' from visit_page_date)=5 then 'sexta'
		when extract('dow' from visit_page_date)=6 then 'sábado'
		else null end as "dia da semana",
	count(*) as "visitas (#)"
from sales.funnel
group by "mês", dia_semana
order by "mês", dia_semana
