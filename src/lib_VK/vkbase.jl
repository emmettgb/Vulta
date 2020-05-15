using VulkanCore
using VulkanCore.LibVulkan
using CSyntax
using GLFW
function VKInstance()
    sType = VK_STRUCTURE_TYPE_APPLICATION_INFO
    pApplicationName = pointer(b"Vulkan Instance")
    applicationVersion = VK_MAKE_VERSION(1, 1, 0)
    pEngineName = pointer(b"No Engine")
    engineVersion = VK_MAKE_VERSION(1, 1, 0)
    apiVersion = VK_MAKE_VERSION(1, 1, 0)
    appInfo = VkApplicationInfo(sType, C_NULL, pApplicationName, applicationVersion, pEngineName, engineVersion, apiVersion)
    GLFW.VulkanSupported()
        # fill create info
    Type = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
    flags = UInt32(0)
    pApplicationInfo = @c Base.unsafe_convert(Ptr{VkApplicationInfo}, &appInfo)
    enabledExtensionCount = Cuint(0)
    ppEnabledExtensionNames = @c GLFW.GetRequiredInstanceExtensions(&enabledExtensionCount)
    enabledLayerCount = Cuint(0)
    ppEnabledLayerNames = C_NULL
    createInfo = @c VkInstanceCreateInfo(sType, C_NULL, flags, pApplicationInfo, enabledLayerCount, ppEnabledLayerNames, enabledExtensionCount, ppEnabledExtensionNames)
    # create instance
    instance = VkInstance(C_NULL)
    result = @c vkCreateInstance(&createInfo, C_NULL, &instance)
    result != VK_SUCCESS && error("failed to create instance!")
    () -> (applicationVersion)
end
