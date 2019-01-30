echo  "\n\n..... creating device entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "device",
      "attributes": {
        "qualifiedName": "Illumina-iSeq100-1092450@gene_sequencer",
        "owner": "infra-group",
        "name": "Illumina-iSeq100-1092450",
        "deviceId": "1092450",
        "deviceType": "gene_sequencer",
        "deviceModel": "iSeq100",
        "deviceMake": "Illumina",
        "deviceImplemDate": "2018-08-22T09:23:48.000Z",
        "deviceDecomDate": ""
      }
    }
  ]
}'

echo  "\n\n..... creating device entity"
curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "device",
      "attributes": {
        "qualifiedName": "Illumina-iSeq100-1092451@gene_sequencer",
        "owner": "infra-group",
        "name": "Illumina-iSeq100-1092451",
        "deviceId": "1092451",
        "deviceType": "gene_sequencer",
        "deviceModel": "iSeq100",
        "deviceMake": "Illumina",
        "deviceImplemDate": "2018-08-23T09:11:45.000Z",
        "deviceDecomDate": ""
      }
    }
  ]
}'

echo  "\n\n..... creating device entity"
curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "device",
      "attributes": {
        "qualifiedName": "Illumina-iSeq100-1092452@gene_sequencer",
        "owner": "infra-group",
        "name": "Illumina-iSeq100-1092452",
        "deviceId": "1092452",
        "deviceType": "gene_sequencer",
        "deviceModel": "iSeq100",
        "deviceMake": "Illumina",
        "deviceImplemDate": "2018-09-30T14:01:43.000Z",
        "deviceDecomDate": ""
      }
    }
  ]
}'

echo  "\n\n..... creating device entity"
curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "device",
      "attributes": {
        "qualifiedName": "Illumina-iSeq100-1092452@gene_sequencer",
        "owner": "infra-group",
        "name": "Illumina-iSeq200-0000019",
        "deviceId": "0000019",
        "deviceType": "gene_sequencer",
        "deviceModel": "iSeq200",
        "deviceMake": "Illumina",
        "deviceImplemDate": "2019-01-10T16:55:32.000Z",
        "deviceDecomDate": ""
      }
    }
  ]
}'
