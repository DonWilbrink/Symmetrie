unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin, Math;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    lblParameter3: TLabel;
    lblParameter4: TLabel;
    lblParameter2: TLabel;
    lblParameter: TLabel;
    MainMenu1: TMainMenu;
    mniQuadrt: TMenuItem;
    mniHexah: TMenuItem;
    mniTrip: TMenuItem;
    mniQuadrp: TMenuItem;
    mniEscher: TMenuItem;
    mniPolyeder: TMenuItem;
    mniZeepaard: TMenuItem;
    mniVissen: TMenuItem;
    mniKatten: TMenuItem;
    mniCairo: TMenuItem;
    mniStert: TMenuItem;
    mniMoskee: TMenuItem;
    mniOverig: TMenuItem;
    mniParket3: TMenuItem;
    mniParket2: TMenuItem;
    mniParket1: TMenuItem;
    mniStempel: TMenuItem;
    mniKleed: TMenuItem;
    mniHoofdstuk7: TMenuItem;
    mniHexa: TMenuItem;
    mniTri: TMenuItem;
    mniQuadr: TMenuItem;
    mniRuit: TMenuItem;
    mniRaam: TMenuItem;
    mniParal: TMenuItem;
    mniHoofdstuk4: TMenuItem;
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
    seParameter3: TSpinEdit;
    seParameter4: TSpinEdit;
    procedure mniCairoClick(Sender: TObject);
    procedure mniEscherClick(Sender: TObject);
    procedure mniHexaClick(Sender: TObject);
    procedure mniHexahClick(Sender: TObject);
    procedure mniKattenClick(Sender: TObject);
    procedure mniKleedClick(Sender: TObject);
    procedure mniMoskeeClick(Sender: TObject);
    procedure mniParket1Click(Sender: TObject);
    procedure mniParket2Click(Sender: TObject);
    procedure mniParket3Click(Sender: TObject);
    procedure mniPolyederClick(Sender: TObject);
    procedure mniQuadrClick(Sender: TObject);
    procedure mniQuadrpClick(Sender: TObject);
    procedure mniQuadrtClick(Sender: TObject);
    procedure mniRuitClick(Sender: TObject);
    procedure mniRaamClick(Sender: TObject);
    procedure mniCycloideClick(Sender: TObject);
    procedure mniBloemClick(Sender: TObject);
    procedure mniParalClick(Sender: TObject);
    procedure mniRandClick(Sender: TObject);
    procedure mniStempelClick(Sender: TObject);
    procedure mniStertClick(Sender: TObject);
    procedure mniTriClick(Sender: TObject);
    procedure mniTripClick(Sender: TObject);
    procedure mniVissenClick(Sender: TObject);
    procedure mniWervelClick(Sender: TObject);
    procedure mniZeepaardClick(Sender: TObject);
    procedure seParameter2Change(Sender: TObject);
    procedure seParameter3Change(Sender: TObject);
    procedure seParameter4Change(Sender: TObject);
    procedure seParameterChange(Sender: TObject);
  private
    procedure ClearPb;
  public

  end;

var
  frmMain: TfrmMain;
  prog: Integer;
  EgaColor : array[0..15] of TColor =
    (TColor($000000),TColor($AA0000),TColor($00AA00),TColor($AAAA00),
     TColor($0000AA),TColor($AA00AA),TColor($0055AA),TColor($AAAAAA),
     TColor($555555),TColor($FF5555),TColor($55FF55),TColor($FFFF55),
     TColor($5555FF),TColor($FF55FF),TColor($55FFFF),TColor($FFFFFF));

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.mniBloemClick(Sender: TObject);
var
  a, c, k, m, n, xOff, yOff: Integer;
  b, r, t, x, y, xFac, yFac: Double;
begin
  prog := 1;
  ClearPb;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniBloem.Caption + ']';
  a := 1;
  b := 1.5;
  c := 1;
  m := 7;
  n := 400;
  xOff := pbMain.Width div 2 - 120;
  yOff := pbMain.Height div 2;
  yfac := -pbMain.Height/6;
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

procedure TfrmMain.mniParalClick(Sender: TObject);
var
  a, x1, y1, xFac, yFac: Double;
  b, c, f, i, i1, i2, j, k, m, n, n1, n2, r, s, xOff, yOff: Integer;
  x, y: Array of Integer;
begin
  prog := 5;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniParal.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Schaalfactor motief';
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  a := 3.16;
  b := 5;
  c := 8;
  x := [0,0,3,3,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,0,1,0,0,0,0,0];
  r := seParameter2.Value;
  m := 4;
  for i := 1 to m do
  begin
    x[i] := r*x[i];
    y[i] := r*y[i];
  end;
  s := seParameter.Value;
  case s of
    1:
    begin
      f := 1;
    end;
    2:
    begin
      f := 2;
      for n := 1 to m do
      begin
        x[m+n] := -x[n];
        y[m+n] := -y[n];
      end;
    end;
  end;
  for n2 := 1 to Trunc(60/b)-1 do
  begin
    i1 := Trunc(-a*n2/c)+1;
    i2 := Trunc((80-a*n2)/c)-1;
    for n1 := i1 to i2 do
    begin
      x1 := c*n1+a*n2;
      y1 := b*n2;
      for j := 0 to f-1 do
      begin
        pbMain.Canvas.MoveTo(Trunc((x1+x[j*m+1])*xFac+xOff),Trunc((y1+y[j*m+1])*yFac+yOff));
        for k := 2 to m do
        begin
          pbMain.Canvas.LineTo(Trunc((x1+x[j*m+k])*xFac+xOff),Trunc((y1+y[j*m+k])*yFac+yOff));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniRandClick(Sender: TObject);
var
  c, c0, h, i, m, n, p, q, s, {v,} xOff, yOff: Integer;
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
  prog := 4;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniRand.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  xOff := 0;
  yOff := pbMain.Height div 2;
  yFac := pbMain.Height / 128;
  xFac := pbMain.Width / 240;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 7;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Typekeuze';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 12;
  seParameter2.MinValue := 5;
  lblParameter2.Caption := 'Horizontale verplaatsing';
  m := 11;
  x := [0,0,0,8,8,4,4,6,6,2,2,6];
  y := [0,-8,8,8,2,2,4,4,6,6,0,0];
  c := seParameter2.Value;
  h := 120;
  //v := 90;
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

procedure TfrmMain.mniStempelClick(Sender: TObject);
var
  x, y: Array of Array of Double;
  DATA : array[1..32] of Double = (
         1,-3,1,-1,3,-1,1,3,1,1,3,1,
          -3,-1,-1,-1,-1,1,-3,1,-1,-3,-1,-2,0,-2,0,2,-1,2,-1,3);
  m: Array [1..4] of Integer;
  s: Array [0..3] of Integer;
  xFac, yFac: Double;
  i, j, k, l, mm, p, q, ss, w, xx, yy, xOff, yOff: Integer;
