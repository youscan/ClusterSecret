IMG_NAMESPACE = ysregistryzero.azurecr.io
IMG_NAME = clustersecretbase
IMG_FQNAME = $(IMG_NAMESPACE)/$(IMG_NAME)
IMG_VERSION = 0.0.5

.PHONY: container arm-container push arm-push clean clean-arm
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
	
arm-push:
	docker push $(IMG_FQNAME):$(IMG_VERSION)_arm32

clean-arm:
	docker rmi $(IMG_FQNAME):$(IMG_VERSION)_arm32
