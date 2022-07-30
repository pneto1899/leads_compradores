
select * from order_items;

select * from orders;

select * from forms;

alter table orders 
add target integer;

update orders 
set target = 1;


select
	o.target,
	f.estado,
	f.qtde_lavagem_semana,
	f.tipo_cabelo,
	f.comprimento,
	f.tipo_fios,
	f.procedimentos,
	f.tempo_procedimento,
	f.dieta,
	f.atividade_fisica,
	f.frequencia_estresse,
	f.caracteristica,
	f.faixa_etaria,
	f.efeitos_desejados,
	f.fragancia
from
	orders o
inner join order_items oi
	on o.id_pedido = oi.id_pedido
inner join forms f 
	on oi.id_form = f.id_form;