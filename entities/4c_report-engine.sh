RISK=$1
REPORT_QN=$2
EMAIL_QN=$3
TIMESTAMP=$4

echo  "\n\n..... creating report-engine entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "report_engine",
      "attributes": {
        "qualifiedName": "reportProcessor-v1.0@'${TIMESTAMP}'",
        "name": "report-disease-risk-v1.0",
        "inputs": [{"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${RISK}'@prodCluster"}, "typeName": "hdfs_path"}],
        "outputs": [
            {"uniqueAttributes": {"qualifiedName": "'${REPORT_QN}'"}, "typeName": "report"},
            {"uniqueAttributes": {"qualifiedName": "'${EMAIL_QN}'"}, "typeName": "email"}
            ],
        "reportGenRegistryUrl": "https://git@github.com/reportengines/genomics/predictive-general",
        "reportGenVersion": "1.0",
        "reportGenType": "variant-disease-risk",
        "reportGenHost": "reportserver.genomiccompany.com"
      }
    }
  ]
}'
