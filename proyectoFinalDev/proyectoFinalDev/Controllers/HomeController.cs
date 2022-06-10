using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using proyectoFinalDev.Models;
using Microsoft.AspNetCore.Http;


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

        var visitString = Request.Cookies["visits"];
        int visits = 0 ;
        int.TryParse(visitString, out visits);
        visits++;
        CookieOptions options = new CookieOptions();
        options.Expires = DateTime.Now.AddDays(7);

        Response.Cookies.Append("visits",visits.ToString(), options);

        ViewBag.visits = visits;
        List<Producto> ListaProductos = new List <Producto>();
        
            
            ListaProductos = BD.ListaProductosDestacados();
            ViewBag.Producto=ListaProductos;
           
        return View();
    }
      public IActionResult detalleProductos(int idProducto, string descripcion, string nombre)
    {
        Producto producto;
        producto=BD.ConsultaProducto(idProducto);
        ViewBag.Producto=producto;
        ViewBag.Producto.descripcion=descripcion;
        ViewBag.Producto.nombre=nombre;

        return View("detalleProducto");
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
    public IActionResult carrito()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
