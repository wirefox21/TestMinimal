using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers;

[ApiController]
[Route("api/hello")]
public class HelloController : ControllerBase
{
    [HttpGet]
    public string Get()
    {
        return "Hello, ASP.NET Core API!";
    }

    [HttpPost]
    public IActionResult Post([FromBody] UserRequest request)
    {
        if(string.IsNullOrWhiteSpace(request.username))
        {
            return BadRequest(new { message = "名前を入力してください。"});
        }

        var response = new { message = $"こんにちは、 {request.username}さん!"};
        return Ok(response);
    }
}

    public class UserRequest{
        public string username{ get; set; } = string.Empty;
    }
