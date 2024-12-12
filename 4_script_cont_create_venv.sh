PYTHON_ENV_VERSION = "3.11.0"
SETUPTOOLS_VERSION = "58.2.0"
BIOPYTHON_VERSION = "1.79"
HMMER_VENV_VERSION = "0.2.4"

python$PYTHON_ENV_VERSION -m venv /workdir/_venv &&
source /workdir/_venv/bin/activate &&
cd /workdir/ANARCI &&
pip uninstall setuptools &&
pip install setuptools==$SETUPTOOLS_VERSION &&
pip install biopython==$BIOPYTHON_VERSION &&
pip install hmmer==$HMMER_VENV_VERSION
