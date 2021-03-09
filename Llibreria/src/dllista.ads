with ada.text_io;use ada.text_io;
with Ada.Integer_Text_IO;use Ada.Integer_Text_IO;
generic

package dllista is
   type llibre is record
      any: Integer;
      autor: String(1..20);
      titol: String(1..20);
      isbm: String(1..20);
      end record;
   type dllista is private;
   type node;
   type pnode is access all node;
   type node is record
      x: llibre;
      sig: pnode;
   end record;
   procedure insertar(primero: in out pnode; x: in llibre);
   procedure imprimirLlibre(ll: in llibre);
   procedure cercarXtitol(primero: in pnode; x: in out String);
   procedure cercarXisbm(primero: in pnode; x: in out string);
   procedure cercarXautor(primero: in pnode; x: in out string);
   procedure cercarXany(primero: in pnode; x: in Integer);
private
   type dllista is record
      primer: node;
   end record;
end dllista;
