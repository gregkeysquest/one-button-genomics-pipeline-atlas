SAMPLE_ID=$1
REPORT_QN=$2
TIMESTAMP=$3

echo  "\n\n..... creating report entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "report",
      "attributes": {
        "qualifiedName": "'${REPORT_QN}'",
        "owner": "jobscheduler",
        "name": "disease-risk-gen-variance-'${SAMPLE_ID}'",
        "reportName": "genomics disease risk report - sample id '${SAMPLE_ID}'",
        "reportVersion": "1.0",
        "reportFilename": "genomics-disease-'${SAMPLE_ID}'.pdf",
        "reportStorageURL": "s3://genomics-disease/'${SAMPLE_ID}'.pdf",
        "reportStartTime": "'${TIMESTAMP}'",
        "reportEndTime": "'${TIMESTAMP}'"
      }
    }
  ]
}'
