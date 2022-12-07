using Microsoft.AspNetCore.Mvc;

namespace nginxapigateway.Controllers;


[ApiController]
[Route("[controller]")]
public class TestRouting1Controller : ControllerBase
{
    
    [Route("test")]
    [HttpPost]
    public string Test()
    {
        Console.WriteLine($"TestRouting1Controller: {DateTime.Now}");
        return $"TestRouting1Controller: {DateTime.Now}";
    }

}