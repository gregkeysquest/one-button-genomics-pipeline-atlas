echo  "\n\n..... creating gene_sequence type"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/types/typedefs -d \
'{
  "enumDefs": [],
  "structDefs": [],
  "classificationDefs": [],
  "entityDefs": [
     {
      "superTypes": ["hdfs_path"],
      "name": "gene_sequence",
      "typeVersion": "1.0",
      "attributeDefs": [
         {
         "name": "qualifiedName",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": true,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "owner",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "name",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": true,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "device",
         "typeName": "device",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceQualifiedName",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "runSampleId",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "runReads",
         "typeName": "int",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "runStartTime",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "runEndTime",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "runTechnician",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         }
     ]
     }
  ]
}'
