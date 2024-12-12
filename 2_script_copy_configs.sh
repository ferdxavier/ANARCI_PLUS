cp -r ./config/setup.py ./ANARCI/ && 
cp -r ./config/RUN_pipeline.sh ./ANARCI/build_pipeline/ &&
cp -r ./config/package.py ./ANARCI/

rm -rf ANARCI/.git
git -C ANARCI/ init
git -C ANARCI/ add .
git -C ANARCI/ commit -m "Create new ANARCI repo"