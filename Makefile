IMG_NAMESPACE = ysregistryzero.azurecr.io
IMG_NAME = clustersecret
IMG_FQNAME = $(IMG_NAMESPACE)/$(IMG_NAME)
IMG_VERSION = 0.0.8.1

.PHONY: container push clean arm-container arm-push arm-clean
all: container push
arm: arm-container arm-push
clean: clean arm-clean


container:
	docker build -t $(IMG_FQNAME):$(IMG_VERSION) -t $(IMG_FQNAME):latest .

push: container
	docker push $(IMG_FQNAME):$(IMG_VERSION)
	docker push $(IMG_FQNAME):latest

clean:
	docker rmi $(IMG_FQNAME):$(IMG_VERSION)

arm-container:
	docker build -t $(IMG_FQNAME):$(IMG_VERSION)_arm32 -f Dockerfile.arm .
	
arm-push: arm-container
	docker push $(IMG_FQNAME):$(IMG_VERSION)_arm32

arm-clean:
	docker rmi $(IMG_FQNAME):$(IMG_VERSION)_arm32

beta:
	docker build -t $(IMG_FQNAME):$(IMG_VERSION)-beta .
	docker push $(IMG_FQNAME):$(IMG_VERSION)-beta
