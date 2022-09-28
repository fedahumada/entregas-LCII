using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecetasSLN.dominio
{
    internal class Ingrediente
    {
        public int IngredienteId { get; set; }
        public string Nombre { get; set; }
        public string Unidad { get; set; }

        public Ingrediente(int id_ingrediente, string nom, string unidad)
        {
            IngredienteId=id_ingrediente;
            Nombre=nom;
            Unidad=unidad;
            
        }

        public override string ToString()
        {
            return Nombre;
        }




    }
}
