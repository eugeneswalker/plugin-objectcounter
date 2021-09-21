RELEASE?=0.3.1
PLATFORM?=linux/arm64,linux/amd64
IMAGE=objectcounter

all: image

image:
	docker buildx build -t "waggle/plugin-$(IMAGE):$(RELEASE)" --load .

push:
	docker buildx build -t "waggle/plugin-$(IMAGE):$(RELEASE)" --platform "$(PLATFORM)" --push .
