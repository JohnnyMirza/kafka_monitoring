#!/bin/bash

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "aws-cloudwatch-logs-source",
  "config": {
    "connector.class": "io.confluent.connect.aws.cloudwatch.logs.AwsCloudWatchSourceConnector",
    "tasks.max": "1",
    "aws.cloudwatch.logs.url": "https://logs.ap-southeast-2.amazonaws.com",
    "aws.cloudwatch.log.group": "my-log-group",
    "aws.cloudwatch.log.streams": "my-log-stream",
    "name": "aws-cloudwatch-logs-source",
    "confluent.topic.bootstrap.servers": "broker:29092",
    "confluent.topic.replication.factor": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
