echo  "\n\n..... creating report-engine type"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/types/typedefs -d \
'{
  "enumDefs": [],
  "structDefs": [],
  "classificationDefs": [],
  "entityDefs": [
     {
      "superTypes": ["Process"],
      "name": "report_engine",
      "typeVersion": "1.0",
      "attributeDefs": [
         {
         "name": "qualifiedName",
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
         "name": "reportGenRegistryUrl",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "reportGenVersion",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "reportGenType",
         "typeName": "string",
         "cardinality": "SINGLE",
         "isUnique": false,
         "isOptional": false,
         "isIndexable": true
         },
         {
         "name": "reportGenHost",
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
