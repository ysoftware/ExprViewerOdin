### Test project in Odin lang

With this project, I learn about custom allocators and introduce myself to Odin language.

I create a node tree, populate it with some values, then I sum all values and draw the nodes with Raylib.
In the end of the frame, all nodes are freed from memory.

In the version 1, I use new(Node) aka malloc for single-allocations.
In the version 2, I will use a preallocated stack-buffer to keep all elements there.
In the version 3, I will use a dynamically resized vector and reference nodes as indices relative to this vector.

On my path to becoming an N+1 programmer.
