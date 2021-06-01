unit unit_menu;

interface
uses crt,archivos_tpfinal;

const n = 23;

type
opc=byte;
vec_cod = array [1..23] of string[25];

procedure inicializar_vec_cod(var v:vec_cod);
procedure cargar_codigo_provincia (var prov: vec_cod);
procedure menu_principal(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure menu_abmc(var arch_inf:archivo_infectados;var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure menu_estadisticas(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure alta (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure baja (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure modificar (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure consultar (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
procedure listados(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);

implementation
procedure inicializar_vec_cod(var v:vec_cod);
var j:integer;
begin
     for j:= 1 to n do
     v[j]:=' ';
end;

procedure cargar_codigo_provincia (var prov: vec_cod);
begin
     prov[1]:='BUENOS AIRES';
     prov[2]:='CATAMARCA';
     prov[3]:='CORRIENTES';
     prov[4]:='CORDOBA';
     prov[5]:='CHACO';
     prov[6]:='CHUBUT';
     prov[7]:='ENTRE RIOS';                                  //asignamos el codigo a cada provincia
     prov[8]:='FORMOSA';
     prov[9]:='JUJUY';
     prov[10]:='LA RIOJA';
     prov[11]:='LA PAMPA';
     prov[12]:='MISIONES';
     prov[13]:='MENDOZA';
     prov[14]:='NEUQUEN';
     prov[15]:='RIO NEGRO';
     prov[16]:='SALTA';
     prov[17]:='SAN LUIS';
     prov[18]:='SANTA CRUZ';
     prov[19]:='SANTIAGO DEL ESTERO';
     prov[20]:='SAN JUAN';
     prov[21]:='SANTA FE';
     prov[22]:='TUCUMAN';
     prov[23]:='TIERRA DEL FUEGO';
end;

procedure menu_principal(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var
opc:byte;
begin
     repeat
     gotoxy(13,2);
     writeln('--BIENVENIDO AL CENTRO DE REGISTRO DE INFECTADOS ARGENTINA--');
     writeln();
     writeln('Ingrese una opcion: ');
     writeln('1. ABMC');             //llamamos al menu alta, baja, modificar, consultar
     writeln('2. Listados');         //llamamos al menu listados
     writeln('3. Estadisticas');     //llamamos al menu estadisticas
     writeln('4. Salir');
     readln(opc);
     case opc of
     1: menu_abmc(arch_inf,arch_prov,arch_est);
     2: listados(arch_inf,arch_prov,arch_est);
     3: menu_estadisticas(arch_inf,arch_prov,arch_est);
     end;
     if (opc>4) or (opc<1) then
        begin
             writeln('La opcion ingresada es incorrecta, pulse una tecla para continuar.');
             readkey;
             clrscr;
        end; until opc=4;
end;

procedure menu_abmc(var arch_inf:archivo_infectados;var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var
opc:byte;
begin
     clrscr;
     repeat
     writeln('--MENU ABMC--');
     writeln('1. Alta');
     writeln('2. Baja');
     writeln('3. Modificar');
     writeln('4. Consultar');
     writeln('5. Menu principal');
     writeln('6. Salir');
     readln(opc);
     clrscr;
     case opc of
          1:alta(arch_inf,arch_prov,arch_est);
          2:baja(arch_inf,arch_prov,arch_est);
          3:modificar(arch_inf,arch_prov,arch_est);
          4:consultar(arch_inf,arch_prov,arch_est);
          5:menu_principal(arch_inf,arch_prov,arch_est);
     end;
          if (opc>6) or (opc<1) then
          begin
          writeln('La opcion ingresada es incorrecta, pulse una tecla para continuar.');
          readkey;
          end;
     clrscr;
     until opc=6;
end;

procedure listados(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var
opc:byte;
begin
     repeat
     clrscr;
     writeln('MENU LISTADOS');
     writeln('Ingrese una opcion: ');
     writeln('1. Provincial');
     writeln('2. Nacional');
     writeln('3. Menu principal');
     writeln('4. Salir');
     readln(opc);
     clrscr;
     case opc of
     1:begin
     listar_provincia(arch_inf,arch_prov,arch_est);
     ordenar_por_nombre(arch_inf,arch_prov,arch_est);
     end;
     2:begin
     ordenar_por_nombre(arch_inf,arch_prov,arch_est);
     listar_pacientes(arch_inf,arch_prov,arch_est);
     end;
     3:menu_principal(arch_inf,arch_prov,arch_est);
     end;
     if (opc<1) or (opc>4) then
     begin
     writeln('La opcion ingresada es incorrecta, oprima una tecla');
     readkey;
     end; until opc=4;
end;

procedure menu_estadisticas(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);
var
opc:byte;
begin
     repeat
     clrscr;
     writeln('MENU ESTADISTICAS');
     writeln('Ingrese una opcion: ');
     writeln('1. Casos activos, recuperados y fallecidos provinciales');
     writeln('2. Casos activos, recuperados y fallecidos nacionales');
     writeln('3. Rango etario');
     writeln('4. Formas de contagio');
     writeln('5. Menu principal');
     writeln('6. Salir');
     readln(opc);
     clrscr;
     case opc of
     1:casos_act_rec_fall_prov(arch_inf,arch_est);
     2:casos_act_rec_fall_nacionales(arch_est);
     3:menu_etario(arch_inf);
     4:formas_decontagio(arch_est);
     5:menu_principal(arch_inf,arch_prov,arch_est);
     end; until opc=6;
end;


procedure alta(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);     //procedure para agregar un infectado al archivo
var 
lim:integer;
pos:integer;
buscado:string[8];
nueva_ingreso:char;
reg_inf:infectados;
reg_prov:provincia;
reg_est:estadisticas;
v:vec_cod;

begin
     inicializar_vec_cod(v);
     cargar_codigo_provincia(v);
     inicializar_infectados (reg_inf);
     inicializar_provincias (reg_prov);
     inicializar_estadisticas (reg_est);
     clrscr;
     writeln('MENU DE ALTAS');
     writeln();
     writeln('Ingrese DNI del paciente para comprobar si existe en la base de datos: ');
     readln(buscado);
     orden_dni (arch_inf,arch_prov,arch_est);
     busqueda (arch_inf,buscado,pos);                     //analizamos si el paciente ya estaba en el sistema con anterioridad
     if (pos <> -1) then
     begin
     writeln('El paciente buscado ya esta en el sistema.');
     readkey;
     end
     else if (pos = -1) then
     begin
          clrscr;
          writeln('El paciente introducido no fue encontrado. Desea agregarlo al sistema? s/n');
          readln(nueva_ingreso);
          clrscr;
          if  upcase(nueva_ingreso)='S' then
          begin
               cargar_infectados (reg_inf);
               cargar_provincia (reg_prov ,reg_inf, v);
               cargar_estadisticas (reg_est, reg_prov ,reg_inf);

               lim:= filesize (arch_inf) -1;
               inc(lim);

               guardar_infectados (arch_inf,lim,reg_inf);
               guardar_provincias(arch_prov,lim,reg_prov);
               guardar_estadisticas(arch_est,lim,reg_est);
               clrscr;
               gotoxy(15,23);
               writeln('El paciente fue ingresado con exito, oprima una tecla');
               readkey;
          end;
     end;
end;

procedure baja (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas); //procedure para dar de baja un paciente
var
pos:integer;
buscado:string[8];
reg_est:estadisticas;
estado_:string;

begin
     writeln('--Usted esta en el menu bajas--');
     writeln('Ingrese dni a dar de baja');
     readln(buscado);
     orden_dni (arch_inf,arch_prov,arch_est);
     busqueda (arch_inf,buscado,pos);
     seek(arch_est,pos);
     read(arch_est,reg_est);
     writeln('Ingrese el estado del paciente: ');                                //ingresamos el nuevo estado del paciente y se da de baja
     readln(estado_);
     if (upcase(estado_)='RECUPERADO') or (upcase(estado_)='FALLECIDO') then
     begin
          reg_est.activo:= false;
          reg_est.estado:=estado_;
          guardar_estadisticas(arch_est,pos,reg_est);
          writeln ('El paciente fue dado de baja');
          readkey;
     end;
end;

procedure modificar (var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas);  //procedure para modificar un campo especifico del archivo
var
pos,i:integer;
buscado:string[8];
reg_inf:infectados;
reg_prov:provincia;
reg_est:estadisticas;
v:vec_cod;
opc:byte;

begin
     inicializar_vec_cod(v);
     cargar_codigo_provincia(v);
     inicializar_infectados (reg_inf);
     inicializar_provincias (reg_prov);
     inicializar_estadisticas (reg_est);
     writeln('Usted esta en el menu modificar');
     writeln('Ingrese el dni del paciente');
     readln(buscado);
     orden_dni (arch_inf,arch_prov,arch_est);
     busqueda (arch_inf,buscado,pos);

     seek(arch_inf,pos);
     read(arch_inf,reg_inf);
     seek(arch_prov,pos);
     read(arch_prov,reg_prov);
     seek(arch_est,pos);
     read(arch_est,reg_est);

     writeln('Ingrese el campo que desea cambiar: ');
     writeln('1. Nombre y apellido');
     writeln('2. DNI');
     writeln('3. Edad');
     writeln('4. Ciudad');
     writeln('5. Provincia');
     writeln('6. Piso');
     writeln('7. Codigo postal');
     writeln('8. Calle');
     writeln('9. Numero de domicilio');
     writeln('10. Telefono');
     writeln('11. E-Mail');
     writeln('12. Fecha de nacimiento');
     writeln('13. ID    ');
     writeln('14. Estado');
     writeln('15. Forma de contagio');
     readln(opc);

     case opc of
          1:begin
                 writeln('Nombre y apellido: ');
                 readln(reg_inf.nombreyapellido);
          end;
          2:begin
                 writeln('DNI: ');
                 readln(reg_inf.dni);
          end;
          3:begin
                 writeln('Edad: ');
                 readln(reg_inf.edad);
            end;
          4:begin
                 writeln('Ciudad: ');
                 readln(reg_inf.domicilio.ciudad);
            end;
          5:begin
                 writeln('Provincia: ');
                 readln(reg_inf.domicilio.provincia);
                 reg_prov.denominacion:=reg_inf.domicilio.provincia;       //se asigna la "denominacion" y el "codigo" automaticamente
                 for  i:= 1 to 23 do 
                 if upcase(reg_prov.denominacion) = v[i] then
                 reg_prov.codigo_provincia := i;
            end;
          6:begin
                 writeln('Piso: ');
                 readln(reg_inf.domicilio.piso);
            end;
          7:begin
                 writeln('Codigo postal: ');
                 readln(reg_inf.domicilio.cp);
            end;
          8:begin
                 writeln('Calle: ');
                 readln(reg_inf.domicilio.calle)
            end;
          9:begin
                 writeln('Numero de domicilio: ');
                 readln(reg_inf.domicilio.numero);
            end;
          10:begin
                  writeln('Telefono: ');
                  readln(reg_inf.telefonopaciente);
             end;
          11:begin
                  writeln('E-Mail: ');
                  readln(reg_inf.email);
             end;
          12:begin
                  writeln('Fecha de nacimiento: ');
                  readln(reg_inf.fecha_nacimiento);
             end;
          13:begin
                  writeln('ID: ');
                  readln(reg_est.id);
             end;
          14:begin
                  writeln('Estado: ');
                  readln(reg_est.estado);
                  if upcase(reg_est.estado)='ACTIVO' then        //si fue dado de baja erroneamente, se puede volver a ingresar al sistema como "activo"
                  reg_est.activo:=true;
             end;
          15:begin
                  writeln('Forma de contagio: ');
                  readln(reg_est.forma_de_contagio);
             end;
      end;
     guardar_infectados(arch_inf,pos,reg_inf);
     guardar_provincias(arch_prov,pos,reg_prov);         //guardamos todos los cambios
     guardar_estadisticas(arch_est,pos,reg_est);
     clrscr;
     gotoxy(14,7);
     textcolor(yellow);
     writeln('Los cambios fueron realizados con exito');
     delay(2000);
     clrscr;
     textcolor(LightGray);
end;

procedure consultar(var arch_inf:archivo_infectados; var arch_prov:archivo_provincia; var arch_est:archivo_estadisticas); //procedure para consultar un archivo especifico
var
pos:integer;
buscado:string[8];

begin
     clrscr;
     writeln('Usted esta en el menu consultar');
     writeln('Ingrese dni del paciente ');
     readln(buscado);
     orden_dni (arch_inf,arch_prov,arch_est);
     busqueda (arch_inf,buscado,pos);
     readkey;
     clrscr;
     if (pos <> -1) then
     begin
          writeln('El paciente fue encontrado, datos: ');
          listar2(arch_inf,arch_prov,arch_est,pos);            //listamos los datos del paciente, si fue encontrado
     end
     else
     begin
          writeln('El paciente no fue encontrado');
          writeln('Oprima una tecla para continuar');
          readkey;
     end;
end;



begin

end.
