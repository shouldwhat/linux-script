#
# replace to your service directory. (/home/minio -> your directory)
#

docker run -d -p 9000:9000 \
	-v /home/minio:/data \
	-e MINIO_USERNAME=minio \
	-e MINIO_GROUPNAME=minio \
	-e MINIO_ACCESS_KEY=wkkim \
	-e MINIO_SECRET_KEY=wkkim \
	--name minio \
	--restart=always \
	minio/minio server /data