begin
  prog := 12;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniStempel.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  xFac := pbMain.Width/160;
  yFac := pbMain.Height/120;
  xOff := 100;
  yOff := 100;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 8;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Stand1';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 8;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Stand2';
  mm := 4;
  m[1] := 3;
  m[2] := 3;
  m[3] := 4;
  m[4] := 6;
  I:=1;
  SetLength(x,5,7);
  SetLength(y,5,7);
  FOR K:=1 TO MM do
    begin
      FOR L:=1 TO M[K] do
        begin
          X[K,L]:=DATA[I];
          Y[K,L]:=DATA[I+1];
          inc(I,2);
        end;
    end;
  s[0] := seParameter.Value;
  s[1] := seParameter2.Value;
  s[2] := 1;
  s[3] := 1;
  pbMain.Canvas.MoveTo(Round(xFac*-3+xOff),Round(yFac*-3+yOff));
  pbMain.Canvas.LineTo(Round(xFac*-3+xOff),Round(yFac*69+yOff));
  pbMain.Canvas.LineTo(Round(xFac*93+xOff),Round(yFac*69+yOff));
  pbMain.Canvas.LineTo(Round(xFac*93+xOff),Round(yFac*-3+yOff));
  pbMain.Canvas.LineTo(Round(xFac*-3+xOff),Round(yFac*-3+yOff));
  for j := 0 to 11 do
  begin
    for i := 0 to 15 do
    begin
      xx := 6*i;
      yy := 6*j;
      if j mod 2 = 0 then
        w := 0
      else
        w := 2;
      if i mod 2 = 1 then
        w := w+1;
      ss := s[w];
      if (ss = 1) or (ss = 2) or (ss = 5) or (ss = 6) then
        p := 1
      else
        p := -1;
      if (ss = 1) or (ss = 4) or (ss = 6) or (ss = 7) then
        q := 1
      else
        q := -1;
      if ss mod 2 = 1 then
      begin
        for k := 1 to mm do
        begin
          pbMain.Canvas.MoveTo(Round(xFac*(xx + P * X[K, 1])+xOff), Round(yFac*(yy + Q * Y[K, 1])+yOff));
          for l := 2 to m[k] do
          begin
            pbMain.Canvas.LineTo(Round(xFac*(xx + P * X[K, L])+xOff), Round(yFac*(yy + Q * Y[K, L])+yOff));
          end;
        end;
      end
      else
      begin
        for k := 1 to mm do
        begin
          pbMain.Canvas.MoveTo(Round(xFac*(xx + P * y[K, 1])+xOff), Round(yFac*(yy + Q * x[K, 1])+yOff));
          for l := 2 to m[k] do
          begin
            pbMain.Canvas.LineTo(Round(xFac*(xx + P * y[K, L])+xOff), Round(yFac*(yy + Q * x[K, L])+yOff));
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniStertClick(Sender: TObject);
var
  p1, p2, r, s, u, v, xFac, yFac: Double;
  b, k, n1, n2, xOff, yOff: Integer;
begin
  prog := 17;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniStert.Caption + ']';
  ClearPb;
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  p1 := pi/3;
  p2 := pi/6;
  r := 1.6906;
  s := 4.6189;
  pbMain.Canvas.Brush.Color := clBlack;
  for n2 := 0 to 6 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := 0 to 7-b do
    begin
      u := 12+4*b+8*n1;
      v := 8+6.93*n2;
      pbMain.Canvas.MoveTo(Round(xOff+xFac*(u+r)),Round(yOff+yFac*v));
      for k := 0 to 6 do
      begin
        pbMain.Canvas.LineTo(Round(xOff+xFac*(u+r*Cos(k*p1))),Round(yOff+yFac*(v+r*Sin(k*p1))));
        pbMain.Canvas.LineTo(Round(xOff+xFac*(u+s*Cos(k*p1+p2))),Round(yOff+yFac*(v+s*Sin(k*p1+p2))));
      end;
      pbMain.Canvas.FloodFill(Round(xOff+xFac*u),Round(yOff+yFac*v),clBlack,fsBorder);
    end;
  end;
end;

procedure TfrmMain.mniTriClick(Sender: TObject);
var
  b, f, i, j, k, m, n, n1, n2, s, xOff, yOff: Integer;
  p1, p2, x1, y1, xFac, yFac: Double;
  x, y: Array of Double;
