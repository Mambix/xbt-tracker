echo "Writing config $USER:$PASSWORD@$HOST:$DATABASE"
echo "mysql_host = $HOST" > xbt_tracker.conf
echo "mysql_user = $USER" >> xbt_tracker.conf
echo "mysql_password = $PASSWORD" >> xbt_tracker.conf
echo "mysql_database = $DATABASE" >> xbt_tracker.conf

echo "Starting tracker..."
./xbt_tracker
