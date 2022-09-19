# **HOME-WORK-03 - CLOUD-BASTION**

- Создаем инстансы ВМ и производим настройки по инструкции.

---
- Получена следующая адресация виртуальных серверов YC:
```
*BASTION*
EXT-IP: 51.250.64.135
INT-IP: 10.128.0.13
```
```
*SOMEINTERNALHOST*
EXT-IP: -
INT-IP: 10.128.0.17
```

---
# Спобосы подключения к SOMEINTERNALHOST в одну команду
- Первый способ подключения к SOMEINTERNALHOST в одну команду:
```
ssh -A EXT-IP-BASTION -t ssh INT-IP-SOMEINTERNALHOST
```
IP адресация указана выше.
В нашем случае (УЗ appuser) команда будет иметь вид:
```
ssh -A appuser@EXT-IP-BASTION -t ssh INT-IP-SOMEINTERNALHOST
```

---
- Второй способ подключения к SOMEINTERNALHOST в одну команду:
```
ssh -J EXT-IP-BASTION INT-IP-SOMEINTERNALHOST
```
IP адресация указана выше.
В нашем случае (УЗ appuser) команда будет иметь вид:
```
ssh -J appuser@EXT-IP-BASTION appuser@INT-IP-SOMEINTERNALHOST
```

---
- Дополнительное задание - создание ALIAS SOMEINTERNALHOST:

ALIAS можно сделать на любой тип подключения, указанный выше. Например:
```
alkolexx@ALKOLEXX-NOTE:~$ echo 'alias someinternalhost="ssh -A appuser@51.250.71.30 -t ssh 10.128.0.17"' >> /home/alkolexx/.bashrc
alkolexx@ALKOLEXX-NOTE:~$ source /home/alkolexx/.bashrc
```
Теперь подключение к SOMEINTERNALHOST происходит следующим способом:
```
alkolexx@ALKOLEXX-NOTE:~$ someinternalhost
```

---
# VPN SERVER - PRITUNL
- Скрипт из инструкции оказался не рабочим на Xenial - отсутствуют пакеты для этой версии, выдавал ошибку.
- Обновил BASTION до версии 20.04.
- Скрипт установки VPN:
```
#!/bin/bash

# ADD REPO
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb http://repo.pritunl.com/stable/apt focal main
EOF

sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list << EOF
deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse
EOF

# ADD KEY
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
curl https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# UPDATE
sudo apt update

# DISABLE FIREWALL
sudo ufw disable

# INSTALL VPN
sudo apt -y install pritunl mongodb-org
sudo systemctl enable mongod pritunl
sudo systemctl start mongod pritunl
```
- Устанавливаем VPN командой: `bash setupvpn.sh`
- Действуем далее по инструкции и проверяем коннект к SOMEINTERNALHOST.
- Данные для подключения (еще раз):
```
bastion_IP = 51.250.64.135
someinternalhost_IP = 10.128.0.17
```
