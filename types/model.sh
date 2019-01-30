echo  "\n\n..... creating model type"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/types/typedefs -d \
'{
  "enumDefs": [],
  "structDefs": [],
  "classificationDefs": [],
  "entityDefs": [
     {
      "superTypes": ["Process"],
      "name": "model",
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
         "name": "name",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
          "name": "inputs",
          "typeName": "array<DataSet>",
          "isOptional": true,
          "cardinality": "SET",
          "valuesMinCount": 0,
          "valuesMaxCount": 2147483647,
          "isUnique": false,
          "isIndexable": false,
          "includeInNotification": false
         },
         {
          "name": "outputs",
          "typeName": "array<DataSet>",
          "isOptional": true,
          "cardinality": "SET",
          "valuesMinCount": 0,
          "valuesMaxCount": 2147483647,
          "isUnique": false,
          "isIndexable": false,
          "includeInNotification": false
         },
         {
         "name": "DeployDatetime",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "DeployHostType",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "DeployHostDetail",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "DeployObjSource",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelName",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelVersion",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelType",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelDescription",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelOwner",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelOwnerLob",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelStartTime",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelEndTime",
         "typeName": "date",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "ModelRegistryUrl",
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
