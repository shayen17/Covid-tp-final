program tp_final;
uses crt,unit_menu,archivos_tpfinal;

var
arch_inf:archivo_infectados;
arch_prov:archivo_provincia;
arch_est:archivo_estadisticas;

begin

crear_infectados (arch_inf);
crear_provincias(arch_prov);
crear_estadisticas(arch_est);
menu_principal(arch_inf,arch_prov,arch_est);

end.
