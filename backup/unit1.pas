unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, ActnList, ComCtrls, math, Types, LCLIntf;

type

  { TForm1 }

  TForm1 = class(TForm)
    BR: TStaticText;
    BR_Out: TEdit;
    calc1: TButton;
    wip4: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
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
    Test: TTabSheet;
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
    wip3: TLabel;
    procedure calc1Click(Sender: TObject);
    procedure DarkClick(Sender: TObject);
    procedure DisplayClick(Sender: TObject);
    procedure FA_OutChange(Sender: TObject);
    procedure ERROR1Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure HelpClick(Sender: TObject);
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
  addressArray:array[0..3] of integer;
  prefixArray:array[1..32] of byte;
  netAddress:array[0..3] of byte;
  firstAddress:array[0..3] of byte;
  lastAddress:array[0..3] of byte;
  broadcastAddress:array[0..3] of byte;
  correctInput,onlyOneError:boolean;
  i,j:byte;


implementation

{$R *.lfm}

{ TForm1 }

procedure inputError(text,title:PChar; code:integer);
begin
  if (onlyOneError) then
  begin
    onlyOneError := false;
    Application.MessageBox(text, title, code);
    input := '0.0.0.0/24';
    correctInput := false;
  end;
end;

procedure TForm1.calc1Click(Sender: TObject);
begin
  onlyOneError := true;
  correctInput := true;
  input := input1.Text;

  if(input <> '')then
  begin
    inputPrefix := input.Split('/');
    Try
      if Length(inputPrefix) <> 2 then inputError('Nesprávny vstup', 'Zlý vstup', $2030);
      if not TryStrToInt(inputPrefix[1], prefix) then inputError('Nesprávny prefix', 'Chyba', $2030);
      if ((prefix > 32) OR (prefix < 0)) then inputError('Prefix je mimo rozsahu. Prefix je číslo od 0 po 32.', 'Zlý vstup', $2030);
    except
      On E: Exception do inputError('Nastala neočakávana chyba, skúste opakovať akciu.', 'Chyba', $2010);
    end;

    //#################################################################

    input := inputPrefix[0];
    inputAddress := input.Split('.');

    Try
      if (Length(inputAddress) <> 4) then inputError('Nesprávna adresa', 'zlý vstup', $2030)
      else
        begin
          for i := 0 to 3 do
          begin
            if not TryStrToInt(inputAddress[i], addressArray[i]) then inputError('Nesprávny formát adresy', 'Zlý vstup', $2030);
            for j := 0 to 3 do
            begin
              if ((addressArray[j] > 255) OR (addressArray[j] < 0)) then inputError('Adresa je mimo rozsahu. IPv4 adresa sa skladá zo štyroch oktetov, každý z nich má osem bitov, čiže každý oktet musí byť v intervale od 0 po 255.', 'Zlý vstup', $2030);
            end;
          end;
        end;

    except
      On E: Exception do
      begin
        Application.MessageBox('Nastala neočakávana chyba, skúste opakovať akciu.', 'Chyba', $2010);
        for i := 0 to 3 do
        begin
          addressArray[i] := 0;
        end
      end;
    end;

    //################################################################

    if(correctInput) then
    begin

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

      if((prefix <> 31) AND (prefix <> 32)) then
      begin
        firstAddress[3] := firstAddress[3] + 1;
        lastAddress[3] := lastAddress[3] - 1;
      end;

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
    end

    else
    begin
      NET_Out.Text := '';
      FA_Out.Text := '';
      LA_Out.Text := '';
      BR_Out.Text := '';
      NM_Out.Text := '';
    end;
  end
  else inputError('Nesprávny vstup', 'Zlý vstup', $2030);
end;


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
  Application.MessageBox('Verzia 0.9', 'Verzia');
end;

procedure TForm1.HelpClick(Sender: TObject);
begin
  OpenURL('https://github.com/milpet014/IPv4_calculator');
end;

procedure TForm1.DarkClick(Sender: TObject);
begin
  //TForm1.PageControl.Color := clBlack;
end;

procedure TForm1.DisplayClick(Sender: TObject);
begin

end;

procedure TForm1.wip1Click(Sender: TObject);
begin

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

begin
end.

