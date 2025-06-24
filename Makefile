.PHONY: proto clean build

PROTO_DIR=proto
GEN_DIR=gen/go
MOD_PREFIX=pratikshakuldeep456/campaign-manager

proto: clean
	mkdir -p $(GEN_DIR)
	protoc \
	  --proto_path=$(PROTO_DIR) \
	  --go_out=$(GEN_DIR) --go_opt=module=$(MOD_PREFIX)/$(GEN_DIR) \
	  --go-grpc_out=$(GEN_DIR) --go-grpc_opt=module=$(MOD_PREFIX)/$(GEN_DIR) \
	  $(PROTO_DIR)/cm/v1/cm.proto


clean:
	rm -rf $(GEN_DIR)/*


run:
	go run cmd/main.go server