begin
  prog := 9;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniTri.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 3;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  m := 3;
  p1 := 2*pi/3;
  p2 := Sqrt(3);
  x := [0,0,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  s := seParameter.Value;
  case s of
    1:   // Type P3
    begin
      f := 3;
      for i := 1 to 2 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
    end;
    2:  // Type P31M
    begin
      f := 6;
      for i := 1 to 2 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
      for i := 0 to 2 do
      begin
        for n := 1 to m do
        begin
          x[(3+i)*m+n] := -(x[i*m+n]+p2*y[i*m+n])/2+4;
          y[(3+i)*m+n] := -(p2*x[i*m+n]-y[i*m+n])/2+4/p2;
        end;
      end;
    end;
    3:   // Type P3M1
    begin
      f := 6;
      for i := 1 to 2 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
      for i := 0 to 2 do
      begin
        for n := 1 to m do
        begin
          x[(3+i)*m+n] := -x[i*m+n];
          y[(3+i)*m+n] := y[i*m+n];
        end;
      end;
    end;
  end;
  for n2 := 0 to 6 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := 0 to 7-b do
    begin
      for j := 0 to f-1 do
      begin
        x1 := 12+4*b+8*n1;
        y1 := 8+6.93*n2;
        pbMain.Canvas.MoveTo(Round(xOff+xFac*(x1+x[j*m+1])),Round(yOff+yFac*(y1+y[j*m+1])));
        for k := 2 to m do
          pbMain.Canvas.LineTo(Round(xOff+xFac*(x1+x[j*m+k])),Round(yOff+yFac*(y1+y[j*m+k])));
      end;
    end;
  end;
end;

procedure TfrmMain.mniTripClick(Sender: TObject);
var
  Data: Array of Double = (
                         0,16,0,15.77,0.3,15.32,-0.3,14.87,0.3,14.42,-0.3,
                         13.97,0.3,13.52,-0.3,13.07,0.3,12.62,-0.3,12.17,0.3,
                         12.17,0.3,11.95,0,10,4.6,
                         11.6,5.4,12.2,4,13.7,2.1,14.7,3,13.5,4.5,
                         12.7,6.5,10.7,7.5,13.5,10,14.7,9.5,14.1,8.7,
                         13.7,8.8,13,7.7,14,7.2,16,9.2,
                         8,4.62,7.5,5.8,8,6.2,10,4.6);
  x, y: Array [1..6,1..27] of Double;
  b, j, k, m1, m2, n, n1, n2, xOff, yOff: Integer;
  x1, y1, xFac, yFac: Double;

begin
  prog := 25;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniTrip.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := 0;
  yFac := pbMain.Height/60;
  xFac := pbMain.Width/80;
  m1 := 27;
  m2 := 4;
  k := 1;
  for n := 1 to m1 do
  begin
    x[1,n] := Data[k];
    y[1,n] := Data[k+1];
    Inc(k,2);
  end;
  for n := 1 to m2 do
  begin
    x[4,n] := Data[k];
    y[4,n] := Data[k+1];
    Inc(k,2);
  end;
  for n := 1 to m1 do
  begin
    x[2,n] := -0.5*x[1,n]+0.866*y[1,n]+16;
    y[2,n] := -0.866*x[1,n]-0.5*y[1,n]+27.71;
    x[3,n] := -0.5*x[1,n]-0.866*y[1,n]+16;
    y[3,n] := 0.866*x[1,n]-0.5*y[1,n];
  end;
  for n := 1 to m2 do
  begin
    x[5,n] := -0.5*x[4,n]+0.866*y[4,n]+16;
    y[5,n] := -0.866*x[4,n]-0.5*y[4,n]+27.71;
    x[6,n] := -0.5*x[4,n]-0.866*y[4,n]+16;
    y[6,n] := 0.866*x[4,n]-0.5*y[4,n];
  end;
  for n2 := -1 to 5 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := -1 to 5-b do
    begin
      x1 := 4+8*b+16*n1;
      y1 := 13.86*n2;
      with pbMain.Canvas do
      begin
        for j := 1 to 3 do
        begin
          MoveTo(Round(xOff+xFac*(x1+x[j,1])),Round(yOff+yFac*(y1+y[j,1])));
          for k := 2 to m1 do
          begin
            LineTo(Round(xOff+xFac*(x1+x[j,k])),Round(yOff+yFac*(y1+y[j,k])));
          end;
        end;
        for j := 4 to 6 do
        begin
          MoveTo(Round(xOff+xFac*(x1+x[j,1])),Round(yOff+yFac*(y1+y[j,1])));
          for k := 2 to m2 do
          begin
            LineTo(Round(xOff+xFac*(x1+x[j,k])),Round(yOff+yFac*(y1+y[j,k])));
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniVissenClick(Sender: TObject);
var
  j, k, m, n, n1, n2, x1, y1, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array [1..20] of Double;
begin
  prog := 20;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniVissen.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := 0;
  yFac := pbMain.Height/60;
  xFac := pbMain.Width/80;
  m := 5;
  x[1] := 0; y[1] := 0;
  x[2] := 1; y[2] := 1;
  x[3] := 4; y[3] := 0;
  x[4] := 2.5; y[4] := 1;
  x[5] := 2.5; y[5] := 1.5;
  for n := 1 to m do
  begin
    x[m+n] := 8-x[n];
    y[m+n] := -y[n];
    x[2*m+n] := x[n];
    y[2*m+n] := 3-y[n];
    x[3*m+n] := 8-x[n];
    y[3*m+n] := 3+y[n];
  end;
  for n2 := 0 to 6 do
  begin
    for n1 := 0 to 7 do
    begin
      x1 := 8+8*n1;
      y1 := 12+6*n2;
      for j := 0 to 3 do
      begin
        with pbMain.Canvas do
        begin
          Moveto(Round(xOff+xFac*(x1+x[j*m+1])),Round(yOff+yFac*(y1+y[j*m+1])));
          for k := 2 to m do
            LineTo(Round(xOff+xFac*(x1+x[j*m+k])),Round(yOff+yFac*(y1+y[j*m+k])));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniCycloideClick(Sender: TObject);
var
  k, m, n, xOff, yOff: Integer;
  t, x1, x2, y1, y2, xFac, yFac: Double;
begin
  prog := 3;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniCycloide.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 55;
  seParameter.MinValue := -55;
  //pbMain.Canvas.TextOut(pbMain.Canvas.Width div 2, pbMain.Canvas.Height div 2, 'C');
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  yFac := pbMain.Height/2.2;
  xFac := yFac;
  m := seParameter.Value;
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

procedure TfrmMain.mniRaamClick(Sender: TObject);
var
  f, j, k, m, n, n1, n2, s, x1, y1, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array of Integer;
begin
  prog := 6;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniRaam.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 5;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  m := 4;
  x := [0,4,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,1,2,3,0,0,0,0,0,0,0,0,0,0,0,0];
  s := seParameter.Value;
  case s of
    1:
    begin
      // ***TYPE PM***
      F := 2;
      for N := 1 to M do
      begin
        X[M + N] := X[N];
        Y[M + N] := -Y[N];
      end;
    end;
    2:
    begin
      // ***TYPE PG***
      F := 2;
      for N := 1 to M do
      begin
        X[M + N] := 4+X[N];
        Y[M + N] := -Y[N];
      end;
    end;
    3:
    begin
      // ***TYPE PMM***
      F := 4;
      for N := 1 to M do
      begin
        X[M + N] := X[N];
        Y[M + N] := -Y[N];
        X[2 * M + N] := 8-X[N];
        Y[2 * M + N] := Y[N];
        X[3 * M + N] := 8-X[N];
        Y[3 * M + N] := -Y[N];
      end;
    end;
    4:
    begin
      // ***TYPE PMG***
      F := 4;
      for N := 1 to M do
      begin
        X[M + N] := 8-X[N];
        Y[M + N] := -Y[N];
        X[2 * M + N] := X[N];
        Y[2 * M + N] := 3 - Y[N];
        X[3 * M + N] := 8-X[N];
        Y[3 * M + N] := 3 + Y[N];
      end;
    end;
    5:
    begin
      // ***TYPE PGG***
      F := 4;
      for N := 1 to M do
      begin
        X[M + N] := 8-X[N];
        Y[M + N] := -Y[N];
        X[2 * M + N] := 4+X[N];
        Y[2 * M + N] := 3-Y[N];
        X[3 * M + N] := 4-X[N];
        Y[3 * M + N] := 3+Y[N];
      end;
    end;
  end;
  for N2 := 0 to 6 do
  begin
    for N1 := 0 to 7 do
    begin
      X1 := 8+8*N1;
      Y1 := 12+6*N2;
      for J := 0 to F - 1 do
      begin
        pbMain.Canvas.MoveTo(Trunc(xFac*(X1+X[J*M+1])+xOff), Trunc(yFac*(Y1+Y[J*M+1])+yOff));
        for K := 2 to M do
        begin
          pbMain.Canvas.LineTo(Trunc(xFac*(X1+X[J*M+K])+xOff), Trunc(yFac*(Y1+Y[J*M+K])+yOff));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniRuitClick(Sender: TObject);
var
  f, j, k, m, n, n1, n2, s, x0, x1, y1, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array of Integer;

  procedure ForLoop;
  var
    N: Integer;
  begin
    for N := 1 to M do
          begin
            X[M + N] := X[N];
            Y[M + N] := -Y[N];
            X[2 * M + N] := -X[N];
            Y[2 * M + N] := Y[N];
            X[3 * M + N] := -X[N];
            Y[3 * M + N] := -Y[N];
          end;
  end;

begin
  prog := 7;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniRaam.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  m := 4;
  x := [0,4,5,1,0,0,0,0,0,0,0,0,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,1,2,3,0,0,0,0,0,0,0,0,0,0,0,0];
  s := seParameter.Value;
  case s of
    1:
    begin
      // ***TYPE CM***
      F := 2;
      for N := 1 to M do
      begin
        X[M + N] := X[N];
        Y[M + N] := -Y[N];
      end;
    end;
    2:
    begin
      // ***TYPE CMM***
      F := 4;
      ForLoop;
    end;
  end;
  for N2 := 0 to 10 do
  begin
    for N1 := 0 to 6 do
    begin
      if N2 Mod 2 = 0 then X0 := 7 else X0 := 12;
      X1 := X0 + 10 * N1;
      Y1 := 10 + 4 * N2;
      for J := 0 TO F - 1 do
      begin
        pbMain.Canvas.MoveTo(Trunc(xFac*(X1+X[J*M+1])+xOff), Trunc(yFac*(Y1+Y[J*M+1])+yOff));
        for K := 2 to M do
        begin
          pbMain.Canvas.LineTo(Trunc(xFac*(X1+X[J*M+K])+xOff), Trunc(yFac*(Y1+Y[J*M+K])+yOff));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniQuadrClick(Sender: TObject);
var
  f, i, j, k, m, n, n1, n2, s, x1, y1, xOff, yOff: Integer;
  p1, xFac, yFac: Double;
  x, y: Array of Double;
begin
  prog := 8;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniQuadr.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 3;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;   ummer';
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  m := 4;
  x := [0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  p1 := pi/2;
  s := seParameter.Value;
  case s of
    1:   //Type P4
    begin
      f := 4;
      for i := 1 to 3 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
    end; //end case 1
    2:   //Type P4N
    begin
      f := 8;
      for i := 1 to 3 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
      for i := 0 to 3 do
      begin
        for n := 1 to m do
        begin
          x[(4+i)*m+n] := y[i*m+n];
          y[(4+i)*m+n] := x[i*m+n];
        end;
      end;
    end; //end case 2
    3:    //Type P4G
    begin
      f := 8;
      for i := 1 to 3 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
      for i := 0 to 3 do
      begin
        for n := 1 to m do
        begin
          x[(4+i)*m+n] := 4-y[i*m+n];
          y[(4+i)*m+n] := 4-x[i*m+n];
        end;
      end;
    end; //end case 3
  end; //end case
  for n2 := 0 to 5 do
  begin
    for n1 := 0 to 7 do
    begin
      for j := 0 to f-1 do
      begin
        x1 := 10+8*n1;
        y1 := 10+8*n2;
        pbMain.Canvas.MoveTo(Trunc(xFac*(x1+x[j*m+1])+xOff),Trunc(yFac*(y1+y[j*m+1])+yOff));
        for k := 2 to m do
          pbMain.Canvas.LineTo(Trunc(xFac*(x1+x[j*m+k])+xOff),Trunc(yFac*(y1+y[j*m+k])+yOff));
      end;
    end;
  end;
end;

procedure TfrmMain.mniQuadrpClick(Sender: TObject);
var
  Data: Array of Double = (
                         0,0,0,-1,1,-0.5,2.5,2.5,3.3,-0.8,4.5,0.4,3.5,0,3,
                         -1.5,4,-1.3,5,0.5,4.8,2,10.5,0,10,0.3,10.5,-0.3,11,
                         0,12,3,12.5,6,11.5,7,10,5,6,6,5.5,7,7.5,10,10);
  x, y: Array [1..22] of Double;
  k, m, n, n1, n2, s, u, v, x1, y1, xOff, yOff: Integer;
  xFac, yFac: Double;
begin
  prog := 24;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniQuadrp.Caption + ']';
  ClearPb;
  xFac := pbMain.Width/92;
  yFac := pbMain.Height/72;
  xOff := 0;
  yOff := 0;
  m := 22;
  for n := 1 to m do
  begin
    x[n]:=-Data[2*n-1];  // X[1]=D[1] X[2]=D[3] X[3]=D[5]
    y[n]:=-Data[2*n  ];  // Y[1]=D[2] Y[2]=D[4] Y[3]=D[6]
  end;
  with pbMain.Canvas do
  begin
    Brush.Color := clRed;
    for n2 := 0 to 9 do
    begin
      for n1 := 0 to 10 do
      begin
        x1 := -5+10*n1;
        y1 := -15+10*n2;
        MoveTo(Round(xOff+xFac*(x1+x[1])),Round(yOff+yFac*(y1+y[1])));
        for k := 2 to m do
          LineTo(Round(xOff+xFac*(x1+x[k])),Round(yOff+yFac*(y1+y[k])));
      end;
    end;
    for n2 := 0 to 8 do
    begin
      for n1 := 0 to 9 do
      begin
        u := 10*n1;
        v := -10+10*n2;
        s := (n1+n2) mod 2;
        if s = 1 then
        begin
          //EllipseC(Round(xOff+xFac*u),Round(yOff+yFac*v),2,2);
          FloodFill(Round(xOff+xFac*u),Round(yOff+yFac*v),clBlack,fsBorder);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniQuadrtClick(Sender: TObject);
var
  i, j, k, n, n1, n2, x1, y1, xOff, yOff: Integer;
  p1, xFac, yFac: Double;
  x, y: Array [1..24] of Double;
  Data: Array [1..6] of Integer = (0,0,1,1,3,-1);
begin
  prog := 27;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniQuadrt.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := pbMain.Height;
  yFac := -pbMain.Height/60;
  xFac := pbMain.Width/80;
  p1 := pi/2;
  for n := 1 to 3 do
  begin
    x[n] := Data[2*n-1];
    y[n] := Data[2*n];
  end;
  for i := 1 to 3 do
  begin
    for n := 1 to 3 do
    begin
      x[3*i+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
      y[3*i+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
    end;
  end;
  for i := 0 to 3 do
  begin
    for n := 1 to 3 do
    begin
      x[3*(4+i)+n] := 4-y[3*i+n];
      y[3*(4+i)+n] := 4-x[3*i+n];
    end;
  end;
  with pbMain.Canvas do
  begin
    for n2 := 0 to 5 do
    begin
      for n1 := 0 to 7 do
      begin
        for j := 0 to 7 do
        begin
          x1 := 10+8*n1;
          y1 := 10+8*n2;
          MoveTo(Round(xOff+xFac*(x1+x[3*j+1])),Round(yOff+yFac*(y1+y[3*j+1])));
          for k := 2 to 3 do
          begin
            LineTo(Round(xOff+xFac*(x1+x[3*j+k])),Round(yOff+yFac*(y1+y[3*j+k])));
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniHexaClick(Sender: TObject);
var
  b, f, i, j, k, m, n, n1, n2, s, xOff, yOff: Integer;
  p1, x1, y1, xFac, yFac: Double;
  x, y: Array of Double;
begin
  prog := 10;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniHexa.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Rangnummer';
  xFac := pbMain.Width/80;
  yFac := pbMain.Height/60;
  xOff := 0;
  yOff := 0;
  p1 := pi/3;
  m := 3;
  x := [0,0,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; // dynamisch array begint bij 0
  y := [0,0,1.732,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  s := seParameter.Value;
  case s of
    1:    // type P6
    begin
      f := 6;
      for i := 1 to 5 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
    end;
    2:   // type P6M
    begin
      f := 12;
      for i := 1 to 5 do
      begin
        for n := 1 to m do
        begin
          x[i*m+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
          y[i*m+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
        end;
      end;
      for i := 0 to 5 do
      begin
        for n := 1 to m do
        begin
          x[(6+i)*m+n] := x[i*m+n];
          y[(6+i)*m+n] := -y[i*m+n];
        end;
      end;
    end;
  end;
  for n2 := 0 to 6 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := 0 to 7-b do
    begin
      for j := 0 to f-1 do
      begin
        x1 := 12+4*b+8*n1;
        y1 := 8+6.93*n2;
        pbMain.Canvas.MoveTo(Round(xFac*(x1+x[j*m+1])+xOff),Round(yFac*(y1+y[j*m+1])+yOff));
        for k := 2 to m do
          pbMain.Canvas.LineTo(Round(xFac*(x1+x[j*m+k])+xOff),Round(yFac*(y1+y[j*m+k])+yOff));
      end;
    end;
  end;
end;

procedure TfrmMain.mniHexahClick(Sender: TObject);
var
  a1, a2, a3, b1, b2, b3, c1, c2, c3, c4, p3, u, v, xx, x1, xFac, yy, y1, yFac: Double;
  b, i, j, k, m, n, n1, n2, xOff, yOff: Integer;
  x, y: Array [1..18] of Double;
  Data: Array [1..6] of Double = (0,0,3,1.732,4,0);

  procedure GoSub260;
  begin
    c4 := c1*u+c2*v+c3;
    xx := (a1*u+a2*v+a3)/c4;
    yy := (b1*u+b2*v+b3)/c4;
  end;

begin
  prog := 26;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniHexah.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := pbMain.Height;
  yFac := -pbMain.Height/21;
  xFac := pbMain.Width/21;
  p3 := pi/3;
  a1 := 1; a2 := 0.2; a3 := 0;
  b1 := 0.2; b2 := 1; b3 := 0;
  c1 := 0.02; c2 := 0.025; c3 := 1;
  m := 3;
  for n := 1 to m do
  begin
    x[n] := Data[2*n-1];
    y[n] := Data[2*n];
  end;
  for i := 1 to 5 do
  begin
    for n := 1 to m do
    begin
      x[i*m+n] := x[n]*Cos(p3*i)-y[n]*Sin(p3*i);
      y[i*m+n] := x[n]*Sin(p3*i)+y[n]*Cos(p3*i);
    end;
  end;
  for n2 := 0 to 12 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := -1 to 15-b do
    begin
      for j := 0 to 5 do
      begin
        x1 := 4*b+8*n1;
        y1 := 6.93*n2;
        u := x1+x[j*m+1];
        v := y1+y[j*m+1];
        Gosub260;
        pbMain.Canvas.MoveTo(Round(xOff+xFac*xx),Round(yOff+yFac*yy));
        for k := 2 to m do
        begin
          u := x1+x[j*m+k];
          v := y1+y[j*m+k];
          Gosub260;
          pbMain.Canvas.LineTo(Round(xOff+xFac*xx),Round(yOff+yFac*yy));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniKattenClick(Sender: TObject);
var
  i, j, k, l, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array [1..7,1..13] of Double;
  m: Array [1..7] of Integer = (13,7,7,6,2,2,5);
  DATA : array[1..84] of double = (
         0,0,-1,4,0,8,0,12,3,9,9,9,12,12,12,8,11,4,12,0,9,-3,3,-3,0,0,
         2,2,1.5,3,2.5,4,3.5,4,4,3.5,4,2,2,2,
         8,2,8,3.5,8.5,4,9.5,4,10.5,3,10,2,8,2,
         2,1,10,1,6,0.6,6,-0.5,6,0.6,2,1,3,4,3,2.5,9,4,9,2.5,
         2.5,-0.5,4,-1.5,6,-1,8,-1.5,9.5,-0.5);
begin
  prog := 19;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniKatten.Caption + ']';
  ClearPb;
  xOff := -50;
  yOff := pbMain.Height + 50;
  yFac := -pbMain.Height/81;
  xFac := pbMain.Width/108;
  K:=1;
  FOR I:=1 TO 7 do
  begin
    FOR J:=1 TO M[I] do
    begin
      X[I,J]:=DATA[K];
      inc(K);
      Y[I,J]:=DATA[K];
      inc(K);
    end;
  end;
  with pbMain.Canvas do
  begin
    for i := 1 to 6 do
    begin
      for j := 1 to 8 do
      begin
        for k := 1 to 7 do
        begin
          MoveTo(Round(xOff+xFac*(12*j+x[k,1])),Round(yOff+yFac*(12*i+y[k,1])));
          for l := 2 to m[k] do
          begin
            LineTo(Round(xOff+xFac*(12*j+x[k,l])),Round(yOff+yFac*(12*i+y[k,l])));
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniCairoClick(Sender: TObject);
var
  a, c, n1, n2, s, u, v, xOff, yOff: Integer;
  xFac, yFac: Double;
begin
  prog := 18;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniCairo.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := 0;
  yFac := pbMain.Height/90;
  xFac := pbMain.Width/120;
  a := 3;
  c := 10;
  for n2 := 1 to 8 do
  begin
    for n1 := 0 to 10 do
    begin
      s := (n1+n2) mod 2;
      u := c*n1;
      v := c*n2;
      with pbMain.Canvas do
      begin
        if s = 0 then
        begin
          MoveTo(Round(xOff+xFac*(u+a)),Round(yOff+yFac*v));
          LineTo(Round(xOff+xFac*(u+c-a)),Round(yOff+yFac*(v-c)));
          LineTo(Round(xOff+xFac*(u+c+a)),Round(yOff+yFac*(v-c)));
          LineTo(Round(xOff+xFac*(u+2*c-a)),Round(yOff+yFac*v));
          LineTo(Round(xOff+xFac*(u+c+a)),Round(yOff+yFac*(v+c)));
          LineTo(Round(xOff+xFac*(u+c-a)),Round(yOff+yFac*(v+c)));
          LineTo(Round(xOff+xFac*(u+a)),Round(yOff+yFac*v));
         end
         else
         begin
          MoveTo(Round(xOff+xFac*u),Round(yOff+yFac*(v-a)));
          LineTo(Round(xOff+xFac*(u+c)),Round(yOff+yFac*(v-c+a)));
          LineTo(Round(xOff+xFac*(u+2*c)),Round(yOff+yFac*(v-a)));
          LineTo(Round(xOff+xFac*(u+2*c)),Round(yOff+yFac*(v+a)));
          LineTo(Round(xOff+xFac*(u+c)),Round(yOff+yFac*(v+c-a)));
          LineTo(Round(xOff+xFac*u),Round(yOff+yFac*(v+a)));
          LineTo(Round(xOff+xFac*u),Round(yOff+yFac*(v-a)));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniEscherClick(Sender: TObject);
var
  x, y: Array [1..4,1..10] of Double;
  Data: Array of Double = (
              -3,1,-1,-3,-1,3,1,-3,
              -3,-1,-1.5,-0.5,0.5,1.5,1,3,3,1,2,1,1.5,0.5,1.5,-0.5,2,-1,3,-1);
  m: Array of Integer = (0,2,2,10);
  s: Array [0..3] of Integer;
  i, j, k, l, mm, p, q, ss, w, xx, yy, xOff, yOff: Integer;
  xFac, yFac: Double;
begin
  prog := 23;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniEscher.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 8;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Positie stempel 1';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 8;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Positie stempel 2';
  lblParameter3.Visible := True;
  seParameter3.Visible := True;
  seParameter3.MaxValue := 8;
  seParameter3.MinValue := 1;
  lblParameter3.Caption := 'Positie stempel 3';
  lblParameter4.Visible := True;
  seParameter4.Visible := True;
  seParameter4.MaxValue := 8;
  seParameter4.MinValue := 1;
  lblParameter4.Caption := 'Positie stempel 4';
  xOff := 55;
  yOff := pbMain.Height - 200;
  yFac := -pbMain.Height/80;
  xFac := pbMain.Width/100;
  mm := 3;
  k := 0;
  for i := 1 to mm do
  begin
    for j := 1 to m[i] do
    begin
      x[i,j] := Data[k];
      Inc(k);
      y[i,j] := Data[k];
      Inc(k);
    end;
  end;
  with pbMain.Canvas do
  begin
    s[0] := seParameter.Value;
    s[1] := seParameter2.Value;
    s[2] := seParameter3.Value;
    s[3] := seParameter4.Value;
    MoveTo(Round(xOff+xFac*-3),Round(yOff+yFac*-3));
    LineTo(Round(xOff+xFac*-3),Round(yOff+yFac*51));
    LineTo(Round(xOff+xFac*69),Round(yOff+yFac*51));
    LineTo(Round(xOff+xFac*69),Round(yOff+yFac*-3));
    LineTo(Round(xOff+xFac*-3),Round(yOff+yFac*-3));
    for j := 0 to 8 do
    begin
      for i := 0 to 11 do
      begin
        xx := 6*i;
        yy := 6*j;
        if j mod 2 = 0 then w := 0 else w := 2;
        if i mod 2 = 1 then w := w+1;
        ss := s[w];
        if (ss = 1) or (ss = 2) or (ss = 5) or (ss = 6) then p := 1 else p := -1;
        if (ss = 1) or (ss = 4) or (ss = 6) or (ss = 7) then q := 1 else q := -1;
        if ss mod 2 = 1 then
        begin
          for k := 1 to mm do
          begin
            MoveTo(Round(xOff+xFac*(xx+p*x[k,1])),Round(yOff+yFac*(yy+q*y[k,1])));
            for l := 2 to m[k] do
            begin
              LineTo(Round(xOff+xFac*(xx+p*x[k,l])),Round(yOff+yFac*(yy+q*y[k,l])));
            end; // for l
          end; // for k
        end // if
        else
        begin
          for k := 1 to mm do
          begin
            MoveTo(Round(xOff+xFac*(xx+p*y[k,1])),Round(yOff+yFac*(yy+q*x[k,1])));
            for l := 2 to m[k] do
            begin
              LineTo(Round(xOff+xFac*(xx+p*y[k,l])),Round(yOff+yFac*(yy+q*x[k,l])));
            end; // for l
          end; // for k
        end; // else
      end; // for i
    end; // for j
  end; // with
end;

procedure TfrmMain.mniKleedClick(Sender: TObject);
var
  c, i, j, n, p1, p2, p3, p4, q1, q2, q3, q4, u, v, xm, ym: Integer;
  x, y, z: Double;

  procedure Gosub180;
  begin
    pbMain.Canvas.EllipseC(u,v,2,2);
  end;

  procedure Gosub140;
  begin
    u := p1;
    v := q1;
    Gosub180;
    v := q2;
    Gosub180;
    u := p2;
    v := q1;
    Gosub180;
    v := q2;
    Gosub180;
    u := p3;
    v := q3;
    Gosub180;
    v := q4;
    Gosub180;
    u := p4;
    v := q3;
    Gosub180;
    v := q4;
    Gosub180;
  end;

begin
  // Symmetrietype D(4)
  prog := 11;
  ClearPb;
  xm := pbMain.Width div 2 - 100;
  ym := pbMain.Height div 2;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 50;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Parameter N';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 150;
  seParameter2.MinValue := 100;
  lblParameter2.Caption := 'Parameter C';
  GroupBox1.Visible := True;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniKleed.Caption + ']';
  n := seParameter.Value;
  c := seParameter2.Value;
  for i := 0 to n do
  begin
    for j := 0 to i do
    begin
      x := i/n;
      y := j/n;
      p1 := xm+6*i;
      p2 := xm-6*i;
      q1 := ym+5*j;
      q2 := ym-5*j;
      p3 := xm+6*j;
      p4 := xm-6*j;
      q3 := ym+5*i;
      q4 := ym-5*i;
      z := (1-x*x)*(1-y*y);
      if Trunc(c*z) mod 2 = 0 then Gosub140;
    end;
  end;
end;

procedure TfrmMain.mniMoskeeClick(Sender: TObject);
var
  p1, x1, y1, xFac, yFac: Double;
  x, y: Array[0..36] of Double;
  b, i, j, k, n, n1, n2, xOff, yOff: Integer;

begin
  prog := 16;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniMoskee.Caption + ']';
  ClearPb;
  pbMain.Canvas.Pen.Width := 2;
  //pbMain.Canvas.TextOut(pbMain.Canvas.Width div 2, pbMain.Canvas.Height div 2, 'C');
  xOff := 10;
  yOff := 10;
  yFac := pbMain.Height/60;
  xFac := pbMain.Width/80;
  p1 := pi/3;
  x[1] := 1;
  y[1] := 0;
  x[2] := 1;
  y[2] := 3;
  x[3] := 4;
  y[3] := 3;
  for i := 1 to 5 do
  begin
    for n := 1 to 3 do
    begin
      x[3*i+n] := x[n]*Cos(p1*i)-y[n]*Sin(p1*i);
      y[3*i+n] := x[n]*Sin(p1*i)+y[n]*Cos(p1*i);
    end;
  end;
  for i := 0 to 5 do
  begin
    for n := 1 to 3 do
    begin
      x[3*(6+i)+n] := x[3*i+n];
      y[3*(6+i)+n] := -y[3*i+n];
    end;
  end;
  for n2 := 0 to 6 do
  begin
    if n2 mod 2 = 0 then b := 0 else b := 1;
    for n1 := 0 to 7-b do
    begin
      for j := 0 to 11 do
      begin
        x1 := 12+4*b+8*n1;
        y1 := 8+6.93*n2;
        pbMain.Canvas.MoveTo(Round(xOff+xFac*(x1+x[3*j+1])),Round(yOff+yFac*(y1+y[3*j+1])));
        for k := 2 to 3 do
        begin
          pbMain.Canvas.LineTo(Round(xOff+Xfac*(x1+x[3*j+k])),Round(yOff+yFac*(y1+y[3*j+k])));
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniParket1Click(Sender: TObject);
var
  i, j, t, ss, w, xOff, yOff: Integer;
  xFac, yFac: Double;
  s: Array [0..3] of Integer;
begin
  prog := 13;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniParket1.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  xOff := 50;
  yOff := 50;
  yFac := pbMain.Height/16;
  xFac := yFac;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 256;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Patroon';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 15;
  seParameter2.MinValue := 0;
  lblParameter2.Caption := 'Kleur';
  t := seParameter.Value;
  pbMain.Canvas.Brush.Color := EgaColor[seParameter2.Value];
  //pbMain.Canvas.Pen.Color := clBlack;
  for i := 0 to 3 do
  begin
    s[i] := t mod 4;
    t := t div 4;
  end;
  for i := 0 to 16 do
    pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*-0.5+yOff),Round(xFac*(i-0.5)+xOff),Round(yFac*11.5+yOff));
  for j := 0 to 12 do
    pbMain.Canvas.Line(Round(xFac*-0.5+xOff),Round(yFac*(j-0.5)+yOff),Round(xFac*15.5+xOff),Round(yFac*(j-0.5)+yOff));
  for j := 0 to 11 do
  begin
    for i := 0 to 15 do
    begin
      if j mod 2 = 0 then w := 0 else w := 2;
      if i mod 2 = 1 then w := w + 1;
      ss := s[w] + 1;
      case ss of
        1:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j+0.5)+yOff),Round(xFac*(i+0.5)+xOff),Round(yFac*(j-0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i-0.2)+xOff),Round(yFac*(j-0.2)+yOff),clBlack,fsBorder);
        end;
        2:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j-0.5)+yOff),Round(xFac*(i+0.5)+xOff),Round(yFac*(j+0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i+0.2)+xOff),Round(yFac*(j-0.2)+yOff),clBlack,fsBorder);
        end;
        3:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j+0.5)+yOff),Round(xFac*(i+0.5)+xOff),Round(yFac*(j-0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i+0.2)+xOff),Round(yFac*(j+0.2)+yOff),clBlack,fsBorder);
        end;
        4:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j-0.5)+yOff),Round(xFac*(i+0.5)+xOff),Round(yFac*(j+0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i-0.2)+xOff),Round(yFac*(j+0.2)+yOff),clBlack,fsBorder);
        end;
      end;
    end;
  end;
  pbMain.Canvas.Brush.Color := clWhite;
