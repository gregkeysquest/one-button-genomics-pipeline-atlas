
VARIANTS_PATH=$1
ANNOTATIONS_PATH=$2
RISKS_PATH=$3
TIMESTAMP=$4
M3_VERSION=${5:-"1.0"}
M3_DEPLOY_DATE=${6:-"2018-03-31T22:01:41.500Z"}



echo  "\n\n..... creating model 3 entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "model",
      "attributes": {
        "qualifiedName": "Model.risks-HAIL-v1.0@prodCluster_'${TIMESTAMP}'",
        "name": "risks-HAIL-v1.0",
        "inputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${VARIANTS_PATH}'@prodCluster"}, "typeName": "hdfs_path"},
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${ANNOTATIONS_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "outputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${RISKS_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "DeployDatetime": "'${M3_DEPLOY_DATE}'",
        "DeployHostType": "spark-runtime",
        "DeployHostDetail": "prodCluster",
        "DeployObjSource": "hdfs://prod1.genomeanalytics.com/Model-Deployments/risks-HAIL-v1.0.deploy",
        "ModelName": "genomics-HAIL",
        "ModelOwner": "Srinivas Kumar",
        "ModelOwnerLob": "genomics analytics",
        "ModelDescription": "tertiary analysis full genomic pipeline",
        "ModelRegistryUrl": "hdfs://prod1.genomeanalytics.com/Model-registry/genome/risks-HAIL-v1.0",
        "ModelVersion": "'${M3_VERSION}'",
        "ModelType": "Spark HAIL",
        "ModelStartTime": "'${TIMESTAMP}'",
        "ModelEndTime": "'${TIMESTAMP}'"
      }
    }
  ]
}'
