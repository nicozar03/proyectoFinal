using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using proyectoFinalDev.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

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
        Carrito MiCarrito = new Carrito();
        ViewBag.Carrito = MiCarrito;

        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);
        HttpContext.Session.SetString("Carrito", MiCarritoString);
        ViewBag.visits = HttpContext.Session.GetString("Carrito");
       /* Carrito MiCarrito = Request.Cookies["Carrito"];

        if (MiCarrito==null)
        {
            MiCarrito = new Carrito();
        }
        */
        /*int visits = 0 ;
        int.TryParse(visits.ToString(), out visits);
        visits++;
        CookieOptions options = new CookieOptions();
        options.Expires = DateTime.Now.AddDays(7);

        Response.Cookies.Append("visits",visits.ToString(), options);*/

        return View();
    }

    public IActionResult VerSesion()
    {

        ViewBag.visits = HttpContext.Session.GetString("Carrito");
        ViewBag.Carrito = new Carrito();
        return View("Carrito");
    }
    public IActionResult AgregarProducto()
    {
        var visitString =   HttpContext.Session.GetString("Carrito");
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(visitString);
    
        MiCarrito.AgregarProducto(new Producto(1,"Papa","DescPApa","foto","Ford",10,10,true));

        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        ViewBag.visits = visitString;
        ViewBag.visits2 = MiCarritoString;

        HttpContext.Session.SetString("Carrito", MiCarritoString);

            
//        Response.Cookies.Append("Carrito",MiCarritoString);

        ViewBag.Carrito = MiCarrito;
        return View("Carrito");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
