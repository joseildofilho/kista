package node

import "core:log"
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

@(test)
exercise_ptr_flow :: proc(t: ^testing.T) {
	node := Node{}

	n_keys_test := 100

	set_n_keys(&node, auto_cast n_keys_test)

	assert(n_keys(&node) == auto_cast n_keys_test)

	for i in 0 ..< n_keys_test {
		set_ptr(&node, auto_cast i, auto_cast (i * i))

		for j in 0 ..= i {
			testing.expect(t, auto_cast (j * j) == get_ptr(&node, auto_cast j))
		}
	}

}
