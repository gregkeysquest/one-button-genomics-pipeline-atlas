
ALIGNMENT_PATH=$1
VARIANTS_PATH=$2
TIMESTAMP=$3

echo  "\n\n..... creating model 2 entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "model",
      "attributes": {
        "qualifiedName": "Model.variant-GATK-v1.0@prodCluster_'${TIMESTAMP}'",
        "name": "variant-GATK-v1.0",
        "inputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${ALIGNMENT_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "outputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${VARIANTS_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "DeployDatetime": "2018-10-22T22:01:41.500Z",
        "DeployHostType": "spark-runtime",
        "DeployHostDetail": "prodCluster",
        "DeployObjSource": "hdfs://prod1.genomeanalytics.com/Model-Deployments/variant-GATK.deploy",
        "ModelName": "genomics-GATK",
        "ModelOwner": "Srinivas Kumar",
        "ModelOwnerLob": "genomics analytics",
        "ModelDescription": "secondary analysis full genomic pipeline",
        "ModelRegistryUrl": "hdfs://prod1.genomeanalytics.com/Model-registry/genome/variant-GATK-v1.0",
        "ModelVersion": "1.0",
        "ModelType": "Spark GATK",
        "ModelStartTime": "'${TIMESTAMP}'",
        "ModelEndTime": "'${TIMESTAMP}'"
      }
    }
  ]
}'
