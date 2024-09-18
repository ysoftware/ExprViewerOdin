package main

import "core:fmt"
import "vendor:raylib"

Node :: struct {
    value: int,
    next: ^Node
}

main :: proc() {
    using raylib

    SetTargetFPS(144)
    InitWindow(800, 800, "Hello from Odin!")

    for !WindowShouldClose() {

        // init tree
        root_node := new(Node)
        root_node.value = 100
        {
            last_node := root_node
            for i := 0; i < 14; i += 1 {
                new_node := new(Node)
                new_node.value = i
                last_node.next = new_node
                last_node = new_node
            }
        }

        // traverse tree and calculate values 
        tree_sum := 0
        {
            last_node := root_node
            for {
                tree_sum += last_node.value

                if last_node.next == nil {
                    break
                }
                last_node = last_node.next
            }
        }

        BeginDrawing()
        ClearBackground({ 18, 24, 24, 255 })

        {
            last_node := root_node
            i : f32 = 0
            node_size :: 50
            for {
                position : Vector2 = { i * 20, i * node_size + 1 }
                DrawRectangleV(
                    position, 
                    { node_size, node_size }, 
                    { 111, 111, 0, 255 }
                )

                DrawText(
                    TextFormat("+%d", last_node.value),
                    auto_cast position.x + 5, auto_cast position.y + 5,
                    20, { 255, 255, 255, 255 }
                )

                if last_node.next == nil {
                    break
                }

                i += 1
                last_node = last_node.next
            }
        }

        DrawText(
            TextFormat("tree value: %d", tree_sum),
            300, 10,
            20, { 255, 255, 255, 255 }
        )
        EndDrawing()

        // release tree memory
        {
            last_node := root_node
            for {
                tree_sum += last_node.value

                if last_node.next == nil {
                    break
                }
                node_to_release := last_node
                last_node = last_node.next
                free(node_to_release)
            }
        }
    }

    CloseWindow()
}
