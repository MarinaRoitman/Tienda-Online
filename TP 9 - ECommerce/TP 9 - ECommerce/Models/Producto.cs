using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TP_9___ECommerce.Models
{
    public class Producto
    {
        private int _codigo;
        private int _codigoRubro;
        private string _titulo;
        private string _descripcion;
        private int _cant;
        private float _importe;
        private string _imagen;
        private int _stock;

        public Producto(int codigo, int codigoRubro, string titulo, string descripcion, int stock, float importe, string imagen)
        {
            _codigo = codigo;
            _codigoRubro = codigoRubro;
            _titulo = titulo;
            _descripcion = descripcion;
            _stock = stock;
            _importe = importe;
            _imagen = imagen;
        }

        public int codigo
        {
            get
            {
                return _codigo;
            }

            set
            {
                _codigo = value;
            }
        }

        public int codigoRubro
        {
            get
            {
                return _codigoRubro;
            }

            set
            {
                _codigoRubro = value;
            }
        }

        public string titulo
        {
            get
            {
                return _titulo;
            }

            set
            {
                _titulo = value;
            }
        }

        public string descripcion
        {
            get
            {
                return _descripcion;
            }

            set
            {
                _descripcion = value;
            }
        }

        public int cant
        {
            get
            {
                return _cant;
            }

            set
            {
                _cant = value;
            }
        }
        public int stock
        {
            get
            {
                return _stock;
            }

            set
            {
                _stock = value;
            }
        }

        public float importe
        {
            get
            {
                return _importe;
            }

            set
            {
                _importe = value;
            }
        }

        public string imagen
        {
            get
            {
                return _imagen;
            }

            set
            {
                _imagen = value;
            }

        }
    }
}