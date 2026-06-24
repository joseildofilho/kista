package node

import "core:testing"

@(test)
return_type_node :: proc(t: ^testing.T) {
	node := Node{}
	node[1] = 1

	node_type := type(&node)

	testing.expect(t, node_type == .NODE)
}

@(test)
return_type_leaf :: proc(t: ^testing.T) {
	node := Node{}
	node[1] = 2

	node_type := type(&node)

	testing.expect(t, node_type == .LEAF)
}
