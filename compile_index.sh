JUPYTER_FOLDER=${1?Must provide first argument as output folder}
BASE_DOCUMENT=${2?Must provide first argument as output folder}
OUTPUT_PATH=${3}

cat $BASE_DOCUMENT > index.md

mkdir -p $JUPYTER_FOLDER
rm $JUPYTER_FOLDER/*.ipynb

mkdir -p $OUTPUT_PATH
rm $OUTPUT_PATH/*.html

cd $JUPYTER_FOLDER
wget "https://raw.githubusercontent.com/alexdiem/data-science-python/main/L2_plotting.ipynb"

cd ..

jupyter nbconvert --to html --output-dir $OUTPUT_PATH/ $JUPYTER_FOLDER/*.ipynb
echo -e "\n" >> index.md
for notebook in $OUTPUT_PATH/*.html

do
  echo "https://tomasle.github.io/present-myself-site/$notebook" | tee -a index.md
  echo -e "\n" >> index.md
done
