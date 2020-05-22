using Base.Threads: @spawn
include("vutil.jl")
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
    p = process()
    dltapc = proc(p)
    get_delta() = p.delta
    kill_dlta() = dltapc.kill_proc()
    win = Window(w, h, title, fs)
    terminate() = win.terminate()
    () -> (vk;terminate;p;dltapc;get_delta;kill_dlta)
end
function process()
    delta = 0
    advance_process() = delta += 1
    (var)->(delta;advance_process)
end
function proc(p)
    process = 0
   @spawn while process == 0
        p.advance_process()
    end
    kill_proc() = process += 1
    (var)->(kill_proc;process)
end