end;

procedure TfrmMain.mniParket2Click(Sender: TObject);
var
  i , j, w, xOff, yOff: Integer;
  xFac, yFac: Double;
  s: Array[0..3] of Integer;
begin
  prog := 14;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniParket2.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  xOff := 50;
  yOff := 50;
  yFac := pbMain.Height/16;
  xFac := yFac;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 4;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Stand tegel 1';
  lblParameter2.Visible := True;
  seParameter2.Visible := True;
  seParameter2.MaxValue := 4;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Stand tegel 2';
  lblParameter3.Visible := True;
  seParameter3.Visible := True;
  seParameter3.MaxValue := 4;
  seParameter3.MinValue := 1;
  lblParameter3.Caption := 'Stand tegel 3';
  lblParameter4.Visible := True;
  seParameter4.Visible := True;
  seParameter4.MaxValue := 4;
  seParameter4.MinValue := 1;
  lblParameter4.Caption := 'Stand tegel 4';
  s[0] := seParameter.Value;
  s[1] := seParameter2.Value;
  s[2] := seParameter3.Value;
  s[3] := seParameter4.Value;
  pbMain.Canvas.Brush.Color := clBlack;
  for i := 0 to 16 do
    pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*-0.5+yOff),
    Round(xFac*(i-0.5)+xOff),Round(yFac*11.5+yOff));
  for j := 0 to 12 do
    pbMain.Canvas.Line(Round(xFac*(-0.5)+xOff),Round(yFac*(j-0.5)+yOff),
    Round(xFac*(15.5)+xOff),Round(yFac*(j-0.5)+yOff));
  for j := 0 to 11 do
  begin
    for i := 0 to 15 do
    begin
      if j mod 2 = 0 then w := 0 else w := 2;
      if i mod 2 = 1 then w := w + 1;
      case s[w] of
        1:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j+0.5)+yOff),
          Round(xFac*(i+0.5)+xOff),Round(yFac*(j-0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i-0.2)+xOff),Round(yFac*(j-0.2)+yOff),clBlack,fsBorder);
        end;
        2:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j-0.5)+yOff),
          Round(xFac*(i+0.5)+xOff),Round(yFac*(j+0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i+0.2)+xOff),Round(yFac*(j-0.2)+yOff),clBlack,fsBorder);
        end;
        3:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j+0.5)+yOff),
          Round(xFac*(i+0.5)+xOff),Round(yFac*(j-0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i+0.2)+xOff),Round(yFac*(j+0.2)+yOff),clBlack,fsBorder);
        end;
        4:
        begin
          pbMain.Canvas.Line(Round(xFac*(i-0.5)+xOff),Round(yFac*(j-0.5)+yOff),Round(xFac*(i+0.5)+xOff),Round(yFac*(j+0.5)+yOff));
          pbMain.Canvas.FloodFill(Round(xFac*(i-0.2)+xOff),Round(yFac*(j+0.2)+yOff),clBlack,fsBorder);
        end;
      end;
    end;
  end;
  pbMain.Canvas.Brush.Color := clWhite;
