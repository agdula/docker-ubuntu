NAME = ubuntu-dev
VERSION = 0.2.2
REPO = agdula

all: release

build:
	docker build -t $(REPO)/$(NAME):$(VERSION) .

release: build
	docker push $(REPO)/$(NAME):$(VERSION)