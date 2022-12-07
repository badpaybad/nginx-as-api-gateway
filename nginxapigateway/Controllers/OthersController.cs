using Microsoft.AspNetCore.Mvc;

namespace nginxapigateway.Controllers;


[ApiController]
[Route("[controller]")]
public class OthersController : ControllerBase
{
    [Route("test")]
    [HttpPost]
    public string Test()
    {
     Console.WriteLine($"OthersController: {DateTime.Now}");
        return $"OthersController: {DateTime.Now}";
    }

}