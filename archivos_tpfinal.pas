unit archivos_tpfinal;
interface
uses crt;

type
t_cadena30=string[30];

datos_provincia=record
                codigo:byte;
                telefono:string[10];
end;
vec_cod= array [1..23] of string[25];

t_domicilio=record
  calle:t_cadena30;
  numero:integer;
  piso:integer;
  ciudad:t_cadena30;
  provincia:t_cadena30;
  cp:integer;
end;

infectados = record
  nombreyapellido: t_cadena30;
  dni: string[8];
  edad:byte;
  domicilio: t_domicilio;                    //se usa el registro t_domicilio;
  telefonopaciente: string[10];
  email: t_cadena30;
  fecha_nacimiento: string[10];
end;
archivo_infectados = file of infectados;
    
provincia = record
  denominacion:t_cadena30;
  codigo_provincia:byte;
  telefono:string[10];
end;
archivo_provincia = file of provincia;

estadisticas = record
  id:string[8];
  dni:string[8];
  codigo_provincia:byte;
  estado:string[25];
  forma_de_contagio:t_cadena30;
  activo:boolean;
end;
archivo_estadisticas = file of estadisticas;


procedure crear_infectados (var arch_inf:archivo_infectados);
procedure crear_provincias(var arch_prov:archivo_provincia);
procedure crear_estadisticas(var arch_est:archivo_estadisticas);
procedure abrir_infectados (var arch_inf:archivo_infectados);
procedure abrir_provincias (var arch_prov:archivo_provincia);
procedure abrir_estadisticas (var arch_est:archivo_estadisticas);
procedure cerrar_infectados (var arch_inf:archivo_infectados);
procedure cerrar_estadisticas (var arch_est:archivo_estadisticas);
procedure cerrar_provincias(var arch_prov:archivo_provincia);
procedure guardar_infectados(var arch_inf:archivo_infectados; var pos:integer; reg:infectados);
procedure guardar_estadisticas(var arch_est:archivo_estadisticas; var pos:integer; reg:estadisticas);
procedure guardar_provincias(var arch_prov:archivo_provincia; var pos:integer; reg:provincia);
procedure inicializar_infectados (var reg_inf:infectados);
procedure inicializar_provincias (var reg_prov:provincia);
procedure inicializar_estadisticas (var reg_est:estadisticas);
procedure cargar_infectados (var reg_inf:infectados);
procedure cargar_provincia (var reg_prov:provincia; reg_inf:infectados; v:vec_cod);
procedure cargar_estadisticas (var reg_est:estadisticas;reg_prov:provincia;reg_inf:infectados);
procedure mostrar_reg_inf (var reg_inf:infectados);
procedure mostrar_reg_prov (var reg_prov:provincia);
procedure mostrar_reg_est (var reg_est:estadisticas);
procedure listar_pacientes(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure listar_provincia(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure listar2 (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas; pos:integer);
procedure ordenar_por_nombre (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure orden_dni (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure busqueda (var arch_inf:archivo_infectados; var buscado:string[8]; var pos:integer);
procedure orden_infectados (var arch_inf:archivo_infectados; i:byte);
procedure orden_provincia (var arch_prov:archivo_provincia; i:byte);
procedure orden_estadisticas (var arch_est:archivo_estadisticas; i:byte);
procedure menu_etario(var arch_inf:archivo_infectados);
procedure casos_act_rec_fall_prov(var arch_inf:archivo_infectados; var arch_est:archivo_estadisticas);
procedure casos_act_rec_fall_nacionales(var arch_est:archivo_estadisticas);
procedure formas_decontagio(var arch_est:archivo_estadisticas);

implementation

procedure crear_infectados (var arch_inf:archivo_infectados);
begin
    assign(arch_inf,'D:\Dev-Pas\tp final prog\infectados.dat');
  //assign(arch_inf,'D:\dev_Pas\tp final prog\infectados.dat');
  //assign(arch_inf,'C:\Dev-Pas\tp_final_prog\infectados.dat');                         //hay que asignarle la ruta en cada computadora
  {$i-}
  reset(arch_inf);
  {$i+}
  if ioresult <> 0 then
  rewrite(arch_inf);
  end;

procedure crear_provincias(var arch_prov:archivo_provincia);
begin
   assign(arch_prov,'D:\Dev-Pas\tp final prog\provincias.dat');
  //assign(arch_prov,'D:\dev_Pas\tp final prog\provincias.dat');
  //assign(arch_prov,'C:\Dev-Pas\tp_final_prog\provincias.dat');                       //hay que asignarle la ruta en cada computadora
  {$i-}
  reset(arch_prov);
  {$i+}
  if ioresult <> 0 then
  rewrite(arch_prov);
  end;
  
procedure crear_estadisticas(var arch_est:archivo_estadisticas);
begin
   assign(arch_est,'D:\Dev-Pas\tp final prog\estadistica.dat');
  //assign(arch_est,'D:\dev_Pas\tp final prog\estadistica.dat');
  //assign(arch_est,'C:\Dev-Pas\tp_final_prog\estadistica.dat');                       //hay que asignarle la ruta en cada computadora
  {$i-}
  reset(arch_est);
  {$i+}
  if ioresult <> 0 then
  rewrite(arch_est);
  end;

procedure abrir_infectados (var arch_inf:archivo_infectados);
begin
assign(arch_inf,'D:\dev_Pas\tp final prog\infectados.dat');
//assign(arch_inf,'C:\Dev-Pas\tp_final_prog\infectados.dat');                          //hay que asignarle la ruta en cada computadora
reset(arch_inf);
end;

procedure abrir_provincias (var arch_prov:archivo_provincia);
begin
assign(arch_prov,'D:\dev_Pas\tp final prog\provincias.dat');
//assign(arch_prov,'C:\Dev-Pas\tp_final_prog\provincias.dat');                           //hay que asignarle la ruta en cada computadora
reset(arch_prov);
end;

procedure abrir_estadisticas (var arch_est:archivo_estadisticas);
begin
assign(arch_est,'D:\dev_Pas\tp final prog\estadistica.dat');
//assign(arch_est,'C:\Dev-Pas\tp_final_prog\estadistica.dat');                             //hay que asignarle la ruta en cada computadora
reset(arch_est);
end;

procedure cerrar_infectados (var arch_inf:archivo_infectados);
begin
close(arch_inf);
end;

procedure cerrar_estadisticas (var arch_est:archivo_estadisticas);
begin
close(arch_est);
end;

procedure cerrar_provincias(var arch_prov:archivo_provincia);
begin
close(arch_prov);
end;

procedure guardar_infectados(var arch_inf:archivo_infectados; var pos:integer; reg:infectados);
begin
seek(arch_inf, pos);
write(arch_inf, reg);
end;

procedure guardar_estadisticas(var arch_est:archivo_estadisticas; var pos:integer; reg:estadisticas);
begin
seek(arch_est, pos);
write(arch_est, reg);
end;

procedure guardar_provincias(var arch_prov:archivo_provincia; var pos:integer; reg:provincia);
begin
seek(arch_prov, pos);
write(arch_prov, reg);
end;

procedure inicializar_infectados (var reg_inf:infectados);
begin
  with reg_inf do
  begin
    nombreyapellido:='';
    dni:='';
    edad:=0;
    with domicilio do
    begin
      calle:='';
      numero:=0;
      piso:=0;
      ciudad:='';
      provincia:='';
      cp:=0;
    end;
    telefonopaciente:='';
    email:='';
    fecha_nacimiento:='';
  end;  
  end;
  
procedure inicializar_provincias (var reg_prov:provincia);
begin 
  with reg_prov do
  begin
    denominacion:='';
    codigo_provincia:=0;
    telefono:='';
  end;  
  end;
  
procedure inicializar_estadisticas (var reg_est:estadisticas);
begin
  with reg_est do
  begin
    id:='';
    dni:='';
    codigo_provincia:=0;
    estado:='';
    forma_de_contagio:='';
    activo:=true;
  end;  
  end;

procedure cargar_infectados (var reg_inf:infectados);
begin
  with reg_inf do
  begin
    writeln ('Nombre y apellido: ');
    readln(nombreyapellido);
    writeln ('DNI: ');
    readln(dni);
    writeln('Edad: ');
    readln(edad);
    with domicilio do
    begin
      writeln ('Calle: ');
      readln (calle);
      writeln ('Numero del domicilio: ');
      readln (numero);
      writeln ('Piso: ');
      readln (piso);
      writeln ('Ciudad: ');
      readln (ciudad);
      writeln ('Provincia: ');
      readln (provincia);
      writeln ('Codigo postal: ');
      readln (cp);
    end;
    writeln ('Numero de telefono del paciente: ');
    readln(telefonopaciente);
    writeln ('E-mail: ');
    readln(email);
    writeln ('Fecha de nacimiento: dd/mm/aaaa');
    readln(fecha_nacimiento);
  end;
end;

procedure cargar_provincia (var reg_prov:provincia;reg_inf:infectados; v:vec_cod);
var i:byte;
begin
  with reg_prov do
  begin
    writeln('Telefono de emergencia');
    readln(telefono);
    denominacion:=reg_inf.domicilio.provincia;
    for  i:= 1 to 23 do 
    if upcase(denominacion) = v[i] then
      codigo_provincia := i;
  end;
end;

procedure cargar_estadisticas (var reg_est:estadisticas;reg_prov:provincia;reg_inf:infectados);
begin
  with reg_est do
  begin
  writeln('Ingrese el id: ');
  readln (id);
  codigo_provincia:=reg_prov.codigo_provincia;
  activo:=true;
  reg_est.estado:='Activo';
  writeln('Ingrese la forma de contagio:(contagio directo,transmisión comunitaria,desconocida)');
  readln(forma_de_contagio);
  end;
end;

procedure mostrar_reg_inf (var reg_inf:infectados);
begin
with reg_inf do
begin
  writeln ('Nombre: ',nombreyapellido);
  writeln ('DNI: ',dni);
  writeln('Edad: ',edad);
  with domicilio do
  begin
    writeln ('Calle: ',calle);
    writeln ('Numero: ',numero);
    writeln ('Piso: ',piso);
    writeln ('Provincia: ',provincia);
    writeln ('Ciudad: ',ciudad);
    writeln ('Codigo Postal: ',cp);
  end;
  writeln ('Telefono del paciente: ',telefonopaciente);
  writeln ('E-mail: ',email);
  writeln ('Fecha de nacimiento: ',fecha_nacimiento);
  end;
  end;
  
  
procedure mostrar_reg_prov (var reg_prov:provincia);
  begin	
  with reg_prov do
  begin
    writeln ('Denominacion: ',denominacion);
    writeln ('Codigo de provincia ',codigo_provincia);
    writeln ('Telefono por covid-19: ',telefono);
  end;
  end;
  
procedure mostrar_reg_est (var reg_est:estadisticas);
begin  
  with reg_est do
  begin
    writeln ('ID: ',id);
    writeln ('el codigo de provinica es: ',codigo_provincia);
    writeln('Estado: ',estado);
    writeln ('Forma de contagio: ',forma_de_contagio);
  end;
  readkey;
end;

procedure listar_pacientes(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);  // en este procedure se muestran todos los del pais
var 
reg1:infectados;
reg2:provincia;
reg3:estadisticas;

begin
     reset(arch_inf);                          //-reset- abrimos cada archivo
     reset(arch_prov);
     reset(arch_est);
     while not(eof(arch_inf)) do               //miestras no se llegue al final del archivo
     begin
          read(arch_inf, reg1);
          read(arch_prov,reg2);
          read(arch_est,reg3);
          if reg3.activo then                  //condicion para no mostrar los que estan dados de baja
          begin
          mostrar_reg_inf(reg1);
          mostrar_reg_prov(reg2);
          mostrar_reg_est(reg3);
          end;
          writeln();
     end;
     clrscr;
end;

procedure listar_provincia(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var 
reg1:infectados;
reg2:provincia;
reg3:estadisticas;
c_prov:string;
control:boolean;

begin
     control:=false;
     writeln('Ingrese la provincia');
     readln(c_prov);
     reset(arch_inf);
     reset(arch_prov);
     reset(arch_est);
     while not(eof(arch_inf)) do
     begin
          read(arch_inf, reg1);
          read(arch_prov,reg2);
          read(arch_est,reg3);
          if (reg3.activo) and (upcase(reg1.domicilio.provincia)=upcase(c_prov)) then       //condicion para mostrar los activos y los de la provincia especifica que ingresemos
          begin
          control:=true;
          mostrar_reg_inf(reg1);
          mostrar_reg_prov(reg2);
          mostrar_reg_est(reg3);
          end;
          writeln();
     end;
     clrscr;
     if not control then                                   //si la variable "control" es true no se muestra este mensaje
          begin
          writeln('No hay infectados en esta provincia');
          readkey;
          end;
end;



procedure listar2 (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas; pos:integer);
var
reg1:infectados;
reg2:provincia;
reg3:estadisticas;
begin
seek(arch_inf,pos);
read(arch_inf, reg1);
seek(arch_prov,pos);                                    //en este procedure se muestra los archivos en una posicion especifica
read(arch_prov, reg2);
seek(arch_est,pos);
read(arch_est, reg3);
mostrar_reg_inf(reg1);
mostrar_reg_prov(reg2);
mostrar_reg_est(reg3);
end;

procedure orden_infectados (var arch_inf:archivo_infectados; i:byte);
var reg_inf,aux_inf,aux:infectados;
begin
    seek (arch_inf,i);
    read (arch_inf,reg_inf);
    aux:=reg_inf;
    seek (arch_inf,i+1);                                                  //este procedure intecambia las posiciones de dos archivos
    read (arch_inf,aux_inf);
    seek (arch_inf,i);
    write(arch_inf,aux_inf);
    seek (arch_inf,i+1);
    write(arch_inf,aux);
end;

procedure orden_provincia (var arch_prov:archivo_provincia; i:byte);
var reg_prov,aux_prov,aux: provincia;
begin
    seek (arch_prov,i);
    read (arch_prov,reg_prov);
    aux:=reg_prov;
    seek (arch_prov,i+1);                                                  //este precedure intecambia las posiciones de dos archivos
    read (arch_prov,aux_prov);
    seek (arch_prov,i);
    write(arch_prov,aux_prov);
    seek (arch_prov,i+1);
    write(arch_prov,aux);
end;

procedure orden_estadisticas (var arch_est:archivo_estadisticas; i:byte);
var reg_est,aux_est,aux: estadisticas;
begin
    seek (arch_est,i);
    read (arch_est,reg_est);
    aux:=reg_est;
    seek (arch_est,i+1);                                                     //este procedure intecambia las posiciones de dos archivos
    read (arch_est,aux_est);
    seek (arch_est,i);
    write(arch_est,aux_est);
    seek (arch_est,i+1);
    write(arch_est,aux);
end;

procedure ordenar_por_nombre (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var
reg_inf,aux_inf:infectados;
lim,i,j:integer;

begin
     lim:=filesize(arch_inf)-1;

     for i:= 1 to lim  do
     begin
          for j:= 0 to lim - i do
          begin
               seek (arch_inf,j);
               read (arch_inf,reg_inf);
               seek (arch_inf,j+1);
               read (arch_inf,aux_inf);

               if (reg_inf.nombreyapellido > aux_inf.nombreyapellido) then      //se analiza si el nombre del primer archivo es mayor al segundo
               begin
                    orden_infectados (arch_inf,j);
                    orden_provincia (arch_prov,j);                              //llamamos a los procedures para el intercambio de la posicion de los archivos
                    orden_estadisticas (arch_est,j);
               end;
          end;
     end;
end;

procedure orden_dni (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var reg_inf,aux_inf:infectados;
lim,i,j:integer;

begin
     lim:= (filesize(arch_inf)-1);

     for i:= 1 to lim do
     begin
          for j:= 0 to lim - i do
              begin
                   seek (arch_inf,j);
                   read (arch_inf,reg_inf);
                   seek (arch_inf,j+1);
                   read (arch_inf,aux_inf);

                   if (reg_inf.dni>aux_inf.dni) then                      //se analiza si el dni del primer archivo es mayor al segundo
                   begin
                        orden_infectados (arch_inf,j);
                        orden_provincia (arch_prov,j);
                        orden_estadisticas (arch_est,j);
                   end;
              end;
     end;
end;

procedure busqueda (var arch_inf:archivo_infectados; var buscado:string[8]; var pos:integer);    //busqueda binaria
var reg_inf:infectados;
pri,ult,med:longint;

begin
     pri:=0;
     ult:= filesize (arch_inf)-1;
     pos := -1;

    while (pos = -1) and (pri<= ult) do
    begin
         med:= (pri + ult) div 2;
         seek (arch_inf,med);
         read (arch_inf,reg_inf);
         if reg_inf.dni = buscado then
         pos:= med
         else
         if reg_inf.dni < buscado then
         pri:= med + 1
         else ult:= med - 1;
    end;
end;

procedure menu_etario(var arch_inf:archivo_infectados);
var 
reg_inf:infectados;
cont_18,cont_18_50,cont_50:integer;
begin
     cont_18:=0;
     cont_18_50:=0;
     cont_50:=0;
     reset(arch_inf);
     while not(eof(arch_inf)) do              //mietras no se llegue al final del archivo
     begin
          read(arch_inf, reg_inf);
          if (reg_inf.edad<18) then
          inc(cont_18)
          else if (reg_inf.edad>=18)and(reg_inf.edad<50) then
          inc(cont_18_50)
          else inc(cont_50);
     end;
     writeln('Menores a 18: ',cont_18);
     writeln('18 a 49: ',cont_18_50);
     writeln('Mayores a 49: ',cont_50);
     readkey;
     clrscr;
end;

procedure casos_act_rec_fall_prov(var arch_inf:archivo_infectados; var arch_est:archivo_estadisticas);
var
reg_est:estadisticas;
reg_inf:infectados;
cont_act,cont_rec,cont_fall,total,pos:integer;
prov_b:string;
control:boolean;

begin
     cont_act:=0;
     cont_rec:=0;
     cont_fall:=0;
     total:=0;
     control:=false;
     prov_b:='';
     reset(arch_est);
     reset(arch_inf);
     pos:=0;
     writeln('Ingrese la provincia que desea ver: ');
     readln(prov_b);
     while not eof(arch_inf) do
     begin
          read(arch_inf, reg_inf);
          if upcase(reg_inf.domicilio.provincia)=upcase(prov_b) then
          begin
               pos:=FilePos(arch_inf);
               inc(total);                                                          //procedure para calcular todos los "estados" en una provincia especifica ingresada por el usuario
               control:=true;
               seek(arch_est,pos-1);
               read(arch_est,reg_est);
               writeln(reg_est.estado);
               pos:=0;
               if upcase(reg_est.estado)='ACTIVO' then
                  inc(cont_act)
               else if upcase(reg_est.estado)='RECUPERADO' then
                    inc(cont_rec)
               else if upcase(reg_est.estado)='FALLECIDO' then
                    inc(cont_fall);
          end;
     end;

     if control=true then
     begin
          clrscr;
          writeln('Casos en ',prov_b);
          writeln();
          writeln('Pacientes activos: ',cont_act);
          writeln('Representan el ',(cont_act*100)/total:1:0,'% de ',prov_b);
          writeln();
          writeln('Pacientes recuperados: ',cont_rec);
          writeln('Representan el ',(cont_rec*100)/total:1:0,'% de ',prov_b);
          writeln();
          writeln('Pacientes fallecidos: ',cont_fall);
          writeln('Representan el ',(cont_fall*100)/total:1:0,'% de ',prov_b);
          readkey;
     end
     else
     begin
          writeln('No hay infectados en esta provincia');
          readkey;
     end;
end;

procedure casos_act_rec_fall_nacionales(var arch_est:archivo_estadisticas);
var 
reg_est:estadisticas;
cont_act,cont_rec,cont_fall:integer;
begin
     cont_act:=0;
     cont_rec:=0;
     cont_fall:=0;
     reset(arch_est);
     while not(eof(arch_est)) do
     begin
          read(arch_est, reg_est);
          if upcase(reg_est.estado)='ACTIVO' then
             inc(cont_act)                                                      //procedure para contar los "estados" de los casos que hay en el pais
          else if upcase(reg_est.estado)='RECUPERADO' then
               inc(cont_rec)
          else if upcase(reg_est.estado)='FALLECIDO' then
               inc(cont_fall);
     end;
     clrscr;
     writeln('Casos nacionales:');
     writeln();
     writeln('Pacientes activos: ',cont_act);
     writeln('Pacientes recuperados: ',cont_rec);
     writeln('Pacientes fallecidos: ',cont_fall);
     readkey;
     clrscr;
end;

procedure formas_decontagio(var arch_est:archivo_estadisticas);
var
cont_dir,cont_comun,cont_desc:integer;
reg_est:estadisticas;
begin
     cont_dir:=0;
     cont_comun:=0;
     cont_desc:=0;
     reset(arch_est);
     while not(eof(arch_est)) do
     begin
          read(arch_est, reg_est);
          if upcase(reg_est.forma_de_contagio)='CONTAGIO DIRECTO' then
             inc(cont_dir)
          else if upcase(reg_est.forma_de_contagio)='TRANSMISION COMUNITARIA' then      //procedure para contar los "tipos de contagios" que hay registrados en el pais
               inc(cont_comun)
          else if upcase(reg_est.forma_de_contagio)='DESCONOCIDA' then
               inc(cont_desc);
     end;
     writeln('Contagio directo: ',cont_dir);
     writeln('Transmicion comunitaria: ',cont_comun);
     writeln('Desconocida: ',cont_desc);
     readkey;
     clrscr;

end;

begin
end.
