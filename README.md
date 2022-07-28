# Relação Leads - Compras



**Contexto:**

Você trabalha em uma empresa do tipo e-commerce que vende produtos para cabelo personalizados. Para personalizar o produto, a empresa solicita que o cliente preencha um formulário onde irá contar sobre a sua rotina e seu cabelo. Após finalizar o preenchimento, o cliente é direcionado automaticamente para o checkout, onde ele irá optar por fechar a compra ou não.
A experiência de venda online é baseada em três etapas:

Preenchimento do formulário
Seleção dos produtos
Fechamento da compra

**Problema:**

A empresa está gastando muito dinheiro com disparos via Whatsapp para pessoas que preenchem o formulário (leads), desta forma seria interessante qualificar quem são os leads que possuem maior probabilidade de efetuar uma compra e assim tornar os disparos mais efetivos.
Você então é convocado para solucionar tal desafio, e portanto deve achar a correlação entre compradores e leads.

**Objetivos:**

- Relacionar compradores e leads
- Criar um algoritmo que dispare Whatsapp somente para potenciais clientes
- Reduzir custo com disparo de Whatsapp

**Metodologia:**

A metodologia utilizada no desenvolvimento desse algoritmo foi:
- Conexão com os dados do banco de dados relacional Postegree
- Limpeza da base de dados de preenchimento do formulário
- Criação da coluna “Target” com todos os campos igual a 1 na tabela de fechamento das compras
- Transformação em quantidade numérica: efeitos_desejados; característica; procedimentos
- Remoção das Features de: ID; locale; utm_source
- Criação de uma nova tabela com os dados da tabela de preenchimento do formulário e a coluna Target da bela de fechamento das compras
- Ligação entre as 3 tabelas
- Criação de um novo Data frame com as seguintes features: sistema_operacional; estado, qtde_lavagem_semana, tipo_cabelo, comprimento, tipo_fios, tempo_procedimento, dieta, atividade_fisica, frequencia_estresse, faixa_etaria, fragancia, dia_semana, num_efeitos_desejados, num_caracteristica, num_procedimentos, target
- Análise dos dados: Distribuição dos dados e plotagem da contagem dos dados de todas as features;
- Divisão dos dados em categóricos e numéricos
- Encoder dos dados categóricos
- Normalização dos dados
- Divisão em treino e teste
- Utilização do Random Forest Classifier para geração do algoritmo
- Utilização das métricas: Acurácia; Precisão; Recall; F1 e AUC para avaliação do modelo
- Visualização das Features que mais impactam no modelo
- Validação Cruzada do modelo
- Salvar o classificador

**Modelo e resultados**

Para o projeto foi utilizado o modelo classificador Random Forest, que é um tipo de classificador Emseble, ou seja, é um modelo projetado para melhorar a estabilidade e precisão do algoritmo. Os classificadores Emseble utilizam a estratégia de “dividir para conquistar”, ou seja, é um tipo de classificador em que aparece mais de um modelo, reduzindo assim o ruído, viés e variância, que são as principais causas de erro.
Além disso alguns hiperparâmetros do modelo foram alterados em busca de melhorias como o n_estimators=75 e max_depth=32, mas ambos ofereceram um resultado abaixo do default.
Portanto, o Classificador Random Forest em seu formato base, apresentou as métricas com os seguintes resultados:
- Acurácia: 91,9%
- Precisão: 87%
- Recall: 91,1%
- F1 Score: 91,3%
- AUC: 95,3%

E uma validação cruzada com 5 folds apresentaram, muito estável, que apresentaram os seguintes resultados:
- 91,98%
- 91,82%
- 92,01%
- 91,84%
- 91,79%

**Análise final**

Analisando o modelo conseguimos tirar bastante insight para que a empresa seja muito mais assertiva no momento que for disparar uma mensagem via Whatsapp. Podemos observar que os potenciais clientes são:
- Pessoas da região Sul, Sudeste;
- Quem lava o cabelo 4 vezes ou mais na semana
- Quem procura bastante efeitos e características nos produtos, ou seja, produto altamente personalizado;
- Quem faz bastante procedimento no cabelo;
- Quem fez o último procedimento recentemente como há 1 ou 2 semanas, porque são clientes com uma alta frequência em procedimento capilar;

Existem outras Features que impactaram no modelo, mas que na minha visão são características mais voltadas para o analytics, ou seja, conhecer bem o que as pessoas compram contigo, como a fragrância preferida das clientes, o tipo de fio do cabelo, a faixa etária e o comprimento. Essas informações são relevantes principalmente para o planejamento estratégico da empresa, seja no momento de comprar matéria prima ou de lançar uma campanha de marketing
