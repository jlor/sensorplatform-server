#!/bin/bash

##
# TODO: Error checking, detection and automation
#

oc login -u system:admin

# Project setup
oc new-project tm234
oc project tm234

# Kafka setup
oc apply -f kafka/install
oc apply -f kafka/templates
oc apply -f kafka/kafka-ephemeral.yaml
oc apply -f kafka/kafka-topics.yaml

# MySQL setup and secret installation
oc apply -f mysql

# Camel K installation
./camel-k/install.sh
