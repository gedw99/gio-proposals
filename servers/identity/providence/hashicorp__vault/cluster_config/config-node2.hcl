ha_storage "raft" {
  path    = "/Users/apple/workspace/go/src/github.com/gedw99/gio-proposals/identity/hashicorp__vault/_data/raft-node2/"
  node_id = "node2"
}

storage "file" {
    path = "/Users/apple/workspace/go/src/github.com/gedw99/gio-proposals/identity/hashicorp__vault/_data/vault-storage-file"
}

listener "tcp" {
  address = "127.0.0.1:8220"
  cluster_address = "127.0.0.1:8221"
  tls_disable = true
}

disable_mlock = true
api_addr = "http://127.0.0.1:8220"
cluster_addr = "http://127.0.0.1:8221"
