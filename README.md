<p align="center">
  <img src="https://github.com/fabiocotta/contmatic/blob/main/img/logo_contmatic.png" width="150">  
</p>

<p align="center">
  Controle de pedidos</p>

<br>
<h1>Sobre o Projeto</h1>
<p>Teste desenvolvido como parte de um desafio técnico para vaga de Desenvolvedor na Contmatic, utilizando Delphi CE 12 , com arquitetura MVC e aplicando boas práticas como SOLID, Clean Code e design patterns aplicados.</p>

<br>

<h1>Arquitetura do Projeto (Padrão MVC)</h1>
<ul>
    <li>Views - Formulários (VCL)</li>
    <li>Controllers - Regra de Negócio (lógica de controle)</li>
    <li>Entidades - Validadores (regras de negócio)</li>
    <li>Modal - Repositórios (acesso e persistência)</li>
</ul>

<br>

<h1>Boas Práticas</h1>
<ul>
    <li>SOLID (S) - Cada classe tem uma única responsabilidade.</li>
    <li>Clean Code - Separação clara de resposabilidades por unidades, nomes autoexplicativos e métodos pequenos.</li>
    <li>Design Patterns (S) - Gerenciamento único de conexão com o bando de dados.</li>
    <li>Design Patterns (R) - Lógica de persistência por cada entidade.</li>
    <li>Design Patterns (DTO-like) - Passagem de dados entre camadas.</li>
</ul>

<br>
<h1>Model - MER</h1>
<p>Modelo de entidade relacionamento utlizado usando Mysql Rorkbench 8.0 CE.</p>

<img src=https://github.com/fabiocotta/contmatic/blob/main/img/model.png>

<br> 

<h1>Instruções para Importação do Banco de Dados</h1>

<ul>
    <li>Crie um novo banco no seu SGBD, ex: `contmatic`</li>
    <li>Execute o arquivo `Dump20250815.sql`, na pasta Dump_banco.</li>
    <li>Verifique se as tabelas e dados foram criados corretamente.</li>
    <li>Banco pronto</li>      
</ul>


<br>

<h1>Configuração do Arquivo .ini config.ini</h1>
<p>Arquivo para parametrização da conexão.</p>

```ini
[BD]
DriverID=MySQL
Server=localhost
Database=contmatic
User_Name=root
Password=suasenha
Port=3306
```
<br>

<h1>Considerações Finais</h1>
<p>Este projeto apresenta princípios no desenvolvimento em Delphi, com arquitetura moderna, organizada e técnicas que facilitam a manutenção, escalabilidade e integração com uma API RESTful para comunicação externa</p>
<br>
<p align="center">Feito com ❤️ por fabiocotta</p>