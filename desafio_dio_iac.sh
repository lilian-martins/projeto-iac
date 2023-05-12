#!/bin/bash


echo "Criação de diretórios"
mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criação dos grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criação dos usuários e associação aos grupos"
useradd carlos -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM

useradd debora -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN

useradd josefina -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC

echo "Atribuição de permissões nos diretórios"
chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Atribuição de propriedade dos diretórios ao usuário root"
chown root:root /publico
chown root:root /adm
chown root:root /ven
chown root:root /sec

echo "Atribuição de permissões de acesso aos usuários dos grupos"
chgrp GRP_ADM /publico /adm
chmod g+rwx /publico /adm
chgrp GRP_VEN /publico /ven
chmod g+rwx /publico /ven
chgrp GRP_SEC /publico /sec
chmod g+rwx /publico /sec

echo "Restrição de permissões de acesso aos diretórios de outros grupos"
chmod o-rwx /adm /ven /sec

echo "Scritp finalizado"

