package node

import "core:encoding/endian"
import "core:log"

PAGE_SIZE :: 4096

Type :: enum {
	NODE = 1,
	LEAF = 2,
}

Node :: distinct [PAGE_SIZE]u8

type :: #force_inline proc(node: ^Node) -> Type {
	return Type(node[0:2][1])
}

set_type :: #force_inline proc(node: ^Node, t: Type) {
	endian.put_u16(node[0:2], .Big, cast(u16)t)
}

n_keys :: #force_inline proc(node: ^Node) -> u16 {
	value, _ := endian.get_u16(node[2:4], .Big)
	return value
}

set_n_keys :: #force_inline proc(node: ^Node, n: u16) {
	endian.put_u16(node[2:4], .Big, n)
}

set_header :: proc(node: ^Node, t: Type, n: u16) {
	set_type(node, t)
	set_n_keys(node, n)
}

set_ptr :: proc(node: ^Node, idx: u16, value: u64) {
	assert(n_keys(node) > idx)
	pos := 4 + 8 * idx
	endian.put_u64(node[pos:], .Big, value)
}

get_ptr :: proc(node: ^Node, idx: u16) -> u64 {
	assert(n_keys(node) > idx)
	pos := 4 + 8 * idx
	value, _ := endian.get_u64(node[pos:], .Big)
	return value
}
