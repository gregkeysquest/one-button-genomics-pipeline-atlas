#!/bin/sh

SAMPLE_IDS=("AA261922" "GC969989" "MP773747" "RB861188" "YZ443344")
DEVICES=("Illumina-iSeq100-1092450" "Illumina-iSeq100-1092451" "Illumina-iSeq200-0000019" "Illumina-iSeq100-1092450" "Illumina-iSeq100-1092452")
TECHNICIANS=("Alexa_Smith" "Neeraj_Gupta" "Alexa_Smith" "Wenwan_Jiao" "Wenwan_Jiao")
RUN_START_DATES=("2018-06-31T12:01:41.500Z" "2018-07-01T09:11:01.222Z" "2018-07-03T09:55:34.521Z" "2018-07-03T10:59:01.401Z" "2018-07-12T17:31:51.013Z")
RUN_END_DATES=("2018-06-31T14:14:02.001Z" "2018-07-01T11:45:22.551Z" "2018-07-03T12:06:55.423Z" "2018-07-03T13:01:11.112Z" "2018-07-12T19:15:11.451Z")
M3_VERSIONS=("1.0" "1.1" "1.1" "1.1" "1.2")
M3_DEPLOY_DATES=("2018-03-31T22:01:41.500Z" "2018-10-22T22:01:41.500Z" "2018-10-22T22:01:41.500Z" "2018-10-22T22:01:41.500Z" "2018-12-04T11:41:52.500Z")
EMAIL_TOS=("DrSmith@thehospital.com" "DrGupta@theclinic.com" "DrLi@thehospital.com" "DrSmith@thehospital.com" "DrSmith@thehospital.com")

function TIMESTAMP
{
  echo $(date +%Y-%m-%dT%H:%M:%S.500Z)
}


for i in {0..4}
do
  SAMPLE_ID=${SAMPLE_IDS[$i]}
  DEVICE=${DEVICES[$i]}
  TECHNICIAN=${TECHNICIANS[$i]}
  RUN_START_DATE=${RUN_START_DATES[$i]}
  RUN_END_DATE=${RUN_END_DATES[$i]}
  M3_VERSION=${M3_VERSIONS[$i]}
  M3_DEPLOY_DATE=${M3_DEPLOY_DATES[$i]}
  EMAIL_TO=${EMAIL_TOS[$i]}

  # 0 ingest
  SEQUENCE_PATH="genomics/data/geneSequences/${SAMPLE_ID}.fastq"

  ./entities/0_gene-sequence.sh  "${SEQUENCE_PATH}" "${SAMPLE_ID}" "${DEVICE}" "${TECHNICIAN}" "${RUN_START_DATE}" "${RUN_END_DATE}"

  # 1 primary analysis
  M1_INa=$SEQUENCE_PATH
  M1_INb="genomics/primary/reference/GRCh38.ref"   #instantiated during initialize.sh
  M1_OUT="genomics/primary/output/${SAMPLE_ID}.bam"

  ./entities/hdfs.sh "${M1_OUT}"
  ./entities/1_model.sh "${M1_INa}" "${M1_INb}" "${M1_OUT}" $(TIMESTAMP)  "${M3_VERSION}"  "${M3_DEPLOY_DATE}"

  # 2 secondary analysis
  M2_IN=$M1_OUT
  M2_OUT="genomics/secondary/output/${SAMPLE_ID}.vcf"

  ./entities/hdfs.sh "${M2_OUT}"
  ./entities/2_model.sh "${M2_IN}" "${M2_OUT}" $(TIMESTAMP)


  # 3 tertiary analysis
  M3_INa=$M2_OUT
  M3_INb="genomics/tertiary/annotations/lifestyle.dat"  #instantiated during initialize.sh
  M3_OUT="genomics/tertiary/output/${SAMPLE_ID}.csv"

  ./entities/hdfs.sh "${M3_OUT}"
  ./entities/3_model.sh "${M3_INa}"  "${M3_INb}" "${M3_OUT}" $(TIMESTAMP)


  # 4 run report
  REPORT_QN="disease-risk-gen-variance@${SAMPLE_ID}.pdf"
  EMAIL_QN="drsmith@thehospital.com@${SAMPLE_ID}"

  ./entities/4a_report.sh "${SAMPLE_ID}" "${REPORT_QN}" $(TIMESTAMP)
  ./entities/4b_email.sh "${SAMPLE_ID}" "${EMAIL_QN}" "${REPORT_QN}" $(TIMESTAMP)  "${EMAIL_TO}"

  R1_IN=$M3_OUT
  R1_OUTa=$REPORT_QN
  R1_OUTb=$EMAIL_QN

  ./entities/4c_report-engine.sh "${R1_IN}" "${R1_OUTa}" "${R1_OUTb}" $(TIMESTAMP)

done
