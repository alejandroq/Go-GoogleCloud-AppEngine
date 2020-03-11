PROJECT_NAME := github.com/alejandroq/papergirl

.PHONY: start
start:
	go run cmd/main.go

VERSION := v1-test
.PHONY: deploy
deploy:
	gcloud app deploy --version ${VERSION}

.PHONY: stop
stop:
	gcloud app versions stop ${VERSION}

.PHONY: dependencytree
dependencytree:
	godepgraph -o ${PROJECT_NAME} -s ${PROJECT_NAME}/cmd | dot -Tpng -o .github/dependencytree.png