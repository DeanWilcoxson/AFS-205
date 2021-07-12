namespace TokenGen.Controllers
{
    [Microsoft.AspNetCore.Components.Route("api/[controller]")]
    public class TokenController : Microsoft.AspNetCore.Mvc.Controller
    {
        [Microsoft.AspNetCore.Mvc.HttpGet]
        public dynamic Get()
        {
            return new
            {
                Guid = System.Guid.NewGuid().ToString(),
                Expires = System.DateTime.UtcNow.AddHours(1),
                Issuer = System.Environment.MachineName
            };
        }
    }
}