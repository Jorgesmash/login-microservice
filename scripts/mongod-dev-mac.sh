#!/bin/sh

if [ "$1" == "start" ]; then

    ############################################
    #
    # Start Mongod daemon
    #
    # If the daemon is already running does nothing, else start the daemon.
    #
    # DROPBOX_HOME - The Dropbox home directory. For convenience, the database will leave on Dropbox.
    # MONGO_DATA_HOME - The directory where the database lives in Dropbox.
    # MONGOD_LOGS - The directory where the mongod logs lives.
    #
    ############################################

    # Variables declaration
    DROPBOX_HOME="$HOME/Dropbox"
    MONGO_DATA_HOME="$DROPBOX_HOME/mongodb/data/db"
    MONGOD_LOGS_DIR="$HOME/logs/mongodb";

    # If MONGO_DATA_HOME directory does not exist, create it:
    mkdir -p ${MONGO_DATA_HOME}

    # If MONGOD_LOGS_DIR directory does not exist, create it:
    mkdir -p ${MONGOD_LOGS_DIR}

    # First check if the daemon is running, otherwise start it:
    pgrep mongod || mongod --dbpath ${MONGO_DATA_HOME} --fork --logpath ${MONGOD_LOGS_DIR}/mongod.log

elif [ "$1" == "stop" ]; then

    ############################################
    #
    # Shutdown Mongod daemon
    #
    # In order to shutdown the daemon (server), it is needed use admin database
    #
    ############################################

    # Shutdown the daemon (server):
    mongo admin --eval 'db.shutdownServer()' > /dev/null

else

    echo Nothing to do.

fi