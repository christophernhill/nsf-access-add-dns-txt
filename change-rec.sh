#!/bin/bash
#
# ./change-rec.sh ask google-site-verification=6f4miMg_CCSBrruPDBxZ2nnIZEt7XZgwBMi554rf_lA
#

DOMAIN_NAME=$1
TXT_REC=$2
ZONEID="Z2DN8655FPJXVO"

# Creates route 53 records based on env name

aws route53 change-resource-record-sets \
  --hosted-zone-id ${ZONEID} \
  --change-batch '
  {
    "Comment": "Add/update TXT record"
    ,"Changes": [{
      "Action"              : "UPSERT"
      ,"ResourceRecordSet"  : {
        "Name"              : "'${DOMAIN_NAME}'.cyberinfrastructure.org"
        ,"Type"             : "TXT"
        ,"TTL": 300
        ,"ResourceRecords": [
                {
                    "Value": "\"'${TXT_REC}'\""
                }
         ]
      }
    }]
  }
  '
