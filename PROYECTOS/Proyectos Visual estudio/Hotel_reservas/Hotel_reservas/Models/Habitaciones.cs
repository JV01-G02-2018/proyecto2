namespace Hotel_reservas.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Habitaciones
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Habitaciones()
        {
            Reservas = new HashSet<Reservas>();
        }

        [Key]
        public int id_habitaciones { get; set; }
        [Required]
        [StringLength(150)]
        public string tipo { get; set; }
        [Required]
        [Column(TypeName = "money")]
        public decimal? precio { get; set; }
        [Range (0,20)]
        [Required]
        public int? cantidad { get; set; }

        public int? id_promociones { get; set; }

        public virtual Promocion Promocion { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reservas> Reservas { get; set; }
    }
}
