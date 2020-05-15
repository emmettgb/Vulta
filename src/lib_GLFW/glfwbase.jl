using GLFW
function Window(WIDTH, HEIGHT, title)
    delta = 0
    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API)    # NO_API well prevent
    GLFW.WindowHint(GLFW.RESIZABLE, 0)                # Open GL context
    window = GLFW.CreateWindow(WIDTH, HEIGHT, title)
    instance = Instance(delta,window)
    terminate() = GLFW.DestroyWindow(window)
    ()->(window;terminate;delta)
end
function Instance(delta,window)
    GLFW.glfwSetKeyCallback(window, key_callback())
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()

    end
end
function key_callback(window, key, scancode, action, mods)
    println("keypress")
end
export(Window)
