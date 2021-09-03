
print:
	which vault

dep-brew:
	# get a local vault instance running
	# from here: https://www.vaultproject.io/downloads
	brew tap hashicorp/tap
	brew install hashicorp/tap/vault

dep-guides:
	git clone https://github.com/hashicorp/vault-guides


# Config for Servr: https://www.vaultproject.io/docs/configuration
SERVER_CONFIG_FOLDERPATH=$(PWD)/server_config

server-run:
	# fails, as it needs consul.
	vault server -config $(SERVER_CONFIG_FOLDERPATH)
	# 127.0.0.1:8200

# Config for Servr: https://www.vaultproject.io/docs/configuration
CLUSTER_CONFIG_FOLDERPATH=$(PWD)/cluster_config
CLUSTER_VAULT_API_ADDR=http://127.0.0.1:8210
CLUSTER_VAULT_CLUSTER_ADDR=http://127.0.0.1:8221

cluster-run-01:
	mkdir -p ./_data/raft-node1
	VAULT_API_ADDR=http://127.0.0.1:8210 vault server -log-level=trace -config $(CLUSTER_CONFIG_FOLDERPATH)/config-node1.hcl

cluster-run-02:
	mkdir -p ./_data/raft-node2
	VAULT_API_ADDR=http://127.0.0.1:8220 vault server -log-level=trace -config $(CLUSTER_CONFIG_FOLDERPATH)/config-node2.hcl

	
cluster-status:
	VAULT_ADDR=$(CLUSTER_VAULT_API_ADDR) vault operator raft list-peers