end;

procedure TfrmMain.mniParket3Click(Sender: TObject);
var
  i , j, n, s, xOff, yOff: Integer;
  a, b, c, u1, u2, u3, v1, v2, v3, x, y, x1, x2, y1, y2, z, xFac, yFac: Double;

  procedure Gosub310;
  begin
    pbMain.Canvas.Line(Round(xFac*u1+xOff),Round(yFac*v1+yOff),Round(xFac*u2+xOff),Round(yFac*v2+yOff));
    pbMain.Canvas.FloodFill(Round(xFac*u3+xOff),Round(yFac*v3+yOff),clBlack,fsBorder);
    pbMain.Canvas.Line(Round(xFac*-u1+xOff),Round(yFac*v1+yOff),Round(xFac*-u2+xOff),Round(yFac*v2+yOff));
    pbMain.Canvas.FloodFill(Round(xFac*-u3+xOff),Round(yFac*v3+yOff),clBlack,fsBorder);
    pbMain.Canvas.Line(Round(xFac*u1+xOff),Round(yFac*-v1+yOff),Round(xFac*u2+xOff),Round(yFac*-v2+yOff));
    pbMain.Canvas.FloodFill(Round(xFac*u3+xOff),Round(yFac*-v3+yOff),clBlack,fsBorder);
    pbMain.Canvas.Line(Round(xFac*-u1+xOff),Round(yFac*-v1+yOff),Round(xFac*-u2+xOff),Round(yFac*-v2+yOff));
    pbMain.Canvas.FloodFill(Round(xFac*-u3+xOff),Round(yFac*-v3+yOff),clBlack,fsBorder);
  end;

