package node

import "core:encoding/endian"
Type :: enum {
	NODE = 1,
	LEAF = 2,
}

Node :: distinct [4096]u8

type :: proc(node: ^Node) -> Type {
	return Type(node[0:2][1])
}

n_keys :: proc(node: ^Node) -> u16 {
	value, ok := endian.get_u16(node[2:4], .Little)
	return value
}
