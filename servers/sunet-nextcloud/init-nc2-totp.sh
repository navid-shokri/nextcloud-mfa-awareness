#!/bin/bash
echo Installing ownCloud
php console.php maintenance:install --admin-user "Admin" --admin-pass "!QAZ1qaz" --database "mysql" --database-name "nextcloud" --database-user "nextcloud" --database-pass "userp@ssword" --database-host "sunet-mdb-2"
echo Enabling apps
php console.php app:disable firstrunwizard
php console.php app:install twofactor_totp
php console.php app:enable mfachecker
echo Editing config
sed -i "9 i\    2 => 'sunet-nc1'," config/config.php
sed -i "9 i\    1 => 'mesh.pondersource.org'," config/config.php
sed -i "3 i\  'allow_local_remote_servers' => true," config/config.php
