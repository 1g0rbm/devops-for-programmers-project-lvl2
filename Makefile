prepare-environment: prepare-vault-password install

prepare-vault-password:
	touch vault-password

install:
	ansible-galaxy role install -r requirements.yml
	ansible-galaxy collection install -r requirements.yml

deploy:
	ansible-playbook playbook.yml -i inventory.yml -vv --vault-password-file vault-password

set-vault-password:
	echo "$(PASSWORD)" > vault-password

encrypt-vault:
	ansible-vault encrypt $(FILE) --vault-password-file vault-password

edit-vault:
	ansible-vault edit $(FILE) --vault-password-file vault-password