begin
  prog := 15;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniParket3.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 8;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Functie';
  pbMain.Canvas.Brush.Color := clRed;
  xOff := pbMain.Width div 2;
  yOff := pbMain.Height div 2;
  yFac := pbMain.Height/2;
  xFac := yFac;
  n := 9;
  a := 1/n;
  b := a/2;
  c := a/4;
  for i := -n to n do
  begin
    pbMain.Canvas.Line(Round(xFac*-a*n+xOff),Round(yFac*a*i+yOff),Round(xFac*a*n+xOff),Round(yFac*a*i+yOff));
    pbMain.Canvas.Line(Round(xFac*a*i+xOff),Round(yFac*-a*n+yOff),Round(xFac*a*i+xOff),Round(yFac*a*n+yOff));
  end;
  for i := 1 to n do
  begin
    for j := 1 to i do
    begin
      x := a*i-b;
      y := a*j-b;
      x1 := x-b;
      x2 := x+b;
      y1 := y-b;
      y2 := y+b;
      case seParameter.Value of
        1: z := 1+x+y;
        2: z := 1+x-y;
        3: z := 1-x+y;
        4: z := 1-x-y;
        5: z := 2+x+y;
        6: z := 2+x-y;
        7: z := 2-x+y;
        8: z := 2-x-y;
      end;
      s := Trunc(200*z) mod 4 + 1;
      if i = j then s := 1+2*(s div 3);
      case s of
        1:
        begin
          u1 := x1;
          v1 := y2;
          u2 := x2;
          v2 := y1;
          u3 := x-c;
          v3 := y;
          Gosub310;
          u1 := y2;
          v1 := x1;
          u2 := y1;
          v2 := x2;
          u3 := y;
          v3 := x-c;
          Gosub310;
        end;
        2:
        begin
          u1 := x1;
          v1 := y1;
          u2 := x2;
          v2 := y2;
          u3 := x+c;
          v3 := y;
          Gosub310;
          u1 := y1;
          v1 := x1;
          u2 := y2;
          v2 := x2;
          u3 := y;
          v3 := x+c;
          Gosub310;
        end;
        3:
        begin
          u1 := x1;
          v1 := y2;
          u2 := x2;
          v2 := y1;
          u3 := x+c;
          v3 := y;
          Gosub310;
          u1 := y2;
          v1 := x1;
          u2 := y1;
          v2 := x2;
          u3 := y;
          v3 := x+c;
          Gosub310;
        end;
        4:
        begin
          u1 := x1;
          v1 := y1;
          u2 := x2;
          v2 := y2;
          u3 := x-c;
          v3 := y;
          Gosub310;
          u1 := y1;
          v1 := x1;
          u2 := y2;
          v2 := x2;
          u3 := y;
          v3 := x-c;
          Gosub310;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.mniPolyederClick(Sender: TObject);
