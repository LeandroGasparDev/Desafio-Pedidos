# Sistema de Controle de Pedidos 

# Desenvolvido em Delphi 11.3 - Alexandria

## Descri��o

O Sistema de Controle de Pedidos � uma aplica��o Delphi desenvolvida para gerenciar pedidos, proporcionando funcionalidades como inser��o, edi��o, exclus�o e simula��o de vendas. 
Os dados s�o armazenados em arquivos XML utilizando o componente TClientDataSet.

## Funcionalidades

1. **Novo Pedido:**
   - Permite lan�ar um novo pedido.
   - O n�mero do pedido � gerado automaticamente de forma sequencial.

2. **Editar Pedido:**
   - Permite editar um pedido j� cadastrado.
   - Ao pressionar "Editar", a tela do Novo Pedido � carregada com os dados do pedido selecionado na tela de consulta.

3. **Excluir Pedido:**
   - Permite excluir um pedido selecionado no Grid.

4. **Simular Venda:**
   - Simula a venda com base nas condi��es de pagamento e exibe os resultados em um memo.
   - A impress�o da venda mostra a condi��o de pagamento com desconto, mas os valores originais s�o mantidos gravados.

5. **Condi��o de Pagamento:**
   - Permite selecionar a condi��o de pagamento.
   - % de Desconto: Utilizado apenas se a condi��o de pagamento informada for "(Informar %)".

6. **Grava��o de Dados:**
   - Os dados s�o gravados em arquivos XML: Pedidos.xml (dados do pedido) e Itens"NUMERO_PEDIDO".xml (dados dos itens dos pedidos).
   - Utiliza o componente TClientDataSet para manipula��o dos dados.

## Instru��es de Uso

1. **Novo Pedido:**
   - Pressione o bot�o "Novo" para lan�ar um novo pedido.
   - O n�mero do pedido � gerado automaticamente.
   - � poss�vel buscar um cliente de forma autom�tica pelo CNPJ, utilizando o bot�o "Buscar por CNPJ" assim o sistema far� uma requisi��o HTTP/REST na API da receita, e se o CNPJ informado for localizado, retornar� com as informa��es.

2. **Editar Pedido:**
   - Selecione um pedido na tela de consulta.
   - Pressione o bot�o "Editar" para modificar o pedido existente.

3. **Excluir Pedido:**
   - Selecione um pedido na tela de consulta.
   - Pressione o bot�o "Excluir" para remover o pedido e todos os seus itens.

3.1**Excluir Todos Pedidos:**
   - Clique com bot�o direito do mouse em cima do bot�o Excluir, ir� exibir uma op��o para excluir TODOS os pedidos, onde cabe uma confirma��o e digitar o texto EXCLUIR para confirmar a opera��o

4. **Simular Venda:**
   - Selecione a condi��o de pagamento desejada.
   - Pressione o bot�o "Simular Venda" para visualizar a simula��o no memo.

5. **Condi��o de Pagamento:**
   - Escolha a condi��o de pagamento desejada
   - Se selecionado "(Informar %)", utilize o campo % para aplicar desconto/Acr�scimo.

6. **Gravar Pedido:**
   - Ap�s inserir ou editar um pedido, pressione o bot�o "Gravar Pedido" para salvar e retornar � tela de consulta.

7. **Cancelar Pedido:**
   - Para cancelar um pedido em andamento, pressione o bot�o "Cancelar Pedido".
   
   

## Grava��o de Dados

- Os dados do pedido s�o armazenados em Pedidos.xml.
- Os dados dos itens dos pedidos s�o armazenados em Itens"NUM_PEDIDO".xml.

## Observa��es

- Este README � um guia b�sico. 

## Autor
- [Leandro B. Gaspar]
  
## Data/Local de Cria��o
- [10/12/2023 / Piraju-SP]

## Link do projeto no Github
https://github.com/LeandroGasparDev/DesafioProg

Leandro B. Gaspar | Programador Delphi S�nior
Telefone/WhatsApp:  (014) 99790-6406
E-mail: leandrogaspar2012@gmail.com
GitHub: LeandroGasparDev
Linkedin: https://www.linkedin.com/in/leandro-gaspar-3306abb4/

