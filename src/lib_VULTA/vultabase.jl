function VultaInstance(w::Int64,h::Int64,title::String,fs)
    # vk = VKInstance()
    #  ^^ Temporary until I can figure out this out-dated documentation issue.
    vk = 5
    process = Window(w, h, title, fs)
    () -> (process;vk)
end
