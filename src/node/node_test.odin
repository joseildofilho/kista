package node

import "core:testing"

@(test)
return_type_node :: proc(t: ^testing.T) {
	node := Node{}
	set_type(&node, .NODE)

	node_type := type(&node)

	testing.expect(t, node_type == .NODE)
}

@(test)
return_type_leaf :: proc(t: ^testing.T) {
	node := Node{}
	set_type(&node, .LEAF)

	node_type := type(&node)

	testing.expect(t, node_type == .LEAF)
}

@(test)
return_n_keys :: proc(t: ^testing.T) {
	node := Node{}
	set_n_keys(&node, 14)

	n := n_keys(&node)

	testing.expect(t, n == 14)
}
