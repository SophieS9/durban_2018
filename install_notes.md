# Install Notes Specific to Durban 2018 Workshop
Software installed (and commands run) specific for the Durban 2018 Workshop.

* Manually installed QIIME2 version 2018.6 as ansible script not working. Followed instructions [here](https://docs.qiime2.org/2018.6/install/native/#install-qiime-2-within-a-conda-environment).
```
wget https://data.qiime2.org/distro/core/qiime2-2018.6-py35-linux-conda.yml
conda env create -n qiime2-2018.6 --file qiime2-2018.6-py35-linux-conda.yml
```
* quant3p installed via python following instructions [here](https://github.com/ctlab/quant3p). Need to be sudo to do this. This also installed macs2 and macs2-stranded as part of the dependency installation. 
```
sudo python setup.py install
```
* STAR downloaded from github [here](https://github.com/alexdobin/STAR) and compiled from source and copied to bin as su master.
```
wget https://github.com/alexdobin/STAR/archive/2.6.0a.tar.gz
tar -xzf 2.6.0a.tar.gz
cd STAR-2.6.0a/source
make STAR
sudo cp ./STAR /usr/local/bin
```

