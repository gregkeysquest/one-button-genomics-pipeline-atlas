SAMPLE_ID=$1
EMAIL_QN=$2
REPORT_QN=$3
TIMESTAMP=$4
EMAIL_TO=${5:-"DrKasinsky@thehospital.com"}

echo  "\n\n..... creating email entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "email",
      "attributes": {
        "qualifiedName": "'${EMAIL_QN}'",
        "owner": "jobscheduler",
        "name": "genDisRiskReport '${SAMPLE_ID}'",
        "emailTo": "'${EMAIL_TO}'",
        "emailFrom": "us@genomicsanalytics.com",
        "emailCc": "archives@thehospital.com",
        "emailBcc": "",
        "emailSubject": "genomics disease risk report - sequence id '${SAMPLE_ID}'",
        "emailAttachments": [{"uniqueAttributes": {"qualifiedName": "'${REPORT_QN}'"}, "typeName": "report"}],
        "emailDate": "'${TIMESTAMP}'"
      }
    }
  ]
}'
