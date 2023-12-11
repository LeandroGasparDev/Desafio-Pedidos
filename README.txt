# Sistema de Controle de Pedidos 

# Desenvolvido em Delphi 11.3 - Alexandria

## Descrição

O Sistema de Controle de Pedidos é uma aplicação Delphi desenvolvida para gerenciar pedidos, proporcionando funcionalidades como inserção, edição, exclusão e simulação de vendas. 
Os dados são armazenados em arquivos XML utilizando o componente TClientDataSet.

## Funcionalidades

1. **Novo Pedido:**
   - Permite lançar um novo pedido.
   - O número do pedido é gerado automaticamente de forma sequencial.

2. **Editar Pedido:**
   - Permite editar um pedido já cadastrado.
   - Ao pressionar "Editar", a tela do Novo Pedido é carregada com os dados do pedido selecionado na tela de consulta.

3. **Excluir Pedido:**
   - Permite excluir um pedido selecionado no Grid.

4. **Simular Venda:**
   - Simula a venda com base nas condições de pagamento e exibe os resultados em um memo.
   - A impressão da venda mostra a condição de pagamento com desconto, mas os valores originais são mantidos gravados.

5. **Condição de Pagamento:**
   - Permite selecionar a condição de pagamento.
   - % de Desconto: Utilizado apenas se a condição de pagamento informada for "(Informar %)".

6. **Gravação de Dados:**
   - Os dados são gravados em arquivos XML: Pedidos.xml (dados do pedido) e Itens"NUMERO_PEDIDO".xml (dados dos itens dos pedidos).
   - Utiliza o componente TClientDataSet para manipulação dos dados.

## Instruções de Uso

1. **Novo Pedido:**
   - Pressione o botão "Novo" para lançar um novo pedido.
   - O número do pedido é gerado automaticamente.
   - É possível buscar um cliente de forma automática pelo CNPJ, utilizando o botão "Buscar por CNPJ" assim o sistema fará uma requisição HTTP/REST na API da receita, e se o CNPJ informado for localizado, retornará com as informações.

2. **Editar Pedido:**
   - Selecione um pedido na tela de consulta.
   - Pressione o botão "Editar" para modificar o pedido existente.

3. **Excluir Pedido:**
   - Selecione um pedido na tela de consulta.
   - Pressione o botão "Excluir" para remover o pedido e todos os seus itens.

3.1**Excluir Todos Pedidos:**
   - Clique com botão direito do mouse em cima do botão Excluir, irá exibir uma opção para excluir TODOS os pedidos, onde cabe uma confirmação e digitar o texto EXCLUIR para confirmar a operação

4. **Simular Venda:**
   - Selecione a condição de pagamento desejada.
   - Pressione o botão "Simular Venda" para visualizar a simulação no memo.

5. **Condição de Pagamento:**
   - Escolha a condição de pagamento desejada
   - Se selecionado "(Informar %)", utilize o campo % para aplicar desconto/Acréscimo.

6. **Gravar Pedido:**
   - Após inserir ou editar um pedido, pressione o botão "Gravar Pedido" para salvar e retornar à tela de consulta.

7. **Cancelar Pedido:**
   - Para cancelar um pedido em andamento, pressione o botão "Cancelar Pedido".
   
   

## Gravação de Dados

- Os dados do pedido são armazenados em Pedidos.xml.
- Os dados dos itens dos pedidos são armazenados em Itens"NUM_PEDIDO".xml.

## Observações

- Este README é um guia básico. 

## Autor
- [Leandro B. Gaspar]
  
## Data/Local de Criação
- [10/12/2023 / Piraju-SP]

## Link do projeto no Github
https://github.com/LeandroGasparDev/DesafioProg

Leandro B. Gaspar | Programador Delphi Sênior
Telefone/WhatsApp:  (014) 99790-6406
E-mail: leandrogaspar2012@gmail.com
GitHub: LeandroGasparDev
Linkedin: https://www.linkedin.com/in/leandro-gaspar-3306abb4/

