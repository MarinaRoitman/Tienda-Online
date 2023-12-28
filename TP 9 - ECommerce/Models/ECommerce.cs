using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TP_9___ECommerce.Models
{
    public static class ECommerce
    {
        private static List<Producto> _listaProductos = new List<Producto>();
        private static List<Rubro> _listaRubros = new List<Rubro>();
        private static List<Producto> _carritoCompra = new List<Producto>();

        public static List<Producto> listaProductos
        {
            get
            {
                return _listaProductos;
            }

            private set
            {
                _listaProductos = value;
            }
        }
        public static List<Rubro> listaRubros
        {
            get
            {
                return _listaRubros;
            }

            private set
            {
                _listaRubros = value;
            }
        }

        public static List<Producto> carritoCompra
        {
            get
            {
                return _carritoCompra;
            }

            set
            {
                _carritoCompra = value;
            }
        }

        //Metodos
        public static List<Producto> ListarProductos()
        {
            //Este metodo solo busca devolver la lista de productos en caso de no recibir codigo de rubro
            return _listaProductos;
        }

        public static List<Producto> ListarProductos(int codigoRubro)
        {
            //Este metodo solo busca devolver la lista de productos en caso de recibir codigo de rubro
            List<Producto> devolver = new List<Producto>(); //Creo una lista
            for (int k = 0; k < _listaRubros.Count; k++) //Recorro
            {
                if (codigoRubro == _listaRubros[k].codigo) //Pregunto si el codigo que me pasaron coincide con alguno de los existentes
                {
                    devolver.Add(_listaProductos[k]); //En dicho caso agrego el producto que estoy mirando a la lista a devolver
                }
            }
            return devolver; //Devuelvo devolver
        }

        public static List<Rubro> ListarRubros()
        {
            //Este metodo solo busca devolver la lista de rubros
            return _listaRubros;
        }

        public static List<Producto> ListarCarrito()
        {
            //Este metodo solo busca devolver el carrito
            return _carritoCompra;
        }

        public static void InicializarEcommerce()
        {

            _listaProductos = BDD.ObtenerProductos(); //Guardo la lista de productos invocando a obtener productos que accede a la base de datos
        }

        public static Producto ObtenerProducto(int codigo)
        {
            Producto prod = _listaProductos.Find(x => x.codigo.Equals(codigo)); //Declaro y busco el producto
            return prod; //Devuelvo el producto
        }

        public static List<Producto> VaciarCarrito()
        {
            //Este metodo vacia el carrito
            _carritoCompra.Clear();
            return _carritoCompra;
        }

        public static void AgregarProductoCarrito(Producto prod)
        {
            bool estabaElProducto = false; //Declaro y pongo en false a estabaElProducto

            for (int i = 0; i < _carritoCompra.Count(); i++) //Recorro
            {
                if (prod.codigo == _carritoCompra[i].codigo) //Pregunto si el producto ya se encontraba en el carrito
                {
                    estabaElProducto = true; //estabaElProducto se vuelve true
                    _carritoCompra[i].cant += 1; //Le sumo uno a la cantidad de veces que se encuentra el producto en el carrito
                }
            }

            if (!estabaElProducto) //Si el producto no estaba en el carrito...
            {
                prod.cant = 1;
                _carritoCompra.Add(prod); //... lo agrego al carrito
            }
        }
        
        public static List<Producto> EliminarProductoCarrito(int codigo)
        {
            _carritoCompra.Remove(ObtenerProducto(codigo)); //Elimino el producto llamando al metodo ObtenerProducto
            return _carritoCompra;
        }

        public static float TotalizarCarrito()
        {
            //Este metodo tiene por objetivo devolver el valor total del carrito
            float precioADevolver;
            precioADevolver = 0;
            //Hasta acá creé e inicialicé variables
            for(int i = 0 ; i < _carritoCompra.Count(); i++) //Recorro el carrito
            {
                precioADevolver += _carritoCompra[i].importe * _carritoCompra[i].cant; //Sumo en precioADevolver el valor del producto multiplicado por la cantidad que estoy llevando
            }

            return precioADevolver; //Devuelvo precioADevolver
        }

    }
}