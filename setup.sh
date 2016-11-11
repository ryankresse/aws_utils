#!/bin/bash

# Install our dependencies - replace these libraries with your needs!
sudo pip install pandas

aws s3 cp s3://<path script-name> /home/hadoop/<script-name>

  
