#!/bin/bash

# Variables
DB_NAME="etalon"  # Replace with your database name
BACKUP_FILE="/docker-entrypoint-initdb.d/backup.sql"

# Check if the database is empty
if [ -z "$(psql -U $POSTGRES_USER -d $DB_NAME -c "SELECT 1 FROM pg_tables WHERE schemaname = 'public';" -t)" ]; then
    echo "Database is empty. Loading backup..."
    psql -U $POSTGRES_USER -d $DB_NAME -f $BACKUP_FILE
else
    echo "Database is not empty. Skipping backup load."
fi