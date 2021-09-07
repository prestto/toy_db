# Toy DB

Toy db spins up an empty postgres database to play with.

This is mighty useful when you're starting a new project and need to test a simple DB schema.

## TLDR

To launch the database and pg admin:

```bash
# run the database
./run.sh up
```

To connect to pgadmin:

```bash
xdg-open http://localhost:19000/
```

Username: admin@admin.com
Password: admin

Select DB Group `Local`, then enter `pgpassword` when prompted

## DB Connection

To connect to the db with a script or other db interface:

```
User: pguser
Pass: pgpassword
Port: 15432
host: postgres
```
