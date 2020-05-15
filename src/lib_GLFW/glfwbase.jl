using GLFW
function Window(WIDTH, HEIGHT, title,fullscreen=false)
    delta = 0
    GLFW.WindowHint(GLFW.CLIENT_API, GLFW.NO_API)    # NO_API well prevent
    GLFW.WindowHint(GLFW.RESIZABLE, 0)                # Open GL context
    if fullscreen == false
        window = GLFW.CreateWindow(WIDTH, HEIGHT, title)
    else
        window = GLFW.CreateWindow(WIDTH, HEIGHT, title,
        GLFW.glfwGetPrimaryMonitor())
    end
    instance = Instance(delta,window)
    terminate() = GLFW.DestroyWindow(window)
    ()->(window;terminate;delta;instance)
end
function Instance(delta,window)
    while !GLFW.WindowShouldClose(window)
        GLFW.PollEvents()
    end
end
function key_callback(window, key, scancode, action, mods)
    println("keypress")
end
