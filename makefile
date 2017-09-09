
name=psql-dk1
image=postgres
name2=pgadmin-dk1
image2=fenglc/pgadmin4
host_dir=$(shell pwd)
vol1=${host_dir}/db
mnt1=/var/lib/postgresql/data
vol2=${host_dir}/shared
mnt2=/shared
vol3=${host_dir}/shared
mnt3=/var/lib/pgadmin4/data/storage/pgadmin4
filel1=${host_dir}/pgadmin4.db
filed1=/var/lib/pgadmin4/data/pgadmin4.db
pl1=5432
pd1=5432
pl2=5050
pd2=5050


create: create-psql create-pgadmin

create-psql:
	[ -d ${vol1} ] || mkdir ${vol1}
	[ -d ${vol2} ] || mkdir ${vol2}
	docker run -d -it --name ${name} -v ${vol1}:${mnt1} -v ${vol2}:${mnt2} -p ${pl1}:${pd1} ${image}

create-pgadmin:
	[ -d ${vol3} ] || mkdir ${vol3}
	[ -f ${filel1} ] || touch ${filel1}
	docker run -d --name ${name2} --link ${name}:db_server -p ${pl2}:${pd2} -v ${vol3}:${mnt3} -v ${filel1}:${filed1} ${image2}

bash:
	docker exec -it ${name} /bin/bash

psql:
	docker exec -it ${name} psql -U postgres


start:
	docker start ${name}
	docker start ${name2}

stop:
	docker stop ${name}
	docker stop ${name2}

delete:
	docker rm ${name}
	docker rm ${name2}





