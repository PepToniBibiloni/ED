with ada.text_io;use ada.text_io;
with dllista;
procedure Main is
   package List is new dllista;
   use List;
   primer: List.pnode;
   ll: llibre;
   c: Integer;
   aux: String(1..20);
    procedure lecturaString(tmp: in out string) is
      n:natural;
   begin
      get_line(tmp,n);
      if n>=tmp'Length then
         skip_line;
      end if;
      if (n<tmp'Length) then
         for var in (n+1)..tmp'Length loop
            tmp(var):=' ';
         end loop;
      end if;
   end lecturaString;
   procedure lectura(ll:in out llibre) is
   begin
      put("Titol: ");
      lecturaString(ll.titol);
      put("Autor: ");
      lecturaString(ll.autor);
      put("ISBM: ");
      lecturaString(ll.isbm);
      put("Any: ");
      ll.any:=Integer'Value(Get_Line);
   end lectura;
   procedure menu is
      begin
      Put_Line("--------MENU--------");
      Put_Line("0) Introduir llibre");
      Put_Line("1) Cercar per titol");
      Put_Line("2) Cercar per ISBM");
      Put_Line("3) Cercar per autor");
      Put_Line("4) Cercar per any");
      Put_Line("5) Sortir");
   end menu;
begin
   primer:=new node;
   menu;
   c:=Integer'Value(Get_Line);
   while c/= 5 loop
      case c is
      when 0 =>
         lectura(ll);
         insertar(primer,ll);
      when 1 =>
         Put("Introdueix titol: ");
         lecturaString(aux);
         cercarXtitol(primer,aux);
      when 2 =>
         Put("Introdueix ISBM: ");
         lecturaString(aux);
         cercarXisbm(primer,aux);
      when 3 =>
         Put("Introdueix autor: ");
         lecturaString(aux);
         cercarXautor(primer,aux);
      when 4 =>
         Put("Introdueix any: ");
         c:=Integer'Value(Get_Line);
         cercarXany(primer,c);
      when others =>
         null;
      end case;
      menu;
      c:=Integer'Value(Get_Line);
   end loop;
end Main;
