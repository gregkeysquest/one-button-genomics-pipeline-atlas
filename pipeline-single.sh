#!/bin/sh

SAMPLE_ID="GG167923"

function TIMESTAMP
{
  echo $(date +%Y-%m-%dT%H:%M:%S.500Z)
}

# 0 ingest
SEQUENCE_PATH="genomics/data/geneSequences/${SAMPLE_ID}.fastq"

./entities/0_gene-sequence.sh  "${SEQUENCE_PATH}" "${SAMPLE_ID}"

# 1 primary analysis
M1_INa=$SEQUENCE_PATH
M1_INb="genomics/primary/reference/GRCh38.ref"   #instantiated during initialize.sh
M1_OUT="genomics/primary/output/${SAMPLE_ID}.bam"

./entities/hdfs.sh "${M1_OUT}"
./entities/1_model.sh "${M1_INa}" "${M1_INb}" "${M1_OUT}" $(TIMESTAMP)

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
./entities/4b_email.sh "${SAMPLE_ID}" "${EMAIL_QN}" "${REPORT_QN}" $(TIMESTAMP)

R1_IN=$M3_OUT
R1_OUTa=$REPORT_QN
R1_OUTb=$EMAIL_QN

./entities/4c_report-engine.sh "${R1_IN}" "${R1_OUTa}" "${R1_OUTb}" $(TIMESTAMP)
