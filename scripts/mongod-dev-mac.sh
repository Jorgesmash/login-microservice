#!/bin/sh

############################################
#
# Create Mongo Data Home Directory
#
# For convenience, the database will leave on Dropbox.
# DROPBOX_HOME - The Dropbox home directory
# MONGO_DATA_HOME - The directory where the database lives in Dropbox.
#
############################################

DROPBOX_HOME="$HOME/Dropbox" #Comments

MONGO_DATA_HOME="$DROPBOX_HOME/mongodb/data/db"

#If the directory does not exist, create it:
mkdir -p ${MONGO_DATA_HOME}


############################################
#
# Start Mongod daemon
#
# If the daemon is already running does nothing, else start the daemon.
# MONGOD_LOGS - The directory where the mongod logs lives.
############################################

MONGOD_LOGS_DIR="$HOME/logs/mongodb";

#If the directory does not exist, create it:
mkdir -p ${MONGOD_LOGS_DIR}

# First check if the daemon is running, otherwise start it
pgrep mongod || mongod --dbpath ${MONGO_DATA_HOME} --fork --logpath ${MONGOD_LOGS_DIR}/mongod.log