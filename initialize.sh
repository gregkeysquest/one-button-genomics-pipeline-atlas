
# instantiate types
echo  "\n..... creating device(s)"
./types/device.sh
./types/email.sh
./types/gene-sequence.sh
./types/model.sh
./types/report-engine.sh
./types/report.sh

# create device(s)
echo  "\n..... creating device(s)"
./entities/device.sh


# create files reused for all pipeline instances
echo  "\n..... creating reused files"
./entities/hdfs.sh "genomics/primary/reference/GRCh38.ref"
./entities/hdfs.sh "genomics/tertiary/annotations/lifestyle.dat"
