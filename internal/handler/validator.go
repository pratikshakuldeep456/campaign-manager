package handler

import (
	"github.com/go-playground/validator/v10"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

var validate = validator.New()

func ValidateStruct(i interface{}) error {
	if err := validate.Struct(i); err != nil {
		return status.Errorf(codes.InvalidArgument, "validation failed: %v", err)
	}
	return nil
}
