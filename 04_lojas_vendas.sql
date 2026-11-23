-- (Query 4) Lojas que mais venderam
-- Colunas: loja, vendas (#)


select
	date_trunc('month', fun.paid_date)::date as "mês",
	sto.store_name as loja,
	count(fun.paid_date) as "vendas (#)"
from sales.funnel as fun
left join sales.stores as sto
	on fun.store_id = sto.store_id
where fun.paid_date is not null
group by "mês", loja
order by "mês", "vendas (#)" desc