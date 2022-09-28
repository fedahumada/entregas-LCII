using System;
using System.Windows.Forms;

namespace RecetasSLN.presentación
{
    public partial class FrmConsultarRecetas : Form
    {
        public FrmConsultarRecetas()
        {
            InitializeComponent();
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            FrmAltaReceta altaReceta = new FrmAltaReceta();
            altaReceta.ShowDialog();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {

            if (MessageBox.Show("Desea SALIR de la aplicacion?","SALIR",MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2)==
                DialogResult.Yes)
                this.Dispose();

        }
    }
}
