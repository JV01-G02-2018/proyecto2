namespace Hotel_reservas.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class salida_reservas
    {
        [Key]
        public int id_salida_reservas { get; set; }
        [Required]
        [StringLength(150)]
        public string observaciones { get; set; }

        public int? id_usuarios { get; set; }

        public int? id_reservas { get; set; }

        public virtual Reservas Reservas { get; set; }

        public virtual Usuario Usuario { get; set; }
    }
}