var
  i, j, k, l, s1, xOff, yOff: Integer;
  s, t, xFac, yFac: Double;
  n: Array of Integer;
  x, y, z: Array of Array of Double;
  u, v: Array [1..20] of Double;
  DATA : array[0..154] of double = (
         4,6,8,12,20,
         -2.83,0,-1,1.41,2.45,-1,1.41,-2.45,-1,0,0,3,
         1,0,0,-1,0,0,0,1,0,0,-1,0,0,0,1,0,0,-1,
         0,0,0,1,0,0,0,1,0,0,0,1,1,1,1,0,1,1,1,0,1,1,1,0,
         0,1,0.618,0,1,-0.618,1,0.618,0,1,-0.618,0,0.618,0,1,-0.618,0,1,
         0,-1,-0.618,0,-1,0.618,-1,-0.618,0,-1,0.618,0,-0.618,0,-1,0.618,0,-1,
         1,1,1,-1,1,1,1,-1,1,1,1,-1,1,-1,-1,-1,1,-1,-1,-1,1,-1,-1,-1,
         0,0.618,1.618,0,-0.618,1.618,0,0.618,-1.618,0,-0.618,-1.618,
         1.618,0,0.618,-1.618,0,0.618,1.618,0,-0.618,-1.618,0,-0.618,
         0.618,1.618,0,-0.618,1.618,0,0.618,-1.618,0,-0.618,-1.618,0);
