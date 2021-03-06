set -e 

if [ "$(basename $(pwd))" != "muse" ]
then
  echo "Cannot run this script unless we are in the muse base directory"
  exit 1
fi

ls | grep -v build.sh | while read version
do
  cd ${version} && \
     docker build --force-rm --no-cache -t aarjunrao/muse:${version} - < Dockerfile && \
     cd -
done

