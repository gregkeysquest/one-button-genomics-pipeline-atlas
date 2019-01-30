FILEPATH=$1

echo  "\n\n..... creating hdfs_path entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "hdfs_path",
      "attributes": {
        "clusterName": "prodCluster",
        "isFile": "true",
        "fileSize": "50393444",
        "numberOfReplicas": "3",
        "qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${FILEPATH}'@prodCluster",
        "owner": "jobscheduler",
        "name": "'${FILEPATH}'",
        "createdBy": "hdfs",
        "path": "hdfs://prod.genomicsanalytics.com/'${FILEPATH}'"
      }
    }
  ]
}'
