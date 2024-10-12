unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    lblParameter2: TLabel;
    lblParameter: TLabel;
    MainMenu1: TMainMenu;
    mniRand: TMenuItem;
    mniHoofdstuk3: TMenuItem;
    mniCycloide: TMenuItem;
    mniWervel: TMenuItem;
    mniHoofdstuk2: TMenuItem;
    mniBloem: TMenuItem;
    Panel1: TPanel;
    pbMain: TPaintBox;
    seParameter: TSpinEdit;
    seParameter2: TSpinEdit;
    procedure mniCycloideClick(Sender: TObject);
    procedure mniBloemClick(Sender: TObject);
    procedure mniRandClick(Sender: TObject);
    procedure mniWervelClick(Sender: TObject);
    procedure seParameter2Change(Sender: TObject);
    procedure seParameterChange(Sender: TObject);
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

procedure TForm1.mniRandClick(Sender: TObject);
var
  c, c0, h, i, m, n, p, q, s, v, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array of Integer;

  procedure Gosub450;
  var
    k: Integer;
  begin
    pbMain.Canvas.MoveTo(Trunc((c0*i+10+p*x[1])*xFac+xOff),Trunc((q*y[1])*yFac+yOff));
    for k := 2 to m do
      pbMain.Canvas.LineTo(Trunc((c0*i+10+p*x[k])*xFac+xOff),Trunc(q*y[k]*yFac+yOff));
  end;

begin
  pbMain.Canvas.Clear;
  xOff := -100; //pbMain.Canvas.Width div 2;
  yOff := pbMain.Canvas.Height div 2;
  yFac := pbMain.Canvas.Height / 128;
  xFac := pbMain.Canvas.Width / 240;
  seParameter.MaxValue := 7;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Typekeuze';
  seParameter2.MaxValue := 12;
  seParameter2.MinValue := 5;
  lblParameter2.Caption := 'Horizontale verplaatsing';
  m := 11;
  x := [0,0,0,8,8,4,4,6,6,2,2,6];
  y := [0,-8,8,8,2,2,4,4,6,6,0,0];
  c := seParameter2.Value;
  h := 120;
  v := 90;
  p := 1;
  q := 1;
  n := Trunc((h-16)/c);
  s := seParameter.Value;
  case s of
    1:
    begin
      c0 := c;
      for i := 1 to 2*n do
        Gosub450;
    end;
    2:
    begin
      c0 := c;
      for i := 1 to 2*n do
      begin
        Gosub450;
        q := -q;
        Gosub450;
      end;
    end;
    3:
    begin
      c0 := 2*c;
      for i := 1 to n do
      begin
        Gosub450;
        p := -p;
        Gosub450;
      end;
    end;
    4:
    begin
      c0 := 2*c;
      for i := 1 to n do
      begin
        Gosub450;
        p := -p;
        q := -q;
        Gosub450;
      end;
    end;
    5:
    begin
      c0 := 2*c;
      for i := 1 to n do
      begin
        Gosub450;
        p := -p;
        Gosub450;
        q := -q;
        Gosub450;
        p := -p;
        Gosub450;
      end;
    end;
    6:
    begin
      c0 := c;
      i := 1;
      while i <= 2*n do
      begin
        Gosub450;
        i := i+2;
      end;
      q := -q;
      i := 2;
      while i <= 2*n do
      begin
        Gosub450;
        i := i+2;
      end;
    end;
    7:
    begin
      c0 := 2*c;
      i := 1;
      while i <= n do
      begin
        Gosub450;
        p := -p;
        Gosub450;
        i := i+2;
      end;
      q := -q;
      i := 2;
      while i <= n do
      begin
        Gosub450;
        p := -p;
        Gosub450;
        i := i+2;
      end;
    end;
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

procedure TForm1.seParameter2Change(Sender: TObject);
begin
  mniRandClick(Sender);
end;

procedure TForm1.seParameterChange(Sender: TObject);
begin
  mniRandClick(Sender);
end;

end.

