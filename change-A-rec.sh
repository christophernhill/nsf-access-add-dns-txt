#!/bin/bash
#
# ./change-a-rec.sh ask XXX.XXX.XXX.XXX
#

DOMAIN_NAME=$1
IP_ADDR=$2
ZONEID="Z2DN8655FPJXVO"

# Creates route 53 records based on env name

aws route53 change-resource-record-sets \
  --hosted-zone-id ${ZONEID} \
  --change-batch '
  {
    "Comment": "Add/update A record"
    ,"Changes": [{
      "Action"              : "UPSERT"
      ,"ResourceRecordSet"  : {
        "Name"              : "'${DOMAIN_NAME}'.cyberinfrastructure.org"
        ,"Type"             : "A"
        ,"TTL": 300
        ,"ResourceRecords": [
                {
                    "Value": "\"'${IP_ADDR}'\""
                }
         ]
      }
    }]
  }
  '
