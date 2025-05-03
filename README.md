# grpc-server

go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

export PATH="$PATH:$(go env GOPATH)/bin" 


  CREATE TABLE campaigns (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    priority INTEGER DEFAULT 0,
    condition_json JSONB NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW()
);


 protoc \
  --proto_path=api/proto \
  --go_out=gen/pb --go_opt=paths=source_relative \
  --go-grpc_out=gen/pb --go-grpc_opt=paths=source_relative \
  $(find api/proto -name "*.proto")