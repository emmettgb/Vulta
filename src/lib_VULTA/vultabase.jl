@doc """Vulta Instance\n
Creating a new Vulta Instance will create a new GLFW instance and Window, as
well as a new Vulkan instance paired with it.\n
---------------------------------------------\n
============== PARAMETERS ==============\n
(w::Int64,h::Int64,title::String,fs)\n
w:: The desired Width of the GLFW Window.\n
h:: The desired height of the GLFW Window.\n
title:: The desired title of the GLFW Window\n
fs:: Boolean determining whether or not the window should be fullscreen.\n"""

function VultaInstance(w::Int64,h::Int64,title::String,fs)
    # vk = VKInstance()
    #  ^^ Temporary until I can figure out this out-dated documentation issue.
    vk = 5
    process = Window(w, h, title, fs)
    () -> (process;vk)
end
