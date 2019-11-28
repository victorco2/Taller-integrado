USE [master]
GO
/****** Object:  Database [dbsistema]    Script Date: 28-11-2019 18:22:28 ******/
CREATE DATABASE [dbsistema]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbsistema', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbsistema.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbsistema_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\dbsistema_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbsistema] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbsistema].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbsistema] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbsistema] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbsistema] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbsistema] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbsistema] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbsistema] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbsistema] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbsistema] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbsistema] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbsistema] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbsistema] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbsistema] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbsistema] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbsistema] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbsistema] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbsistema] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbsistema] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbsistema] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbsistema] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbsistema] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbsistema] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbsistema] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbsistema] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbsistema] SET  MULTI_USER 
GO
ALTER DATABASE [dbsistema] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbsistema] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbsistema] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbsistema] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbsistema] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbsistema] SET QUERY_STORE = OFF
GO
USE [dbsistema]
GO
/****** Object:  UserDefinedTableType [dbo].[type_detalle_ingreso]    Script Date: 28-11-2019 18:22:29 ******/
CREATE TYPE [dbo].[type_detalle_ingreso] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[type_detalle_venta]    Script Date: 28-11-2019 18:22:29 ******/
CREATE TYPE [dbo].[type_detalle_venta] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[stock] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[descuento] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[types_detalle_ingreso]    Script Date: 28-11-2019 18:22:29 ******/
CREATE TYPE [dbo].[types_detalle_ingreso] AS TABLE(
	[idarticulo] [int] NULL,
	[codigo] [varchar](50) NULL,
	[articulo] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](11, 2) NULL,
	[importe] [decimal](11, 2) NULL
)
GO
/****** Object:  Table [dbo].[Asignatura]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignatura](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](25) NULL,
	[Observacion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] NOT NULL,
	[Nombre_Curso] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso_Asignatura]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso_Asignatura](
	[Id] [int] NOT NULL,
	[Id_Curso] [int] NULL,
	[Id_Asignatura] [int] NULL,
	[Id_Docente] [int] NULL,
	[Id_Periodo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Docente]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Docente](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Apellido_Paterno] [varchar](20) NULL,
	[Apellido_Materno] [varchar](20) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estudiante]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estudiante](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Apellido_Paterno] [varchar](20) NULL,
	[Apellido_Materno] [varchar](20) NULL,
	[Rut] [int] NULL,
	[Fecha_Nacimiento] [date] NULL,
	[Sexo] [varchar](10) NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Email] [varchar](50) NULL,
	[Estado] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[Id] [int] NOT NULL,
	[Nota] [int] NULL,
	[Fecha_modificacion] [datetime] NULL,
	[Id_Estudiante] [int] NULL,
	[Id_Curso_Asignatura] [int] NULL,
	[Id_Usuario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo](
	[Id] [int] NOT NULL,
	[Periodo_Año] [int] NULL,
	[Descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodo_Estudiante_Curso]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodo_Estudiante_Curso](
	[Id_Periodo] [int] NULL,
	[Id_Curso] [int] NULL,
	[Id_Estudiante] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Idrol] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Tipo_Documento] [varchar](20) NULL,
	[Num_Documento] [varchar](20) NULL,
	[Direccion] [varchar](70) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[Clave] [varbinary](max) NOT NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK__usuario__080A9743A17C642F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[usuario] ADD  CONSTRAINT [DF__usuario__estado__267ABA7A]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD FOREIGN KEY([Id_Asignatura])
REFERENCES [dbo].[Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD FOREIGN KEY([Id_Docente])
REFERENCES [dbo].[Docente] ([Id])
GO
ALTER TABLE [dbo].[Curso_Asignatura]  WITH CHECK ADD FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodo] ([Id])
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD FOREIGN KEY([Id_Curso_Asignatura])
REFERENCES [dbo].[Curso_Asignatura] ([Id])
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Estudiante] ([Id])
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[usuario] ([Id])
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_usuario]
GO
ALTER TABLE [dbo].[Periodo_Estudiante_Curso]  WITH CHECK ADD FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[Curso] ([Id])
GO
ALTER TABLE [dbo].[Periodo_Estudiante_Curso]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[Estudiante] ([Id])
GO
ALTER TABLE [dbo].[Periodo_Estudiante_Curso]  WITH CHECK ADD FOREIGN KEY([Id_Periodo])
REFERENCES [dbo].[Periodo] ([Id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK__usuario__idrol__276EDEB3] FOREIGN KEY([Idrol])
REFERENCES [dbo].[rol] ([Id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK__usuario__idrol__276EDEB3]
GO
/****** Object:  StoredProcedure [dbo].[rol_listar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[rol_listar]
as
select Id,nombre from rol
where estado=1
GO
/****** Object:  StoredProcedure [dbo].[usuario_activar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_activar]
@idusuario integer
as
update usuario set estado=1
where Id=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_actualizar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_actualizar]
@idusuario integer,
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
if @clave<>''
update usuario set Idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email,clave=HASHBYTES('SHA2_256', @clave)
where Id=@idusuario;
else
update usuario set Idrol=@idrol,nombre=@nombre,tipo_documento=@tipo_documento,
num_documento=@num_documento,direccion=@direccion,telefono=@telefono,
email=@email
where Id=@idusuario;
GO
/****** Object:  StoredProcedure [dbo].[usuario_buscar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_buscar]
@valor varchar(50)
as
select u.Id as ID,u.Idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.Id=r.Id
 where u.nombre like '%' +@valor + '%' Or u.email like '%' +@valor + '%'
 order by u.nombre asc
GO
/****** Object:  StoredProcedure [dbo].[usuario_desactivar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_desactivar]
@idusuario integer
as
update usuario set estado=0
where Id=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_eliminar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_eliminar]
@idusuario integer
as
delete from usuario
where Id=@idusuario
GO
/****** Object:  StoredProcedure [dbo].[usuario_existe]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_existe]
@valor varchar(100),
@existe bit output
as
	if exists (select email from usuario where email = ltrim(rtrim(@valor)))
		begin
		 set @existe=1
		end
	else
		begin
		 set @existe=0
		end
GO
/****** Object:  StoredProcedure [dbo].[usuario_insertar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usuario_insertar]
@idrol integer,
@nombre varchar(100),
@tipo_documento varchar(20),
@num_documento varchar(20),
@direccion varchar(70),
@telefono varchar(20),
@email varchar(50),
@clave varchar(50)
as
insert into usuario (idrol,nombre,tipo_documento,num_documento,direccion,telefono,email,clave)
values (@idrol,@nombre,@tipo_documento,@num_documento,@direccion,@telefono,@email,HASHBYTES('SHA2_256',@clave))
GO
/****** Object:  StoredProcedure [dbo].[usuario_listar]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_listar]
as
select u.Id as ID,u.idrol, r.nombre as Rol,u.nombre as Nombre,
u.tipo_documento as Tipo_Documento,u.num_documento as Num_Documento,
u.direccion as Direccion,u.telefono as Telefono,u.email as Email,
u.estado as Estado
 from usuario u inner join rol r on u.Idrol=r.Id
 order by u.Id desc
GO
/****** Object:  StoredProcedure [dbo].[usuario_login]    Script Date: 28-11-2019 18:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usuario_login]
@email varchar(50),
@clave varchar(50)
as
select u.Id,u.Idrol,r.nombre as rol,u.nombre,u.estado
from usuario u inner join rol r on u.Idrol=r.Id
where u.email=@email and u.clave=HASHBYTES('SHA2_256',@clave)
GO
USE [master]
GO
ALTER DATABASE [dbsistema] SET  READ_WRITE 
GO
