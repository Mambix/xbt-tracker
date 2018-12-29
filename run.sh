echo "Writing config $USER:$PASSWORD@$HOST:$DATABASE"
echo "mysql_host = $HOST" > xbt_tracker.conf
echo "mysql_user = $USER" >> xbt_tracker.conf
echo "mysql_password = $PASSWORD" >> xbt_tracker.conf
echo "mysql_database = $DATABASE" >> xbt_tracker.conf

if [ $DEBUG = "true" ]
then
  echo "debug = 1" >> xbt_tracker.conf
fi

if [ $DAEMON = "false" ]
then
  echo "daemon = 0" >> xbt_tracker.conf
fi

if [ $LOG_ACCESS = "true" ]
then
  echo "log_access = 1" >> xbt_tracker.conf
fi

if [ $LOG_ANNOUNCE = "true" ]
then
  echo "log_announce = 1" >> xbt_tracker.conf
fi

if [ $LOG_SCRAPE = "true" ]
then
  echo "log_scrape = 1" >> xbt_tracker.conf
fi

echo "Starting tracker..."
./xbt_tracker
