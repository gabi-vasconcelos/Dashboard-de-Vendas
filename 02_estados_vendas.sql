-- (Query 2) Estados que mais venderam
-- Colunas: país, estado, vendas (#)


select
	date_trunc('month', fun.paid_date)::date as "mês",
	'Brazil' as país,
	cus.state as estado,
	count(fun.paid_date) as "vendas (#)"
from sales.funnel as fun
left join sales.customers as cus
	on fun.customer_id = cus.customer_id
where fun.paid_date is not null
group by "mês", país, estado
order by "mês", "vendas (#)" desc