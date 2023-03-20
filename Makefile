maintainer:=azizur
image:=node-aws-cli
tag:=latest

build:
	docker build --compress -t ${maintainer}/${image}:${tag} .

clean:
	docker image rm ${maintainer}/${image}:${tag}

build-no-cache:
	docker build --no-cache --compress -t ${maintainer}/${image}:${tag} .

shell:
	docker run --name ${image} -it --rm ${maintainer}/${image}:${tag}

push: clean build
	docker push ${maintainer}/${image}:${tag}
