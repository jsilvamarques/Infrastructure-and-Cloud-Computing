# Atividade 01 - Vagrant
<p> Subir uma máquina virtual com MySQL instalado e que esteja acessível no host da máquina na porta 3306. Enviar a URL GitHub do código. <p>

### Alguns Comandos:

* **vagrant Init**
  <p>Cria o arquivo Vagrantfile<p>
    
* **vagrant Up**
    <p>Cria e inicia a instancia após o comando vagrant init</p>

* **vagrant Status**
    <p>Informa o status atual da instancia</p>

* **vagrant Reload**
    <p>Reinicia a instancia do box ativo</p>

* **vagrant Suspend**
    <p>Stopa a instancia ativa, congelando seu estado atual</p>

* **vagrant Resume**
    <p>Ativa a instancia suspensa, até então, pelo comando vagrant suspend</p>

* **vagrant Halt**
    <p>Manda um comando para desligar a instancia ativa, finalizando todos os processos antes de finalizar</p>

### Acesso mysql disponbilizado com vagrant

* <p>mysql --host=127.0.0.1 --port=3306 -u root -proot</p>