#Create and activate a new environment: conda create -n easySFS & conda activate easySFS
#Install dependencies: conda install -c conda-forge numpy pandas scipy -y
#Clone this repo: git clone https://github.com/isaacovercast/easySFS.git
#cd easySFS
#chmod 777 easySFS.py
#./easySFS.py


./easySFS.py -i autosome.recode.vcf -p group.txt -a -f --preview > preview.txt


./easySFS.py -i autosome.recode.vcf -p group.txt -a -f -o result --proj 12,12,12,12



