
IF DB_ID('DatosAbiertosDB') IS NULL
    CREATE DATABASE DatosAbiertosDB;
GO

USE DatosAbiertosDB;
GO


IF OBJECT_ID('dbo.HurtosVehiculos', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.HurtosVehiculos (
        
        id              INT IDENTITY(1,1) PRIMARY KEY,

        
        id_api          NVARCHAR(100)  NOT NULL UNIQUE,

        departamento    NVARCHAR(100)  NULL,
        municipio       NVARCHAR(150)  NULL,

        
        codigo_dane     NVARCHAR(10)   NULL,

        armas_medios    NVARCHAR(100)  NULL,

     
        fecha_hecho     DATE           NULL,

        genero          NVARCHAR(30)   NULL,
        grupo_etario    NVARCHAR(30)   NULL,

       
        tipo_hurto      NVARCHAR(150)  NULL,

        
        cantidad        INT            NULL,

        
        json_original   NVARCHAR(MAX)  NULL,

        
        fecha_captura   DATETIME2      NOT NULL DEFAULT SYSDATETIME()
    );
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Hurtos_Departamento')
    CREATE INDEX IX_Hurtos_Departamento ON dbo.HurtosVehiculos (departamento, municipio);
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_Hurtos_Tipo')
    CREATE INDEX IX_Hurtos_Tipo ON dbo.HurtosVehiculos (tipo_hurto);
GO


SELECT TOP 5 * FROM dbo.HurtosVehiculos;
GO
