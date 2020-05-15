function VultaInstance(w::Int64,h::Int64,title::String)
    # vk = VKInstance()
    #  ^^ Temporary until I can figure out this out-dated documentation issue.
    vk = 5
    window = Window(w, h, title)
    () -> (window;vk)
end
