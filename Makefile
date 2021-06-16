VERSION ?= 0.3.2
DOCKER_PATH := cheungmk/datastore-viewer

.PHONY: login
login:
	docker login --username cheungmk

.PHONY: build
build:
	git submodule init
	git submodule update
	bash -c "cd datastore-viewer/webapp && yarn --prod && yarn build"
	docker build -t ${DOCKER_PATH}:${VERSION} .

.PHONY: push
push: build
	docker tag ${DOCKER_PATH}:${VERSION} ${DOCKER_PATH}:latest
	docker push ${DOCKER_PATH}:${VERSION}
	docker push ${DOCKER_PATH}:latest
