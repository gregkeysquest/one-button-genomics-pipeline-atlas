
GENE_SEQ_PATH=$1
REF_GENOME_PATH=$2
ALIGNMENT_PATH=$3
TIMESTAMP=$4

echo  "\n\n..... creating model 1 entity"

curl -u ${ATLAS_UU_PWD} -ik -H "Content-Type: application/json" -X POST http://${ATLAS_HOST}:21000/api/atlas/v2/entity/bulk -d \
'{
  "entities": [
    {
      "typeName": "model",
      "attributes": {
        "qualifiedName": "Model.alignment-BWA-v1.0@prodCluster_'${TIMESTAMP}'",
        "name": "alignment-BWA-v1.2",
        "inputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${GENE_SEQ_PATH}'@prodCluster"}, "typeName": "gene_sequence"},
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${REF_GENOME_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "outputs": [
          {"uniqueAttributes": {"qualifiedName": "hdfs://prod1.genomicsanalytics.com/'${ALIGNMENT_PATH}'@prodCluster"}, "typeName": "hdfs_path"}],
        "DeployDatetime": "2018-10-22T22:01:41.500Z",
        "DeployHostType": "spark-runtime",
        "DeployHostDetail": "prodCluster",
        "DeployObjSource": "hdfs://prod1.genomeanalytics.com/Model-Deployments/alignment-BWA-v1.0.Deploy",
        "ModelName": "genomics-BWA",
        "ModelOwner": "Srinivas Kumar",
        "ModelOwnerLob": "genomics analytics",
        "ModelDescription": "primary analysis full genomic pipeline",
        "ModelRegistryUrl": "hdfs://prod1.genomeanalytics.com/Model-registry/genome/alignment-BWA-v1.0",
        "ModelVersion": "1.0",
        "ModelType": "Spark BWA",
        "ModelStartTime": "'${TIMESTAMP}'",
        "ModelEndTime": "'${TIMESTAMP}'"
      }
    }
  ]
}'
