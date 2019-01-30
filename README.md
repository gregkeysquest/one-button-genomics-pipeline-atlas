# one-button-genomics-pipeline-atlas

This repo accompanies the Hortonworks Community article: [Customizing Atlas (Part4): Wrapping up with genomic analytic pipeline and one-button demokit](https://community.hortonworks.com/articles/236889/customizing-atlas-part4-summarizing-with-genomic-a.html)

## Goal of Repo
* Provide easy one command approach to load Apache Atlas on Hortonworks Data Platform (Hadoop) with customized types and entities and complex lineages.
* See article for details.  
* Even if you are not interested in customizing Atlas, this is a great way to create complex lineages in Atlas and explore the powerful Atlas search and lineage capabilities.

## One-step Instructions
1. stand up a HDP 2.6+ or 3x cluster or sandbox and make sure Atlas is running
1. pull this repo to your local machine
1. export the following variables
...export ATLAS_UU_PWD=atlasuser:atlaspassword
...export ATLAS_HOST=atlashostname
1. cd to local repo and run ./~one-step.sh
1. log into Atlas UI and see results (see article reference for details)
  
## Three-step Instructions (to better understand what is going on(
same as above, but instead of step 4. run the following separate commands and see results in Atlas UI after each one)
* ./initialize.sh (creates types and some reused entities)
* ./pipeline-single.sh (creates a single lineage)
* ./pipeline-multi.sh (adds more lineages)



