echo  "\n\n..... creating device type"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/types/typedefs -d \
'{
  "enumDefs": [],
  "structDefs": [],
  "classificationDefs": [],
  "entityDefs": [
     {
      "superTypes": ["Infrastructure"],
      "name": "device",
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
         "name": "deviceId",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceType",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceModel",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceMake",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceImplemDate",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "deviceDecomDate",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": true,
         "isIndexable": true
         }
     ]
     }
  ]
}'
