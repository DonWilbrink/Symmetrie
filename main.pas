unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ExtCtrls,
  StdCtrls, Spin;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    lblParameter2: TLabel;
    lblParameter: TLabel;
    MainMenu1: TMainMenu;
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
    procedure mniHexaClick(Sender: TObject);
    procedure mniKleedClick(Sender: TObject);
    procedure mniQuadrClick(Sender: TObject);
    procedure mniRuitClick(Sender: TObject);
    procedure mniRaamClick(Sender: TObject);
    procedure mniCycloideClick(Sender: TObject);
    procedure mniBloemClick(Sender: TObject);
    procedure mniParalClick(Sender: TObject);
    procedure mniRandClick(Sender: TObject);
    procedure mniStempelClick(Sender: TObject);
    procedure mniTriClick(Sender: TObject);
    procedure mniWervelClick(Sender: TObject);
    procedure seParameter2Change(Sender: TObject);
    procedure seParameterChange(Sender: TObject);
  private

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
  GroupBox1.Visible := False;
  pbMain.Canvas.Clear;
  prog := 1;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniBloem.Caption + ']';
  a := 1;
  b := 1.5;
  c := 1;
  m := 7;
  n := 400;
  xOff := pbMain.Canvas.Width div 2 - 120;
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

procedure TfrmMain.mniParalClick(Sender: TObject);
var
  a, x1, y1, xFac, yFac: Double;
  b, c, f, i, i1, i2, j, k, m, n, n1, n2, r, s, xOff, yOff: Integer;
  x, y: Array of Integer;
begin
  prog := 5;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniParal.Caption + ']';
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
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
  GroupBox1.Visible := True;
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
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  xFac := pbMain.Canvas.Width/160;
  yFac := pbMain.Canvas.Height/120;
  xOff := 100;
  yOff := 100;
  seParameter.MaxValue := 8;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Stand1';
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

procedure TfrmMain.mniTriClick(Sender: TObject);
var
  b, f, i, j, k, m, n, n1, n2, s, xOff, yOff: Integer;
  p1, p2, x1, y1, xFac, yFac: Double;
  x, y: Array of Double;
begin
  prog := 9;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniTri.Caption + ']';
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 3;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Niet gebruikt';
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

procedure TfrmMain.mniCycloideClick(Sender: TObject);
var
  k, m, n, xOff, yOff: Integer;
  t, x1, x2, y1, y2, xFac, yFac: Double;
begin
  prog := 3;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniCycloide.Caption + ']';
  GroupBox1.Visible := False;
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

procedure TfrmMain.mniRaamClick(Sender: TObject);
var
  f, j, k, m, n, n1, n2, s, x1, y1, xOff, yOff: Integer;
  xFac, yFac: Double;
  x, y: Array of Integer;
begin
  prog := 6;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniRaam.Caption + ']';
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 5;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Niet gebruikt';
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
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;
  lblParameter.Caption := 'Rangnummer';
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Niet gebruikt';
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
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 3;
  seParameter.MinValue := 1;
  //seParameter.Value := 1;   ummer';
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Niet gebruikt';
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

procedure TfrmMain.mniHexaClick(Sender: TObject);
var
  b, f, i, j, k, m, n, n1, n2, s, xOff, yOff: Integer;
  p1, x1, y1, xFac, yFac: Double;
  x, y: Array of Double;
begin
  prog := 10;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniHexa.Caption + ']';
  GroupBox1.Visible := True;
  pbMain.Canvas.Clear;
  seParameter.MaxValue := 2;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Rangnummer';
  seParameter2.MaxValue := 5;
  seParameter2.MinValue := 1;
  lblParameter2.Caption := 'Niet gebruikt';
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
  pbMain.Canvas.Clear;
  xm := pbMain.Canvas.Width div 2 - 100;
  ym := pbMain.Canvas.Height div 2;
  seParameter.MaxValue := 50;
  seParameter.MinValue := 1;
  lblParameter.Caption := 'Parameter N';
  seParameter2.MaxValue := 150;
  seParameter2.MinValue := 100;
  lblParameter2.Caption := 'Parameter C';
  GroupBox1.Visible := True;
  prog := 11;
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

procedure TfrmMain.mniWervelClick(Sender: TObject);
var
  x, y: Array[0..7] of Double;
  i, j, k, l, m, n, xOff, yOff: Integer;
  a, c, f, t, xFac, yFac, z: Double;
begin
  prog := 2;
  frmMain.Caption := 'Symmetrie. Regelmatige structuren in de kunst. [' + mniWervel.Caption + ']';
  GroupBox1.Visible := False;
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
  end;
end;

procedure TfrmMain.seParameterChange(Sender: TObject);
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
  end;
end;

end.

