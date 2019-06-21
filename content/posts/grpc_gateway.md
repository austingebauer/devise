---
title: "Using gRPC Gateway with Protocol Buffers"
date: 2018-01-20T16:54:29-04:00
draft: false
tags: ["grpc", "protobuf", "golang"]
categories: ["software"]
---

### Some heading

Some text from juree. Some text from juree. Some text from juree. Some text from juree.

- list
- of 
- things

1. list
2. of
3. ordered
4. things

```go
// package tuple
package tuple

import (
	"errors"
	"log"

	"github.com/austingebauer/go-ray-tracer/math"
)

const (
	vector float64 = 0.0
	point  float64 = 1.0
)

// tuple represents a point or a vector in a left-handed coordinate system
type tuple struct {
	// x, y, and z represent components in a left-handed coordinate system
	x, y, z float64

	// w indicates whether this tuple represents a point or a vector
	// If the value of w is 0.0, then it represents a vector
	// If the value of w is 1.0, then it represents a point
	w float64
}

// NewPoint returns a new tuple that has the passed x, y, and z values.
func NewPoint(x, y, z float64) *tuple {
	tpl, err := newTuple(x, y, z, point)
	if err != nil {
		log.Fatal(err)
	}
	return tpl
}

// NewVector returns a new tuple that has the passed x, y, and z values.
func NewVector(x, y, z float64) *tuple {
	tpl, err := newTuple(x, y, z, vector)
	if err != nil {
		log.Fatal(err)
	}
	return tpl
}

// Equals returns true if the passed tuple is equal to this tuple.
// Two Tuples are equal if their x, y, z, and w members are equal.
func Equals(tpl1, tpl2 *tuple) bool {
	return math.Float64Equals(tpl1.x, tpl2.x, math.Epsilon) &&
		math.Float64Equals(tpl1.y, tpl2.y, math.Epsilon) &&
		math.Float64Equals(tpl1.z, tpl2.z, math.Epsilon) &&
		math.Float64Equals(tpl1.w, tpl2.w, math.Epsilon)
}

// Add creates and returns a new tuple by adding the corresponding components of each of the passed Tuples.
func Add(tpl1, tpl2 *tuple) (*tuple, error) {
	if tpl1.w+tpl2.w == (point + point) {
		return nil, errors.New("error: cannot add two point tuples")
	}

	return newTuple(tpl1.x+tpl2.x, tpl1.y+tpl2.y, tpl1.z+tpl2.z, tpl1.w+tpl2.w)
}

// newTuple returns a new tuple that has the passed x, y, z, and w values.
// This function is private in order to make the public interface for
// a tuple explicitly a point or a vector.
func newTuple(x, y, z, w float64) (*tuple, error) {
	if w != vector && w != point {
		return nil, errors.New("error: w must be either 0.0 or 1.0")
	}

	return &tuple{
		x: x,
		y: y,
		z: z,
		w: w,
	}, nil
}
```
