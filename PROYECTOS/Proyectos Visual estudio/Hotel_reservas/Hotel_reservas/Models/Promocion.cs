namespace Hotel_reservas.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Promocion")]
    public partial class Promocion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Promocion()
        {
            Habitaciones = new HashSet<Habitaciones>();
        }

        [Key]
        public int id_promocion { get; set; }
        [Required]
        [Column("promocion")]
        [StringLength(150)]
        public string promocion1 { get; set; }

        [Column(TypeName = "money")]
        public decimal? descuento { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Habitaciones> Habitaciones { get; set; }
    }
}
