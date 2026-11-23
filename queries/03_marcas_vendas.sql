-- (Query 3) Marcas que mais venderam no mês
-- Colunas: marca, vendas (#)

select
	date_trunc('month', fun.paid_date)::date as "mês",
	pro.brand as marca,
	count(fun.paid_date) as "vendas (#)"
from sales.funnel as fun
left join sales.products as pro
	on fun.product_id = pro.product_id
where fun.paid_date is not null
group by "mês", marca
order by "mês", "vendas (#)" desc
