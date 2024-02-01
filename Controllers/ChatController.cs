using Microsoft.AspNetCore.Mvc;

namespace ChatHub.Controllers
{
    public class ChatController : Controller
    {

        public static Dictionary<int,string> Rooms = new Dictionary<int, string>()
        {
            {1,"Fútbol"},
            {2,"Política"},
            {3,"Música"},
            {4,"General"}
        };

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult Room(int room)
        {
            return View("Room", room);
        }


    }
}
