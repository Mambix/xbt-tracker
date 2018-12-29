echo "Writing config $USER:$PASSWORD@$HOST:$DATABASE"
echo "mysql_host = $HOST" > xbt_tracker.conf
echo "mysql_user = $USER" >> xbt_tracker.conf
echo "mysql_password = $PASSWORD" >> xbt_tracker.conf
echo "mysql_database = $DATABASE" >> xbt_tracker.conf

if [ $DEBUG = "true" ]
  echo "debug = 1" >> xbt_tracker.conf
fi

if [ $LOG_ACCESS = "true" ]
  echo "log_access = 1" >> xbt_tracker.conf
fi

if [ $LOG_ANNOUNCE = "true" ]
  echo "log_announce = 1" >> xbt_tracker.conf
fi

if [ $LOG_SCRAPE = "true" ]
  echo "log_scrape = 1" >> xbt_tracker.conf
fi

echo "Starting tracker..."
./xbt_tracker
