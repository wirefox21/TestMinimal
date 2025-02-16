using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MyWebApp.Pages;

public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;

    [BindProperty]
    public string? username{ get; set;}

    public string ResultMessage{ get; set;} = "";
    public string Message { get; set;} = "デフォルトのメッセージ";

    public IndexModel(ILogger<IndexModel> logger)
    {
        _logger = logger;
        Message = "デフォルトのメッセージ";
    }

    public void OnGet()
    {
        Message = "こんにちは、ASP.NET Core!";
        _logger.LogInformation("OnGetメソッドが実行されました。");
    }

    public void OnPost()
    {
        if(string.IsNullOrEmpty(username))
        {
            ResultMessage = "入力が空です。名前を入力してください。";
        }
        else
        {
            ResultMessage = $"こんにちは、{username}さん!";
            _logger.LogInformation($"ユーザー入力: {username}");
        }
    }

}
