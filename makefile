
name=pgsql-dk1
image=postgres
host_dir=$(shell pwd)
vol1=${host_dir}/db
mnt1=/var/lib/postgresql/data
vol2=${host_dir}/shared
mnt2=/shared
pl1=5432
pd1=5432



create:
	docker run -d -it --name ${name} -v ${vol1}:${mnt1} -v ${vol2}:${mnt2} -p ${pl1}:${pd1} ${image}

bash:
	docker exec -it ${name} /bin/bash

psql:
	docker exec -it ${name} psql -U postgres


stop:
	docker stop ${name}

start:
	docker start ${name}

delete:
	docker rm ${name}





