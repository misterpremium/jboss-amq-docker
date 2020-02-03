#!/bin/bash
echo "Inicio De Script"
cp /tmp/src/conf/* /opt/amq/conf/
chown jboss:root /opt/amq/conf/*
#/opt/amq/bin/activemq start
/opt/amq/bin/activemq console
