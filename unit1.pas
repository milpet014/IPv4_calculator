unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, ActnList, ComCtrls, math, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    BR: TStaticText;
    BR_Out: TEdit;
    calc1: TButton;
    NM_Out: TEdit;
    ERROR1: TLabel;
    FA: TStaticText;
    FA_Out: TEdit;
    input1: TEdit;
    LA: TStaticText;
    MainMenu1: TMainMenu;
    Display: TMenuItem;
    About: TMenuItem;
    Mode: TMenuItem;
    Light: TMenuItem;
    Dark: TMenuItem;
    NM: TStaticText;
    Version: TMenuItem;
    Help: TMenuItem;
    wip1: TLabel;
    wip2: TLabel;
    LA_Out: TEdit;
    NET: TStaticText;
    NET_Out: TEdit;
    PageControl: TPageControl;
    IPv4: TTabSheet;
    FLSM: TTabSheet;
    VLSM: TTabSheet;
    procedure calc1Click(Sender: TObject);
    procedure DarkClick(Sender: TObject);
    procedure FA_OutChange(Sender: TObject);
    procedure ERROR1Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure IPv4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure PageControlChange(Sender: TObject);
    procedure LightClick(Sender: TObject);
    procedure VersionClick(Sender: TObject);
    procedure wip1Click(Sender: TObject);
    procedure LA_OutChange(Sender: TObject);
    procedure input1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LAClick(Sender: TObject);
    procedure NETClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FAClick(Sender: TObject);
    procedure BRClick(Sender: TObject);
    procedure NMClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  input,SnetAddress,SfirstAddress,SlastAddress,SbroadcastAddress,SNetworkMask:string;
  inputAddress,inputPrefix:TStringArray;
  prefix,octet:integer;
  maskArray:array[0..3] of byte;
  addressArray:array[0..3] of byte;
  prefixArray:array[1..32] of byte;
  netAddress:array[0..3] of byte;
  firstAddress:array[0..3] of byte;
  lastAddress:array[0..3] of byte;
  broadcastAddress:array[0..3] of byte;
  i,j:byte;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.LAClick(Sender: TObject);
begin

end;

procedure TForm1.input1Change(Sender: TObject);
begin

end;

procedure TForm1.LA_OutChange(Sender: TObject);
begin

end;

procedure TForm1.ERROR1Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.IPv4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

procedure TForm1.PageControlChange(Sender: TObject);
begin

end;

procedure TForm1.LightClick(Sender: TObject);
begin
end;

procedure TForm1.VersionClick(Sender: TObject);
begin
  Application.MessageBox('Verzia 0.9', 'IPv4 Kalkulátor - Verzia');
end;

procedure TForm1.DarkClick(Sender: TObject);
begin
  //TForm1.PageControl.Color := clBlack;
end;

procedure TForm1.wip1Click(Sender: TObject);
begin

end;

procedure TForm1.calc1Click(Sender: TObject);
begin
  input := input1.Text;

  inputPrefix := input.Split('/');
  prefix := StrToInt(inputPrefix[1]);
  input := inputPrefix[0];
  inputAddress := input.Split('.');


  for i := 0 to 3 do
  begin
    addressArray[i] := StrToInt(inputAddress[i]);
  end;

  for i := 1 to 32 do
  begin
    if i <= prefix then prefixArray[i] := 1
    else prefixArray[i] := 0;
  end;

  for i := 0 to 3 do
  begin
    maskArray[i] := 0;
    for j := 1 to 8 do
    begin
      maskArray[i] := maskArray[i] + prefixArray[j + 8 * i] * round(Power(2, 8 - j)) ;
    end;
  end;

  for i := 0 to 3 do
  begin
    netAddress[i] := addressArray[i] and maskArray[i];
    firstAddress[i] := netAddress[i];
    broadcastAddress[i] := addressArray[i] or (not maskArray[i]);
    lastAddress[i] := broadcastAddress[i];
  end;

  firstAddress[3] := firstAddress[3] + 1;
  lastAddress[3] := lastAddress[3] - 1;

  for i := 0 to 4 do
  begin
    SnetAddress := IntToStr(netAddress[0]) + '.' + IntToStr(netAddress[1]) + '.' + IntToStr(netAddress[2]) + '.' + IntToStr(netAddress[3]);
    SfirstAddress := IntToStr(firstAddress[0]) + '.' + IntToStr(firstAddress[1]) + '.' + IntToStr(firstAddress[2]) + '.' + IntToStr(firstAddress[3]);
    SlastAddress := IntToStr(lastAddress[0]) + '.' + IntToStr(lastAddress[1]) + '.' + IntToStr(lastAddress[2]) + '.' + IntToStr(lastAddress[3]);
    SbroadcastAddress := IntToStr(broadcastAddress[0]) + '.' + IntToStr(broadcastAddress[1]) + '.' + IntToStr(broadcastAddress[2]) + '.' + IntToStr(broadcastAddress[3]);
    SNetworkMask := IntToStr(maskArray[0]) + '.' + IntToStr(maskArray[1]) + '.' + IntToStr(maskArray[2]) + '.' + IntToStr(maskArray[3]);
  end;

  NET_Out.Text := SnetAddress;
  FA_Out.Text := SfirstAddress;
  LA_Out.Text := SlastAddress;
  BR_Out.Text := SbroadcastAddress;
  NM_Out.Text := SNetworkMask;

end;

procedure TForm1.FA_OutChange(Sender: TObject);
begin

end;

procedure TForm1.NETClick(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.FAClick(Sender: TObject);
begin

end;

procedure TForm1.BRClick(Sender: TObject);
begin

end;

procedure TForm1.NMClick(Sender: TObject);
begin

end;

end.

