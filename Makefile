install:
	ansible-galaxy role install -r requirements.yml
	ansible-galaxy collection install -r requirements.yml

prepare-servers:
	ansible-playbook playbook.yml -i inventory.yml
