
#!/bin/sh

# instantiate types (one-time operation)
./initialize.sh

# create one pipeline (lineage)
./pipeline-single.sh

# create 5 pipelines (lineages)
./pipeline-multi.sh
