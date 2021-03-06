
GO
/****** Object:  StoredProcedure [dbo].[REP_VENTAS]    Script Date: 02/12/2015 21:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[REP_VENTAS] --'01/28/2015','01/29/2015','SALFCF'
@FechaDesde date,
@FechaHasta date,
@Tipo_Doc varchar(20)


AS          
BEGIN												

  SELECT distinct p.Cod_Punto_Venta,p.Nombre_Punto,p.Encargado,p.Cod_Empresa,f.Tipo_Doc as TipoDocFac,f.Serie,f.No_factura,f.fecha,
   dp.Cod_Doc as TipoDocPV,dp.Serie_Doc as SeriePV,dp.Correlativo_ini,dp.Correlativo_fin,cli.Nombre,cli.Nrc,
   f.VentaSujeta as VentaNoSujeta,f.VentaGravada,f.Monto_Iva,f.Monto_Fact as TotalFactura,f.EstadoExenta,f.Estado
  FROM tbl_factura f
  INNER JOIN tbl_Punto_Venta p ON f.Cod_Punto_Venta = p.Cod_Punto_Venta
  INNER JOIN tbl_Doc_PuntoVenta dp ON p.Cod_Punto_Venta = dp.Cod_PuntoVenta	AND dp.Cod_Doc = @Tipo_Doc
  INNER JOIN tbl_clientes cli ON f.Id_cliente = cli.Id_cliente
  WHERE f.Tipo_Doc = @Tipo_Doc AND f.Fecha_Sys between @FechaDesde AND @FechaHasta
--select *from Tbl_Factura order by Correlativo\


END -- FIN SP