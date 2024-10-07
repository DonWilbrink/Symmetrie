unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mniCycloide: TMenuItem;
    mniWervel: TMenuItem;
    mniHoofdstuk2: TMenuItem;
    mniBloem: TMenuItem;
    pbMain: TPaintBox;
    procedure mniCycloideClick(Sender: TObject);
    procedure mniBloemClick(Sender: TObject);
    procedure mniWervelClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  EgaColor : array[0..15] of TColor =
    (TColor($000000),TColor($AA0000),TColor($00AA00),TColor($AAAA00),
     TColor($0000AA),TColor($AA00AA),TColor($0055AA),TColor($AAAAAA),
     TColor($555555),TColor($FF5555),TColor($55FF55),TColor($FFFF55),
     TColor($5555FF),TColor($FF55FF),TColor($55FFFF),TColor($FFFFFF));

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.mniBloemClick(Sender: TObject);
var
  a, c, k, m, n, xOff, yOff: Integer;
  b, r, t, x, y, xFac, yFac: Double;
begin
  pbMain.Canvas.Clear;
  a := 1;
  b := 1.5;
  c := 1;
  m := 7;
  n := 400;
  xOff := pbMain.Canvas.Width div 2;
  yOff := pbMain.Canvas.Height div 2;
  yfac := -pbMain.Canvas.Height/6;
  xFac := -yFac;
  for k := 0 to n do
  begin
    t := 2*k*pi/n;
    r := a+b*Cos(m*t+c*Cos(m*t));
    x := r*Cos(t);
    y := r*Sin(t);
    if k = 0 then pbMain.Canvas.MoveTo(Trunc(xFac*x+xOff),Trunc(yFac*y+yOff)) else
      pbMain.Canvas.LineTo(Trunc(xFac*x+xOff),Trunc(yFac*y+yOff));
  end;
end;

procedure TForm1.mniCycloideClick(Sender: TObject);
var
  k, m, n, xOff, yOff: Integer;
  t, x1, x2, y1, y2, xFac, yFac: Double;
begin
  pbMain.Canvas.Clear;
  //pbMain.Canvas.TextOut(pbMain.Canvas.Width div 2, pbMain.Canvas.Height div 2, 'C');
  xOff := pbMain.Canvas.Width div 2;
  yOff := pbMain.Canvas.Height div 2;
  yFac := pbMain.Canvas.Height/2.2;
  xFac := yFac;
  m := 7;
  n := 180;
  for k := 1 to n do
  begin
    t := 2*k*pi/n;
    x1 := Cos(t);
    y1 := Sin(t);
    x2 := Cos(m*t);
    y2 := Sin(m*t);
    pbMain.Canvas.Line(Trunc(x1*xFac+xOff),Trunc(y1*yFac+yOff),Trunc(x2*xFac+xOff),
                       Trunc(y2*yFac+yOff));
  end;
end;

procedure TForm1.mniWervelClick(Sender: TObject);
var
  x, y: Array[0..7] of Double;
  i, j, k, l, m, n, xOff, yOff: Integer;
  a, c, f, t, xFac, yFac, z: Double;
begin
  pbMain.Canvas.Clear;
  xOff := pbMain.Canvas.Width div 2;
  yOff := pbMain.Canvas.Height div 2;
  yFac := -pbMain.Canvas.Height/2.2;
  xFac := -yFac;
  m := 7;
  a := 0.05;
  n := Trunc(4*pi/(m*a));
  f := (m-2)*pi/m;
  c := Sin(f)/(Sin(a+f)+Sin(a));
  for i := 0 to m do
  begin
    t := (2*i+1)*pi/m;
    x[i] := Sin(t);
    y[i] := Cos(t);
  end;
  for j := 0 to n do
  begin
    pbMain.Canvas.MoveTo(Trunc(x[0]*xFac+xOff),Trunc(y[0]*yFac+yOff));
    for k := 1 to m do
    begin
      pbMain.Canvas.LineTo(Trunc(x[k]*xFac+xOff),Trunc(y[k]*yFac+yOff));
    end;
    for l := 0 to m do
    begin
      z := x[l];
      x[l] := (x[l]*Cos(a)-y[l]*Sin(a))*c;
      y[l] := (z*Sin(a)+y[l]*Cos(a))*c;
    end;
  end;
end;

end.

