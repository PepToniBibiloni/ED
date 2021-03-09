with Ada.Text_IO;use Ada.Text_IO;
package body dllista is
   procedure insertar(primero: in out pnode; x: in llibre) is
      p, pp, r: pnode;
   begin
      pp:= null; p:= primero;
      while p/=null and then p.x.any >= x.any loop
         pp:= p; p:= p.sig;
      end loop;
      r:= new node; r.all:= (x, null);
      r.sig:= p;
      if pp=null then
         primero:= r;
      else
         pp.sig:= r;
      end if;
   end insertar;
   procedure imprimirLlibre(ll: in llibre) is
      begin
      Put_Line("-------LLIBRE-------");
      Put_Line("Titol: "& ll.titol);
      Put_Line("ISBM: "&ll.isbm);
      Put_Line("Autor: "&ll.autor);
      Put_Line("Any: "&Integer'Image(ll.any));
   end imprimirLlibre;
   procedure cercarXtitol (primero: in pnode; x: in out string) is
      p: pnode;
   begin
      if (x'Length<20) then
         for var in (x'Length+1)..20 loop
            x(var):=' ';
         end loop;
      end if;
      p := primero;
      while p /= null and then p.x.titol /= x loop
         p:=p.sig;
      end loop;
      if(p.x.titol=x) then
         imprimirLlibre(p.x);
      else
         Put_Line("No trobat");
      end if;
   end cercarXtitol;
   procedure cercarXisbm (primero: in pnode; x: in out string) is
      p: pnode;
   begin
      if (x'Length<20) then
         for var in (x'Length+1)..20 loop
            x(var):=' ';
         end loop;
      end if;
      p := primero;
      while p /= null and then p.x.isbm /= x loop
         p:=p.sig;
      end loop;
      if(p.x.isbm=x) then
         imprimirLlibre(p.x);
      else
         Put_Line("No trobat");
      end if;
   end cercarXisbm;
   procedure cercarXautor (primero: in pnode; x: in out string) is
      p: pnode;
   begin
      if (x'Length<20) then
         for var in (x'Length+1)..20 loop
            x(var):=' ';
         end loop;
      end if;
      p := primero;
      while p /= null loop
         if(p.x.autor=x) then
            imprimirLlibre(p.x);
         end if;
         p:=p.sig;
      end loop;
   end cercarXautor;
   procedure cercarXany (primero: in pnode; x: in Integer) is
      p: pnode;
   begin
      p := primero;
      while p /= null and then p.x.any >= x loop
         Put_Line(Integer'Image(p.x.any));
         if(p.x.any=x) then
            imprimirLlibre(p.x);
         end if;
         p:=p.sig;
      end loop;
   end cercarXany;
end dllista;
