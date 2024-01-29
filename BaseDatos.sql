USE [BDD_CLIENTES]
GO
/****** Object:  Table [dbo].[BC_CLIENTE]    Script Date: 1/29/2024 1:33:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC_CLIENTE](
	[ID_CLIENTE] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [bigint] NOT NULL,
	[CONTRASENIA] [varchar](50) NOT NULL,
	[ESTADO] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BC_CUENTA]    Script Date: 1/29/2024 1:33:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC_CUENTA](
	[ID_CUENTA] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_USUARIO] [bigint] NOT NULL,
	[NUMERO_CUENTA] [int] NOT NULL,
	[TIPO_CUENTA] [varchar](3) NOT NULL,
	[SALDO_INICIAL] [decimal](10, 2) NOT NULL,
	[ESTADO] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_CUENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BC_MOVIMIENTOS]    Script Date: 1/29/2024 1:33:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC_MOVIMIENTOS](
	[ID_MOVIMIENTOS] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_CUENTA] [bigint] NOT NULL,
	[FECHA] [datetime] NOT NULL,
	[TIPO] [nvarchar](3) NOT NULL,
	[VALOR] [decimal](10, 2) NOT NULL,
	[SALDO] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_MOVIMIENTOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BC_USUARIO]    Script Date: 1/29/2024 1:33:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BC_USUARIO](
	[ID_USUARIO] [bigint] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](150) NOT NULL,
	[GENERO] [char](1) NOT NULL,
	[EDAD] [int] NOT NULL,
	[IDENTIFICACION] [varchar](15) NOT NULL,
	[DIRECCION] [varchar](250) NULL,
	[TELEFONO] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BC_CLIENTE]  WITH CHECK ADD  CONSTRAINT [FK_BC_CLIENTE_BC_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[BC_USUARIO] ([ID_USUARIO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BC_CLIENTE] CHECK CONSTRAINT [FK_BC_CLIENTE_BC_USUARIO]
GO
ALTER TABLE [dbo].[BC_CUENTA]  WITH CHECK ADD  CONSTRAINT [FK_BC_CUENTA_BC_USUARIO] FOREIGN KEY([ID_USUARIO])
REFERENCES [dbo].[BC_USUARIO] ([ID_USUARIO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BC_CUENTA] CHECK CONSTRAINT [FK_BC_CUENTA_BC_USUARIO]
GO
ALTER TABLE [dbo].[BC_MOVIMIENTOS]  WITH CHECK ADD  CONSTRAINT [FK_BC_MOVIMIENTOS_BC_CUENTA] FOREIGN KEY([ID_CUENTA])
REFERENCES [dbo].[BC_CUENTA] ([ID_CUENTA])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BC_MOVIMIENTOS] CHECK CONSTRAINT [FK_BC_MOVIMIENTOS_BC_CUENTA]
GO
