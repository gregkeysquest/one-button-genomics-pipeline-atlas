FILEPATH=$1
SAMPLE_ID=$2
DEVICE="${3:-Illumina-iSeq100-1092450}"
TECHNICIAN="${4:-Neeraj_Gupta}"
RUN_START_DATE="${5:-2018-06-30T8:25:51.341Z}"
RUN_END__DATE="${6:-2018-06-30T10:14:22.412Z}"


echo  "\n\n..... creating gene_sequence entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "gene_sequence",
      "attributes": {
        "clusterName": "prodCluster",
        "isFile": "true",
        "fileSize": "2793872046",
        "numberOfReplicas": "3",
        "createdBy": "nifi",
        "createTime": "2018-11-12T15:10:03.235Z",
        "qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${FILEPATH}'@prodCluster",
        "owner": "jobscheduler",
        "name": "'${FILEPATH}'",
        "path": "hdfs://prod1.genomicsanalytics.com/'${FILEPATH}'",
        "device": {"uniqueAttributes": {"qualifiedName": "'${DEVICE}'@gene_sequencer"}, "typeName": "device"},
        "deviceQualifiedName": "'${DEVICE}'@gene_sequencer",
        "runSampleId": "'${SAMPLE_ID}'",
        "runReads": "9",
        "runTechnician": "'${TECHNICIAN}'",
        "runStartTime": "'${RUN_START_DATE}'",
        "runEndTime": "'${RUN_END__DATE}'"
      }
    }
  ]
}'
