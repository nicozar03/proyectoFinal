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
        var visitString =   Request.Cookies["visits"];
        Carrito MiCarrito = new Carrito();
        ViewBag.Carrito = MiCarrito;
        MiCarrito.Fecha = DateTime.Now;

        
        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);
        Response.Cookies.Append("Carrito",MiCarritoString);
       
       /* Carrito MiCarrito = Request.Cookies["Carrito"];

        if (MiCarrito==null)
        {
            MiCarrito = new Carrito();
        }
        */
        int visits = 0 ;
        int.TryParse(visitString, out visits);
        visits++;
        CookieOptions options = new CookieOptions();
        options.Expires = DateTime.Now.AddDays(7);

        Response.Cookies.Append("visits",visits.ToString(), options);

        ViewBag.visits = visits;
        return View();
    }

    public IActionResult AgregarProducto()
    {
        var visitString =   Request.Cookies["Carrito"];
        Carrito MiCarrito = JsonConvert.DeserializeObject<Carrito>(visitString);
        MiCarrito.AgregarProducto(new Producto(1,"Papa","DescPApa","foto","Ford",10,10,true));



        string MiCarritoString = JsonConvert.SerializeObject(MiCarrito);

        if (Request.Cookies["Carrito"] != null)
        {
            
        }
            
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
