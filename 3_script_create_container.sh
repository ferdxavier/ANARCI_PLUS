docker build . -t spack-image &&
docker run -it --name spack -v ./ANARCI:/workdir/ANARCI -v ./spack:/usr/spack spack-image