begin
  prog := 22;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniPolyeder.Caption + ']';
  ClearPb;
  GroupBox1.Visible := True;
  lblParameter.Visible := True;
  seParameter.Visible := True;
  seParameter.MaxValue := 5;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Type Polyeder';
  xOff := pbMain.Canvas.Width div 2 -100;
  yOff := pbMain.Canvas.Height div 2;
  SetLength(n,5);
  for i:=0 to 4 do
  begin
    N[i]:=Round(DATA[i]);
    SetLength(x,5,n[i]);
    SetLength(y,5,n[i]);
    SetLength(z,5,n[i]);
  end;
  K:=5;
  FOR I:=0 TO 4 do
  begin
    FOR J:=0 TO N[I]-1 do
    begin
      X[I,J]:=DATA[K];
      Y[I,J]:=DATA[K+1];
      Z[I,J]:=DATA[K+2];
      Inc(K,3);
    end; // for J
  end;
  s1 := seParameter.Value;
  case s1 of
    1:
    begin
      yFac := pbMain.Canvas.Height/6;
      xFac := yFac;
      t := 25;
    end;
    2:
    begin
      yFac := pbMain.Canvas.Height/3;
      xFac := yFac;
      t := 2.5;
    end;
    3, 4, 5:
    begin
      yFac := pbMain.Canvas.Height/4;
      xFac := yFac;
      t := 1.6;
    end;
  end;
  for k := 1 to n[s1-1] do
  begin
    u[k] := -0.6*x[s1-1,k-1]+0.8*y[s1-1,k-1];
    v[k] := -0.308*x[s1-1,k-1]-0.231*y[s1-1,k-1]+0.923*z[s1-1,k-1];
  end;
  // pbMain.Canvas.EllipseC(pbMain.Width div 2,pbMain.Height div 2, 10,10);
  for k := 1 to n[s1-1]-1 do
  begin
    for l := k+1 to n[s1-1] do
    begin
      s := Power(x[s1-1,k-1]-x[s1-1,l-1],2)+Power(y[s1-1,k-1]-y[s1-1,l-1],2)+Power(z[s1-1,k-1]-z[s1-1,l-1],2);
      if s < t then pbMain.Canvas.Line(Round(xOff+xFac*u[k]),Round(yOff+yFac*v[k]),Round(xOff+xFac*u[l]),Round(yOff+yFac*v[l]));
    end;
  end;
end;


procedure TfrmMain.mniWervelClick(Sender: TObject);
var
  x, y: Array[0..7] of Double;
  i, j, k, l, m, n, xOff, yOff: Integer;
  a, c, f, t, xFac, yFac, z: Double;
begin
  prog := 2;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniWervel.Caption + ']';
  ClearPb;
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

procedure TfrmMain.mniZeepaardClick(Sender: TObject);
var
  k, m, n1, n2, u, v, xOff, yOff: Integer;
  Xfac, yFac: Double;
  x, y: Array of Integer;
begin
  prog := 21;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniZeepaard.Caption + ']';
  ClearPb;
  xOff := 0;
  yOff := 0;
  yFac := pbMain.Height/45;
  xFac := pbMain.Width/60;
  m := 38;
  x := [0,4,4,7,7,6,6,3,3,0,0,1,1,-2,-2,0,0,2,2,-1,-1,0,0,3,3,6,6,5,5,8,8,6,6,4,4,3,3,2,2];
  y := [0,3,2,2,1,1,0,0,1,1,4,4,5,5,6,6,8,8,9,9,10,10,11,11,10,10,7,7,6,6,5,5,3,3,4,4,7,7,8];
  for n1 := 0 to 8 do
  begin
    for n2 := 0 to 6 do
    begin
      u := 3+6*n1;
      v := 10*n2-3*n1;
      with pbMain.Canvas do
      begin
        MoveTo(Round(xOff+xFac*(u+x[1])),Round(yOff+yFac*(v+y[1])));
        for k := 2 to m do
          LineTo(Round(xOff+xFac*(u+x[k])),Round(yOff+yFac*(v+y[k])));
      end;
    end;
  end;
end;

procedure TfrmMain.seParameter2Change(Sender: TObject);
begin
  case prog of
    4: mniRandClick(Sender);
    5: mniParalClick(Sender);
    6: mniRaamClick(Sender);
    7: mniRuitClick(Sender);
    8: mniQuadrClick(Sender);
    9: mniTriClick(Sender);
    10: mniHexaClick(Sender);
    11: mniKleedClick(Sender);
    12: mniStempelClick(Sender);
    13: mniParket1Click(Sender);
    14: mniParket2Click(Sender);
    23: mniEscherClick(Sender);
  end;
end;

procedure TfrmMain.seParameter3Change(Sender: TObject);
begin
  case prog of
    14: mniParket2Click(Sender);
    23: mniEscherClick(Sender);
  end;
end;

procedure TfrmMain.seParameter4Change(Sender: TObject);
begin
   case prog of
    14: mniParket2Click(Sender);
    23: mniEscherClick(Sender);
  end;
end;

procedure TfrmMain.seParameterChange(Sender: TObject);
begin
  case prog of
    3: mniCycloideClick(Sender);
    4: mniRandClick(Sender);
    5: mniParalClick(Sender);
    6: mniRaamClick(Sender);
    7: mniRuitClick(Sender);
    8: mniQuadrClick(Sender);
    9: mniTriClick(Sender);
    10: mniHexaClick(Sender);
    11: mniKleedClick(Sender);
    12: mniStempelClick(Sender);
    13: mniParket1Click(Sender);
    14: mniParket2Click(Sender);
    15: mniParket3Click(Sender);
    22: mniPolyederClick(Sender);
    23: mniEscherClick(Sender);
  end;
end;

procedure TfrmMain.ClearPb;
begin
  pbMain.Canvas.Clear;
  pbMain.Canvas.Brush.Color := clWhite;
  pbMain.Canvas.Pen.Color := clblack;
  pbMain.Canvas.Pen.Width := 1;
  pbMain.Canvas.FillRect(0,0,pbMain.Width,pbMain.Height);
  //Application.ProcessMessages;
  GroupBox1.Visible := False;
  lblParameter.Visible := False;
  seParaMeter.Visible := False;
  lblParameter2.Visible := False;
  seParaMeter2.Visible := False;
  lblParameter3.Visible := False;
  seParaMeter3.Visible := False;
  lblParameter4.Visible := False;
  seParaMeter4.Visible := False;
end;

end.

