USE [Hotel]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 26/9/2018 08:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[id_cargo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[id_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[edad] [int] NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[id_cargo] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitaciones]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitaciones](
	[id_tipo_habitacion] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](150) NULL,
	[precio] [decimal](5, 2) NULL,
	[cantidad] [int] NULL,
	[id_promociones] [int] NULL,
	[id_salidas_reservas] [int] NULL,
 CONSTRAINT [PK_Habitaciones] PRIMARY KEY CLUSTERED 
(
	[id_tipo_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Huesped]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Huesped](
	[id_huesped] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[direccion] [varchar](150) NULL,
	[dui] [varchar](150) NULL,
	[telefono] [varchar](150) NULL,
	[correo] [varchar](150) NULL,
	[id_tipo_huesped] [int] NULL,
 CONSTRAINT [PK_Huesped] PRIMARY KEY CLUSTERED 
(
	[id_huesped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[id_promociones] [int] IDENTITY(1,1) NOT NULL,
	[promocion] [varchar](50) NULL,
	[descuento] [decimal](5, 2) NULL,
 CONSTRAINT [PK_Promociones] PRIMARY KEY CLUSTERED 
(
	[id_promociones] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[id_reservas] [int] IDENTITY(1,1) NOT NULL,
	[numero_habitaciones] [int] NULL,
	[fecha_entrada] [date] NULL,
	[fecha_salida] [date] NULL,
	[dias] [int] NULL,
	[total] [decimal](5, 2) NULL,
	[id_huesped] [int] NULL,
	[id_usuario] [int] NULL,
	[id_empleado] [int] NULL,
	[id_habitacion] [int] NULL,
	[id_pago] [int] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[id_reservas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[id_rol] [int] IDENTITY(1,1) NOT NULL,
	[rol] [varchar](150) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salida_reservas]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salida_reservas](
	[id_salida_reserva] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NULL,
	[observaciones] [varchar](150) NULL,
	[id_usuarios] [int] NULL,
	[id_reservas] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_huesped]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_huesped](
	[id_tipo_huesped] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](150) NULL,
 CONSTRAINT [PK_Tipo_huesped] PRIMARY KEY CLUSTERED 
(
	[id_tipo_huesped] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[id_tipo_pago] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[id_tipo_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/9/2018 08:46:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[usuario] [varchar](150) NULL,
	[contrasenia] [varchar](100) NULL,
	[id_rol] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([id_cargo])
REFERENCES [dbo].[Cargo] ([id_cargo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargo]
GO
ALTER TABLE [dbo].[Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Habitaciones_Promociones] FOREIGN KEY([id_promociones])
REFERENCES [dbo].[Promociones] ([id_promociones])
GO
ALTER TABLE [dbo].[Habitaciones] CHECK CONSTRAINT [FK_Habitaciones_Promociones]
GO
ALTER TABLE [dbo].[Huesped]  WITH CHECK ADD  CONSTRAINT [FK_Huesped_Tipo_huesped] FOREIGN KEY([id_tipo_huesped])
REFERENCES [dbo].[Tipo_huesped] ([id_tipo_huesped])
GO
ALTER TABLE [dbo].[Huesped] CHECK CONSTRAINT [FK_Huesped_Tipo_huesped]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Empleado] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleado] ([id_empleado])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Empleado]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Habitaciones] FOREIGN KEY([id_habitacion])
REFERENCES [dbo].[Habitaciones] ([id_tipo_habitacion])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Habitaciones]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Huesped1] FOREIGN KEY([id_huesped])
REFERENCES [dbo].[Huesped] ([id_huesped])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Huesped1]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_tipo_pago] FOREIGN KEY([id_pago])
REFERENCES [dbo].[tipo_pago] ([id_tipo_pago])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_tipo_pago]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Usuario]
GO
ALTER TABLE [dbo].[salida_reservas]  WITH CHECK ADD  CONSTRAINT [FK_salida_reservas_Reservas] FOREIGN KEY([id_reservas])
REFERENCES [dbo].[Reservas] ([id_reservas])
GO
ALTER TABLE [dbo].[salida_reservas] CHECK CONSTRAINT [FK_salida_reservas_Reservas]
GO
ALTER TABLE [dbo].[salida_reservas]  WITH CHECK ADD  CONSTRAINT [FK_salida_reservas_Usuario] FOREIGN KEY([id_usuarios])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[salida_reservas] CHECK CONSTRAINT [FK_salida_reservas_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_rol] FOREIGN KEY([id_rol])
REFERENCES [dbo].[rol] ([id_rol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_rol]
GO
