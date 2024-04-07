.PHONY: shell
.PHONY: clean
	
TOOLCHAIN_NAME=trimui-smart-pro-toolchain
WORKSPACE_DIR := $(shell pwd)/workspace
TOOL=
DOCKER := $(shell command -v docker 2> /dev/null)
PODMAN := $(shell command -v podman 2> /dev/null)

.check:
ifdef DOCKER
    TOOL=docker
else ifdef PODMAN
    TOOL=podman
else
    $(error "Docker or Podman must be installed!")
endif

.build: .check Dockerfile
	mkdir -p ./workspace
	$(TOOL) build -t $(TOOLCHAIN_NAME) .
	touch .build

# additional slash at beginning is a hack to work in Windows + Git Bash
shell: .check .build
ifdef PODMAN
	$(TOOL) run -it --rm -v /"$(WORKSPACE_DIR)":/root/workspace:z $(TOOLCHAIN_NAME) bash
else
	$(TOOL) run -it --rm -v /"$(WORKSPACE_DIR)":/root/workspace $(TOOLCHAIN_NAME) bash
endif

clean: .check
	$(TOOL) rmi $(TOOLCHAIN_NAME)
	rm -f .build