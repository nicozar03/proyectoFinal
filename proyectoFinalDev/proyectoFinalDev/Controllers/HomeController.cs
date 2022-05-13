using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using proyectoFinalDev.Models;


namespace proyectoFinalDev.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        /*List<Productos> ListaProductos = new List <Productos>();
            int i=-1;
            ListaProductos = BD.ListarProductos(i);
            ViewBag.Productos=ListaProductos;
            */
        return View();
    }
      public IActionResult productos()
    {
        return View();
    }
      public IActionResult insumosComputacion()
    {
        return View();
    }
      public IActionResult libreriaTecnica()
    {
        return View();
    }
        public IActionResult FAQ()
    {
        return View();
    }
        public IActionResult contacto()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
