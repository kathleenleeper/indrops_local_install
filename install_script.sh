# or biocore
#fort testing pipeline
wget ftp://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_28/gencode.v28.annotation.gtf.gz

























# making the environment
module load anaconda
git https://github.com/kathleenleeper/indrops.git #pull from local repo
cd indrops
conda env create -p env -f indrops_pyReqs.txt #make env with the given requirements file
conda activate ./env #activate env!

## installing RSEM by hand to avoid long prefix error (what....an error jfc)
directory="RSEM"
if [[ ! -d "$directory" ]]
then
	git clone https://github.com/deweylab/RSEM.git
	cd RSEM
	make install DESTDIR=../env #install to conda env, if relative path is correct
else
	echo "$directory $if_exists"
fi
## ok let's build a genome i guess
mkdir bowtie_indexes # a storage place for later
cd bowtie_indexes

## MOUSE
# Download the soft-masked, primary assembly Genome Fasta file
wget ftp://ftp.ensembl.org/pub/release-85/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna_sm.primary_assembly.fa.gz

# Download the corresponding GTF file.
wget ftp://ftp.ensembl.org/pub/release-85/gtf/mus_musculus/Mus_musculus.GRCm38.85.gtf.gz

# This command will go through all the steps for creating the index
python indrops.py project.yaml build_index \
    --genome-fasta-gz bowtie_indexes/Mus_musculus.GRCm38.dna_sm.primary_assembly.fa.gz \
    --ensembl-gtf-gz bowtie_indexes/Mus_musculus.GRCm38.85.gtf.gz
'''


Now editing the test yaml file.
'''

python -c """import yaml; import pysam; import pyfasta; import numpy; import matplotlib; print('All packages loaded correctly.')"""
# conda install pip numpy scipy matplotlib pyyaml pyfasta pysam==0.9.1 conda-build
# conda install bowtie samtools=1.3.1
# rsem can't be built with long env. paths, so it fails
# install manually





#installing samtools
# directory='SAMTOOLS_DIR'
# if_exists="already exists, not downloading/installing"
# if [[ ! -d "$directory" ]]
# then
# 	mkdir -pv SAMTOOLS_DIR
# 	cd SAMTOOLS_DIR
# 	wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2
# 	tar xvfj samtools-1.3.1.tar.bz2
# 	cd samtools-1.3.1
# 	make
# 	make prefix=. install
# else
# 	echo "$directory $if_exists"
# fi

# project yaml file should point to SAMTOOLS_DIR/samtools-1.3.1/bin/ as the samtools dir

# installing RSEM

##  installing STAR, seems necessary
# directory="./STAR"
# if [[ ! -d "$directory" ]]
# then
# 	git clone https://github.com/alexdobin/STAR.git
# 	cd STAR/source
# 	make prefix =. STAR
# else
# 	echo "$directory $if_exists"
# fi
# #
# directory='indrops'
# if [[ ! -d "$directory" ]]
# then
# 	git clone https://github.com/indrops/indrops.git
# else
# 	echo "$directory $if_exists"
# fi


# here are some helpful additional notes.
# to download the human genome test ? primary_assembly
'''
$ wget ftp://ftp.ensembl.org/pub/release-85/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
'''
