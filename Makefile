all: run

.PHONY:install
install: nitrokey-test-suite-master
	docker build $@ -t gpg . 

nitrokey-test-suite-master:
	# -rm test-suite.zip -v
	yes | wget -c -O test-suite.zip https://github.com/Nitrokey/nitrokey-test-suite/archive/master.zip
	yes | unzip test-suite.zip

.PHONY: shell
shell:
	bash ./docker-run-command.sh "/bin/bash" $(ARGS)

.PHONY: run
run:
	bash ./docker-run-command.sh "/bin/bash /app/start-within-container.sh" $(ARGS)

install-test:

run-test:


