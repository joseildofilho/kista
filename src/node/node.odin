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

set_type :: proc(node: ^Node, t: Type) {
	endian.put_u16(node[0:2], .Big, cast(u16)t)
}

n_keys :: proc(node: ^Node) -> u16 {
	value, ok := endian.get_u16(node[2:4], .Big)
	return value
}

set_n_keys :: proc(node: ^Node, n: u16) {
	endian.put_u16(node[2:4], .Big, cast(u16)n)
}
