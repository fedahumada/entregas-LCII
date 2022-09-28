using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecetasSLN.dominio
{
    internal class Receta
    {
        public int RecetaNro { get; set; }
        public string Nombre { get; set; }
        public int TipoReceta { get; set; }  
        public string Cheff { get; set; }

        public List<Detalle_Receta> Detalles { get; set; }

        public Receta()
        {
            Detalles = new List<Detalle_Receta>();
        }

        public void AgregarDetalle(Detalle_Receta detalle)
        {
            Detalles.Add(detalle);
        }






    }
}
