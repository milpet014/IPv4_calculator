unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, ActnList, ComCtrls, math, Types, LCLIntf, Buttons, AnchorDockPanel;

type

  { TForm1 }

  TForm1 = class(TForm)
    AnchorDockPanel1: TAnchorDockPanel;
    AnchorDockPanel2: TAnchorDockPanel;
    AnchorDockPanel3: TAnchorDockPanel;
    AnchorDockPanel4: TAnchorDockPanel;
    disableReset_button_test: TBitBtn;
    Image1: TImage;
    start_button_test: TBitBtn;
    next_button_test: TBitBtn;
    TestFromAll_out_test: TStaticText;
    testFromAll_text_test: TStaticText;
    tests_input_test: TEdit;
    help_button_test: TBitBtn;
    help_text_test: TLabel;
    Score_text_test: TLabel;
    tests_text_test: TLabel;
    score_out_test: TLabel;
    Reset_button_test: TBitBtn;
    calc1: TBitBtn;
    Check_button_test: TBitBtn;
    BR: TStaticText;
    BR_Out: TEdit;
    LA_input_test: TEdit;
    BR_input_test: TEdit;
    NET_input_test: TEdit;
    FA_input_test: TEdit;
    NM_input_test: TEdit;
    instructions0_test: TLabel;
    instructions1_test: TLabel;
    assignment_address_test: TLabel;
    BR_test: TLabel;
    LA_test: TLabel;
    NET_test: TLabel;
    FA_test: TLabel;
    NM_test: TLabel;
    Language: TMenuItem;
    Slovak: TMenuItem;
    English: TMenuItem;
    NM_Out: TEdit;
    instructions0: TLabel;
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
    LA_Out: TEdit;
    NET: TStaticText;
    NET_Out: TEdit;
    PageControl: TPageControl;
    IPv4: TTabSheet;
    FLSM: TTabSheet;
    VLSM: TTabSheet;
    procedure calc1Click(Sender: TObject);
    procedure Check_button_testClick(Sender: TObject);
    procedure DarkClick(Sender: TObject);
    procedure disableReset_button_testClick(Sender: TObject);
    procedure DisplayClick(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure FA_OutChange(Sender: TObject);
    procedure help_button_testClick(Sender: TObject);
    procedure instructions0Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure IPv4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure next_button_testClick(Sender: TObject);
    procedure Reset_button_testClick(Sender: TObject);
    procedure Score_text_testClick(Sender: TObject);
    procedure SlovakClick(Sender: TObject);
    procedure NM_testClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure LightClick(Sender: TObject);
    procedure start_button_testClick(Sender: TObject);
    procedure TestFromAll_out_testClick(Sender: TObject);
    procedure tests_input_testChange(Sender: TObject);
    procedure VersionClick(Sender: TObject);
    procedure wip1Click(Sender: TObject);
    procedure LA_OutChange(Sender: TObject);
    procedure input1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LAClick(Sender: TObject);
    procedure NETClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure LanguageClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FAClick(Sender: TObject);
    procedure BRClick(Sender: TObject);
    procedure NMClick(Sender: TObject);
    procedure instructions0_testClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  input:string;
  SnetAddress,SfirstAddress,SlastAddress,SbroadcastAddress,SNetworkMask:string;
  assignments,actualAssignemnt,correctAssignments, points:integer;
  correctInput,onlyOneError,started,thisIsCorrect,checkedByButton,checked, disabledReset:boolean;
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

procedure calcIPv4(inputFunction:string);
var
  inputAddress,inputPrefix:TStringArray;
  prefix:integer;
  maskArray:array[0..3] of byte;
  addressArray:array[0..3] of integer;
  prefixArray:array[1..32] of byte;
  netAddress:array[0..3] of byte;
  firstAddress:array[0..3] of byte;
  lastAddress:array[0..3] of byte;
  broadcastAddress:array[0..3] of byte;
begin
  onlyOneError := true;
  correctInput := true;
  input := inputFunction;

  if(input <> '')then
  begin
    inputPrefix := input.Split('/');
    Try
      if Length(inputPrefix) <> 2 then inputError('Nesprávny vstup', 'Zlý vstup', $2030);
      if not TryStrToInt(inputPrefix[1], prefix) then inputError('Nesprávny formát prefixu', 'Chyba', $2030);
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
            if ((addressArray[i] > 255) OR (addressArray[i] < 0)) then inputError('Adresa je mimo rozsahu. IPv4 adresa sa skladá zo štyroch oktetov, každý z nich má osem bitov, čiže každý oktet musí byť v intervale od 0 po 255.', 'Zlý vstup', $2030);
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

      SnetAddress := '';
      SfirstAddress := '';
      SlastAddress := '';
      SbroadcastAddress := '';
      SNetworkMask := '';

      for i := 0 to  3 do
      begin
        SnetAddress := SnetAddress + IntToStr(netAddress[i]);
        SfirstAddress := SfirstAddress + IntToStr(firstAddress[i]);
        SlastAddress := SlastAddress + IntToStr(lastAddress[i]);
        SbroadcastAddress := SbroadcastAddress + IntToStr(broadcastAddress[i]);
        SNetworkMask := SNetworkMask + IntToStr(maskArray[i]);
        if (i < 3) then
        begin
          SnetAddress := SnetAddress + '.';
          SfirstAddress := SfirstAddress + '.';
          SlastAddress := SlastAddress + '.';
          SbroadcastAddress := SbroadcastAddress + '.';
          SNetworkMask := SNetworkMask + '.';
        end;
      end;
    end


    else
    begin
      SnetAddress := '';
      SfirstAddress := '';
      SlastAddress := '';
      SbroadcastAddress := '';
      SNetworkMask := '';
    end;
  end
  else inputError('Nesprávny vstup', 'Zlý vstup', $2030);
end;

procedure TForm1.calc1Click(Sender: TObject);
begin
  calcIPv4(input1.Text);

  NET_Out.Text := SnetAddress;
  FA_Out.Text := SfirstAddress;
  LA_Out.Text := SlastAddress;
  BR_Out.Text := SbroadcastAddress;
  NM_Out.Text := SNetworkMask;
end;

function randomIPv4():string;
begin
  randomIPv4 := IntToStr(Random(254) + 1) + '.' + IntToStr(Random(255)) + '.' +IntToStr(Random(255)) + '.' +IntToStr(Random(255)) + '/' + IntToStr(Random(22) + 8);
end;

procedure TForm1.start_button_testClick(Sender: TObject);
begin
  if not (started) then
  begin
    start_button_test.Enabled := false;
    help_button_test.Enabled := false;
    if not TryStrToInt(tests_input_test.Text, assignments) then
    begin
      Application.MessageBox('Musíte zadať číslo', 'Chyba', $2030);
      started := false;
      start_button_test.Enabled := true;
    end
    else if ((assignments < 1) OR (assignments > 100)) then
    begin
      Application.MessageBox('Číslo musí byť od 1 po 100', 'Chyba', $2030);
      started := false;
      start_button_test.Enabled := true;
    end
    else
      begin
      started := true;
      IPv4.TabVisible := false;
      disableReset_button_test.Enabled := false;

      randomize();
      input := randomIPv4();
      assignment_address_test.Caption := input;



      actualAssignemnt := 1;

      TestFromAll_out_test.Caption := IntToStr(actualAssignemnt) + '/' + IntToStr(assignments);
      score_out_test.Caption := IntToStr(correctAssignments) + '/' + IntToStr(assignments);

    end;

  end
  else Application.MessageBox('Už ste začali, pokračujte v zadaní, alebo stlačte "reset"', 'Test beží', $0040);

end;

procedure resetElement(element:TEdit);
begin
  element.ReadOnly := false;
  element.Color := clDefault;
  element.Text := '';
end;

procedure TForm1.Reset_button_testClick(Sender: TObject);
begin
  if not (disabledReset) then
  begin
    start_button_test.Enabled := true;
    help_button_test.Enabled := true;
    disableReset_button_test.Enabled := true;
    IPv4.TabVisible := true;
    started := false;
    input := '0.0.0.0/24';
    assignment_address_test.Caption := input;
    assignments := 0;
    correctAssignments := 0;
    actualAssignemnt := 0;
    points := 0;
    score_out_test.Caption := '0/0';
    TestFromAll_out_test.Caption := '0/0';

    resetElement(NM_input_test);
    resetElement(NET_input_test);
    resetElement(FA_input_test);
    resetElement(LA_input_test);
    resetElement(BR_input_test);


  end;
end;

procedure compareAnswer(firstString:string; testedElement:TEdit);
begin
   if (CompareStr(firstString, testedElement.text) = 0) then
  begin
    thisIsCorrect := true;
    testedElement.Color := $90EE90;
    Inc(points);
  end
  else
  begin
    thisIsCorrect := false;
    testedElement.Color := $9090ee;
  end;
  testedElement.ReadOnly := true;

end;

procedure check(nm,net,fa,la,br:TEdit; assignmentNet,score:TLabel);
begin

  calcIPv4(assignmentNet.Caption);

  compareAnswer(SNetworkMask, nm);
  compareAnswer(SnetAddress, net);
  compareAnswer(SfirstAddress,  fa);
  compareAnswer(SlastAddress, la);
  compareAnswer(SbroadcastAddress, br);

  if thisIsCorrect then
  begin
    Inc(correctAssignments);
    score.Caption := IntToStr(correctAssignments) + '/' + IntToStr(assignments);
  end
end;

procedure TForm1.Check_button_testClick(Sender: TObject);
begin
  if (started AND not checked) then
  begin
  checkedByButton := true;
  checked := true;
  check(NM_input_test, NET_input_test, FA_input_test, LA_input_test, BR_input_test, assignment_address_test, score_out_test);
  end
  else Application.MessageBox('Pre začatie testu, stlačte "Štart"', 'Test nie je aktívny', $0040);
end;

procedure TForm1.next_button_testClick(Sender: TObject);
var
  grade,percents, totalPoints:integer;
begin
  checked := false;
  if (started) then
  begin
    if not (checkedByButton) then check(NM_input_test, NET_input_test, FA_input_test, LA_input_test, BR_input_test, assignment_address_test, score_out_test);
    checkedByButton := false;

    if (actualAssignemnt < assignments) then
    begin
      input := randomIPv4();
      assignment_address_test.Caption := input;
      Inc(actualAssignemnt);
      TestFromAll_out_test.Caption := IntToStr(actualAssignemnt) + '/' + IntToStr(assignments);

      resetElement(NM_input_test);
      resetElement(NET_input_test);
      resetElement(FA_input_test);
      resetElement(LA_input_test);
      resetElement(BR_input_test);
    end
    else
    begin
      totalPoints := assignments * 5;
      percents := round(points / totalPoints * 100);
      if ((percents >= 0) AND (percents <= 29)) then grade := 5
      else if ((percents >= 30) AND (percents <= 49)) then grade := 4
      else if ((percents >= 50) AND (percents <= 74)) then grade := 3
      else if ((percents >= 75) AND (percents <= 89)) then grade := 2
      else if (percents >= 90) then grade := 1;

      IPv4.TabVisible := true;
      disableReset_button_test.Enabled := true;
      help_button_test.Enabled := true;
      Reset_button_test.Enabled := true;
      disabledReset := false;

      Application.MessageBox(PChar('Hotovo, toto bol posledný príklad :) ' + sLineBreak +
      'Vaše skóre, body: ' + IntToStr(points) + '/' + IntToStr(totalPoints) + sLineBreak +
      'Vaše skóre, percentá: ' +  IntToStr(percents) + '%' + sLineBreak +
      'Známka: ' + IntToStr(grade)), 'Hotovo', $2040);
    end;
  end
  else Application.MessageBox('Bre začatie testu, stlačte "Štart"', 'Test nie je aktívny', $0040);
end;


procedure TForm1.disableReset_button_testClick(Sender: TObject);
begin
  disabledReset := true;
  disableReset_button_test.Enabled := false;
  Reset_button_test.Enabled := false;
end;

procedure TForm1.TestFromAll_out_testClick(Sender: TObject);
begin

end;

procedure TForm1.tests_input_testChange(Sender: TObject);
begin

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

procedure TForm1.instructions0Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.IPv4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;




procedure TForm1.Score_text_testClick(Sender: TObject);
begin

end;

procedure TForm1.SlovakClick(Sender: TObject);
begin
  Application.MessageBox('Táto funkcia je stále vo vývoji. ' + sLineBreak + 'Thias function is under development.', 'WIP');
end;

procedure TForm1.NM_testClick(Sender: TObject);
begin

end;

procedure TForm1.PageControlChange(Sender: TObject);
begin

end;

procedure TForm1.LightClick(Sender: TObject);
begin
  Application.MessageBox('Táto funkcia je stále vo vývoji. ' + sLineBreak + 'Thias function is under development.', 'WIP');
end;



procedure TForm1.VersionClick(Sender: TObject);
begin
  Application.MessageBox('Verzia Alpha-0.93', 'Verzia');
end;

procedure TForm1.HelpClick(Sender: TObject);
begin
  OpenURL('https://github.com/milpet014/IPv4_calculator');
end;

procedure TForm1.DarkClick(Sender: TObject);
begin
  Application.MessageBox('Táto funkcia je stále vo vývoji. ' + sLineBreak + 'Thias function is under development.', 'WIP');
end;


procedure TForm1.DisplayClick(Sender: TObject);
begin

end;

procedure TForm1.EnglishClick(Sender: TObject);
begin
  Application.MessageBox('Táto funkcia je stále vo vývoji. ' + sLineBreak + 'Thias function is under development.', 'WIP');
end;

procedure TForm1.wip1Click(Sender: TObject);
begin

end;

procedure TForm1.FA_OutChange(Sender: TObject);
begin

end;

procedure TForm1.help_button_testClick(Sender: TObject);
begin
  OpenURL('https://cloud.milpet.eu/s/IPv4_adresacia');
end;

procedure TForm1.NETClick(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.LanguageClick(Sender: TObject);
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

procedure TForm1.instructions0_testClick(Sender: TObject);
begin

end;

begin
  disabledReset := false;
  //checked := false;

end.

