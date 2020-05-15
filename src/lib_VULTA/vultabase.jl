function VultaInstance(w::Int64,h::Int64,title::String)
    vk = VKInstance()
    window = Window(w, h, title)
    () -> (window;vk)
end
