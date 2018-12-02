user=chromamaster
repository=dokuwiki_arm32v7
tag=latest
docker build --no-cache -t ${user}/${repository}:${tag} .
