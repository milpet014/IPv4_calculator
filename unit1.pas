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
    VLSM_exportButt: TBitBtn;
    FLSM_exportBtn: TBitBtn;
    FLSM_SaveDialog: TSaveDialog;
    VLSM_output_ScroolBox: TScrollBox;
    VLSM_calculate_button: TBitBtn;
    BR: TStaticText;
    VLSM_input_address: TEdit;
    FA: TStaticText;
    LA: TStaticText;
    NET: TStaticText;
    NM: TStaticText;
    VLSM_input_scrollBox: TScrollBox;
    VLSM_generate_Subnets: TBitBtn;
    VLSM_subnets_amount: TEdit;
    FLSM_OkButt: TBitBtn;
    disableReset_button_test: TBitBtn;
    FLSM_AddressesAmount: TEdit;
    FLSM_input: TEdit;
    Image1: TImage;
    FLSM_header_label: TLabel;
    FLSM_new_subnets_label: TLabel;
    VLSM_result_number_2: TLabel;
    VLSM_result_number_1: TLabel;
    VLSM_result_label_2: TLabel;
    VLSM_result_label_1: TLabel;
    VLSM_network_input_label: TLabel;
    VLSM_input_label_2: TLabel;
    VLSM_inpou_label_1: TLabel;
    VLSM_new_subnets_label: TLabel;
    Network_label: TLabel;
    FLSMScrollBox1: TScrollBox;
    VLSM_header_label: TLabel;
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
    FA_Out: TEdit;
    input1: TEdit;
    MainMenu1: TMainMenu;
    Display: TMenuItem;
    About: TMenuItem;
    Mode: TMenuItem;
    Light: TMenuItem;
    Dark: TMenuItem;
    Test: TTabSheet;
    Version: TMenuItem;
    Help: TMenuItem;
    LA_Out: TEdit;
    NET_Out: TEdit;
    PageControl: TPageControl;
    IPv4: TTabSheet;
    FLSM: TTabSheet;
    VLSM: TTabSheet;
    procedure AnchorDockPanel3Click(Sender: TObject);
    procedure calc1Click(Sender: TObject);
    procedure Check_button_testClick(Sender: TObject);
    procedure DarkClick(Sender: TObject);
    procedure disableReset_button_testClick(Sender: TObject);
    procedure DisplayClick(Sender: TObject);
    procedure FLSM_AddressesAmountChange(Sender: TObject);
    procedure EnglishClick(Sender: TObject);
    procedure FA_OutChange(Sender: TObject);
    procedure FLSM_exportBtnClick(Sender: TObject);
    procedure FLSM_OkButtClick(Sender: TObject);
    procedure help_button_testClick(Sender: TObject);
    procedure instructions0Click(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure IPv4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FLSM_new_subnets_labelClick(Sender: TObject);
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
    procedure VLSM_calculate_buttonClick(Sender: TObject);
    procedure VLSM_exportButtClick(Sender: TObject);
    procedure VLSM_generate_SubnetsClick(Sender: TObject);
    procedure VLSM_header_labelClick(Sender: TObject);
    procedure VLSM_result_label_1Click(Sender: TObject);
    procedure VLSM_result_label_2Click(Sender: TObject);
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
    //procedure GenerateFLSMOutputs(count: integer; output: string);
    //procedure ClearOldFLSMOutputs();
    procedure FormDestroy(Sender: TObject);
    procedure FLSMCalculation(FLSMInputAddress:string; amount:integer);

  private
    FLSMComponents: TList; //lit generovanych komponentov pre FLSM
    VLSMInputComponents: TList;
    VLSMOutputComponents: TList;
    CurrentComponentList: TList;

  public
    procedure GenerateVLSMInputs(count: integer);
    //procedure ClearOldFLSMEdits();
    procedure calcIPv4(inputFunction:string; all:boolean);
    procedure resetElement(element:TEdit);
    procedure compareAnswer(firstString:string; testedElement:TEdit);
    procedure check(nmEdit,netEdit,faEdit,laEdit,brEdit:TEdit; assignmentNet,score:TLabel);
    procedure AddresationOnClick(Sender: TObject);
    procedure ClearOldVLSMInputs();
    procedure ClearOldVLSMOutputs();
    procedure ClearOldFLSMOutputs();
    procedure calcVLSM(size:integer);
    procedure export(vlsmBool:boolean);

    function randomIPv4():string;

  end;

var
  Form1: TForm1;
  input:string;
  NetAddressBin,SnetAddressComplet,SnetAddress,SfirstAddress,SlastAddress,SbroadcastAddress,SNetworkMask:string;
  assignments,actualAssignemnt,correctAssignments, points, hosts:integer;
  correctInput,onlyOneError,started,thisIsCorrect,checkedByButton,checked, disabledReset:boolean;
  i,j:byte;
  exportFile:textFile;


implementation

{$R *.lfm}

{ TForm1 }

procedure inputError(textOutput,title:PChar; code:integer);
begin
  if (onlyOneError) then
  begin
    onlyOneError := false;
    Application.MessageBox(textOutput, title, code);
    input := '0.0.0.0/24';
    correctInput := false;
  end;
end;

//#############################################################

(*function addressToBinary(address:string):string;
var
  SaddressArray:TStringArray;
  addressArray:array[0..3] of integer;
  i:byte;
  binAddressArr:array[0..3] of string;
  binAddress:string;
  x:integer;

begin
  SaddressArray := address.Split('.');
  binAddress := '';

  for i := 0 to 3 do
  begin
     addressArray[i] := StrToInt(SaddressArray[i]);
     binAddressArr[i] := '';

     while addressArray[i] > 0 do
     begin;
        x := addressArray[i] mod 2;
        binAddressArr[i] := Concat(IntToStr(x), binAddressArr[i]);
        addressArray[i] := addressArray[i] div 2;
     end;
     while Length(binAddressArr[i]) < 8 do
     begin
        binAddressArr[i] := '0' + binAddressArr[i];
     end;
     binAddress := Concat(binAddress, binAddressArr[i]);
  end;

  Result := binAddress;

end;     *)

function addressToCardinal(inputAddress:string):UInt32;
var
  SaddressArray:TStringArray;
  addressArray:array[0..3] of integer;
  i: byte;
  ip:UInt32;
begin
  SaddressArray := inputAddress.Split('.');

  for i := 0 to 3 do addressArray[i] := StrToInt(SaddressArray[i]);
  ip := (addressArray[0] shl 24) or (addressArray[1] shl 16) or (addressArray[2] shl 8) or addressArray[3];
  result := ip;
end;

function cardinalToAddress(inputNum:UInt32):string;
var
  o0,o1,o2,o3:byte;
begin
  o0 := (inputNum shr 24) and 255;
  o1 := (inputNum shr 16) and 255;
  o2 := (inputNum shr 8) and 255;
  o3 := inputNum and 255;

  result := IntToStr(o0) + '.' + IntToStr(o1) + '.' + IntToStr(o2) + '.' + IntToStr(o3);
end;

procedure TForm1.calcIPv4(inputFunction:string; all:boolean);
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
        if all then
        begin
          firstAddress[i] := netAddress[i];
          broadcastAddress[i] := addressArray[i] or (not maskArray[i]);
          lastAddress[i] := broadcastAddress[i];
        end;
      end;

      if((prefix <> 31) AND (prefix <> 32)) AND all then
      begin
        firstAddress[3] := firstAddress[3] + 1;
        lastAddress[3] := lastAddress[3] - 1;
      end;

      SnetAddress := '';
      SnetAddressComplet := '0.0.0.0/0';
      if all then
      begin
        SfirstAddress := '';
        SlastAddress := '';
        SbroadcastAddress := '';
        SNetworkMask := '';
      end;

      for i := 0 to  3 do
      begin
        SnetAddress := SnetAddress + IntToStr(netAddress[i]);
        if all then
        begin
          SfirstAddress := SfirstAddress + IntToStr(firstAddress[i]);
          SlastAddress := SlastAddress + IntToStr(lastAddress[i]);
          SbroadcastAddress := SbroadcastAddress + IntToStr(broadcastAddress[i]);
          SNetworkMask := SNetworkMask + IntToStr(maskArray[i]);
        end;
        if (i < 3) then
        begin
          SnetAddress := SnetAddress + '.';
          if all then
          begin
            SfirstAddress := SfirstAddress + '.';
            SlastAddress := SlastAddress + '.';
            SbroadcastAddress := SbroadcastAddress + '.';
            SNetworkMask := SNetworkMask + '.';
          end;
        end;
      end;
      SnetAddressComplet := SnetAddress + '/' + IntToStr(prefix);
    end


    else
    begin
      SnetAddress := '';
      SfirstAddress := '';
      SlastAddress := '';
      SbroadcastAddress := '';
      SNetworkMask := '';
      SnetAddressComplet := '0.0.0.0/0';
    end;
  end
  else inputError('Nesprávny vstup', 'Zlý vstup', $2030);
end;

procedure TForm1.calc1Click(Sender: TObject);
begin
  calcIPv4(input1.Text, true);

  NET_Out.Text := SnetAddress;
  FA_Out.Text := SfirstAddress;
  LA_Out.Text := SlastAddress;
  BR_Out.Text := SbroadcastAddress;
  NM_Out.Text := SNetworkMask;
end;

procedure TForm1.AnchorDockPanel3Click(Sender: TObject);
begin

end;

function TForm1.randomIPv4():string;
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
      FLSM.TabVisible := false;
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

procedure TForm1.resetElement(element:TEdit);
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
    FLSM.TabVisible := true;
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

procedure TForm1.compareAnswer(firstString:string; testedElement:TEdit);
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

procedure TForm1.check(nmEdit,netEdit,faEdit,laEdit,brEdit:TEdit; assignmentNet,score:TLabel);
begin

  calcIPv4(assignmentNet.Caption, true);

  compareAnswer(SNetworkMask, nmEdit);
  compareAnswer(SnetAddress, netEdit);
  compareAnswer(SfirstAddress,  faEdit);
  compareAnswer(SlastAddress, laEdit);
  compareAnswer(SbroadcastAddress, brEdit);

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
      FLSM.TabVisible := true;
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
  else Application.MessageBox('Pre začatie testu, stlačte "Štart"', 'Test nie je aktívny', $0040);
end;


procedure TForm1.disableReset_button_testClick(Sender: TObject);
begin
  disabledReset := true;
  disableReset_button_test.Enabled := false;
  Reset_button_test.Enabled := false;
end;

//################################################### FLSM ###########################################

procedure TForm1.ClearOldFLSMOutputs();
var
  i:integer;
begin
  for i := FLSMComponents.Count - 1 downto 0 do TObject(FLSMComponents[i]).Free;

  FLSMComponents.Clear; // vymaze zoznam FLSM
end;

procedure TForm1.AddresationOnClick(Sender: TObject);
var
  btn: TBitBtn;
  hosts,i,prefix:integer;
  editOut:TEdit;
  FullAddress:TStringArray;
begin
  btn := TBitBtn(Sender);

  for i := 0 to CurrentComponentList.Count - 1 do
  begin
    if TObject(CurrentComponentList[i]) is TEdit then
    begin
      editOut := TEdit(CurrentComponentList[i]);
      if editOut.Tag = btn.Tag then
      begin
        calcIPv4(editOut.Text, true);

        FullAddress := SnetAddressComplet.Split('/');
        hosts := round(Power(2,(32 - StrToInt(FullAddress[1]))));

        if hosts > 2 then
        begin
          Application.MessageBox(PChar('Sieťova adresa: ' + SnetAddress + sLineBreak +
          'Prvá adresa: ' + SfirstAddress + sLineBreak +
          'Posledná adresa: ' + SlastAddress + sLineBreak +
          'Broadcast adresa: ' + SbroadcastAddress + sLineBreak +
          'Sieťová maska: ' + SNetworkMask + sLineBreak +
          'Počet klientov: ' + IntToStr(hosts - 2)), 'Adresácia', $2040);
        end
        else
        begin
           Application.MessageBox(PChar('Sieťova adresa: ' + SnetAddress + sLineBreak +
          'Prvá adresa: ' + SfirstAddress + sLineBreak +
          'Posledná adresa: ' + SlastAddress + sLineBreak +
          'Broadcast adresa: ' + SbroadcastAddress + sLineBreak +
          'Sieťová maska: ' + SNetworkMask + sLineBreak +
          'Počet klientov: 0)'), 'Adresácia', $2040);
        end;
      end;
    end;
  end;
end;

(*procedure TForm1.GenerateFLSMOutputs(count:integer; output:string);
var
  i:integer;
  newTEdit:TEdit;
  newTButton:TBitBtn;
begin
  ClearOldFLSMOutputs();

  for i:= 0 to count - 1 do
  begin
    newTEdit := TEdit.Create(self);
    newTEdit.Parent := FLSMScrollBox1;
    newTEdit.Left := 10;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 200;
    newTEdit.Text := output;
    newTEdit.Tag := i;
    FLSMComponents.Add(newTEdit);

    newTButton := TBitBtn.Create(self);
    newTButton.Parent := FLSMScrollBox1;
    newTButton.Left := 220;
    newTButton.Top := 10 + 33 * i;
    newTButton.Width := 110;
    newTButton.Caption := 'Adresácia';
    newTButton.Tag := i;
    newTButton.Glyph.LoadFromFile('icons/ip_addressation-small.bmp');

    newTButton.OnClick := @AddresationOnClick;

    FLSMComponents.Add(newTButton);
  end;
end; *)

Procedure TForm1.FLSMCalculation(FLSMInputAddress:string; amount:integer);
var
  inputPrefix:TStringArray;
  prefix,powerNet,i:integer;

  newTEdit:TEdit;
  newTButton:TBitBtn;
  actualNetworkCardinal,decimalAddressCardinal:UInt32;

begin
  onlyOneError := true;
  SnetAddressComplet := '0.0.0.0/0';

  calcIPv4(FLSMInputAddress, false);

  if SnetAddressComplet = '0.0.0.0/0' then exit;

  inputPrefix := SnetAddressComplet.Split('/');
  prefix := StrToInt(inputPrefix[1]);

  decimalAddressCardinal := addressToCardinal(SnetAddress);



  powerNet := 1;
  while powerNet < amount do powerNet := powerNet * 2;

  prefix := prefix + Round(ln(powerNet) / ln(2));

  hosts :=  round(Power(2,(32 - prefix)));

  if prefix > 32 then
  begin
    inputError('Zadané podsieťovanie nie je možné', 'Chyba, zlý vstup', &2030);
    abort;
  end;

  CurrentComponentList := FLSMComponents;

  ClearOldFLSMOutputs();
  for i:= 0 to powerNet - 1 do
  begin

    actualNetworkCardinal := decimalAddressCardinal + (i * hosts);



    newTEdit := TEdit.Create(self);
    newTEdit.Parent := FLSMScrollBox1;
    newTEdit.Left := 10;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 200;
    newTEdit.Text :=  cardinalToAddress(actualNetworkCardinal) + '/' + IntToStr(prefix);
    newTEdit.Tag := i;
    FLSMComponents.Add(newTEdit);

    newTButton := TBitBtn.Create(self);
    newTButton.Parent := FLSMScrollBox1;
    newTButton.Left := 220;
    newTButton.Top := 10 + 33 * i;
    newTButton.Width := 110;
    newTButton.Caption := 'Adresácia';
    newTButton.Tag := i;
    newTButton.Glyph.LoadFromFile('icons/ip_addressation-small.bmp');

    newTButton.OnClick := @AddresationOnClick;

    FLSMComponents.Add(newTButton);
  end;

end;

procedure TForm1.FLSM_OkButtClick(Sender: TObject);
var
  count:integer;
begin

  if not TryStrToInt(FLSM_AddressesAmount.Text, count) then Application.MessageBox('Musíte zadať číslo', 'Chyba', $2030)
  else if ((count < 1) OR (count > 64)) then Application.MessageBox('Číslo musí byť od 1 po 64', 'Chyba', $2030)
  else
    begin
      FLSMCalculation(FLSM_input.Text, count);
    end;

end;

//############################################## VLSM ####################################################

procedure TForm1.ClearOldVLSMInputs();
var
  i:integer;
begin
  for i := VLSMInputComponents.Count - 1 downto 0 do TObject(VLSMInputComponents[i]).Free;

  VLSMInputComponents.Clear; // vymaze zoznam FLSM
end;

procedure TForm1.ClearOldVLSMOutputs();
var
  i:integer;
begin
  for i := VLSMOutputComponents.Count - 1 downto 0 do TObject(VLSMOutputComponents[i]).Free;

  VLSMOutputComponents.Clear; // vymaze zoznam FLSM
end;

procedure TForm1.GenerateVLSMInputs(count:integer);
var
  i:integer;
  newTEdit:TEdit;
begin
  ClearOldVLSMInputs();

  for i:= 0 to count - 1 do
  begin
    newTEdit := TEdit.Create(self);
    newTEdit.Parent := VLSM_input_scrollBox;
    newTEdit.Left := 10;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 250;
    newTEdit.Text := '';
    newTEdit.Tag := i;
    VLSMInputComponents.Add(newTEdit);
  end;
  for i := 0 to count - 1 do
  begin
    newTEdit := TEdit.Create(self);
    newTEdit.Parent := VLSM_input_scrollBox;
    newTEdit.Left := 260;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 60;
    newTEdit.Text := '';
    newTEdit.Tag := i + 1000;
    VLSMInputComponents.Add(newTEdit);
  end;
end;

procedure TForm1.calcVLSM(size:integer);
var
  SizeArray:array of integer;
  prefixArray:array of integer;
  AddressesArray:array of string;
  NameArray:array of string;
  netSizeInput,allHosts,addresses,powerNet,tmpSize,i,j,k:integer;
  newTEdit:TEdit;
  newTButton:TBitBtn;
  inputFullAddress,tmpName:string;
  addressCardinal:UInt32;
  inputAddress:TStringArray;
begin
  SetLength(SizeArray, size);
  SetLength(NameArray, size);
  SetLength(prefixArray, size);
  SetLength(AddressesArray, size);

  for i := 0 to size - 1 do
  begin
    for j := 0 to VLSMInputComponents.count - 1 do
    begin
      if i = TEdit(VLSMInputComponents[j]).Tag then
      begin
        if TEdit(VLSMInputComponents[j]).Text = '' then
        begin
          NameArray[i] := intToStr(i) + '. podsieť';
          TEdit(VLSMInputComponents[j]).Text := intToStr(i) + '. podsieť';
        end
        else NameArray[i] := TEdit(VLSMInputComponents[j]).Text;
      end;
      k := i + 1000;

      if k = TEdit(VLSMInputComponents[j]).Tag then
      begin
        if TEdit(VLSMInputComponents[j]).Text = '' then
        begin
          SizeArray[i] := 4;
        end
        else if not TryStrToInt(TEdit(VLSMInputComponents[j]).Text, netSizeInput) then Application.MessageBox('Musíte zadať číslo', 'Chyba', $2030)
        else if ((netSizeInput < 1) OR (netSizeInput > 8388608)) then Application.MessageBox('Číslo musí byť od 1 po 8 388 608', 'Chyba', $2030)
        else SizeArray[i] := StrToInt(TEdit(VLSMInputComponents[j]).Text) + 2;
      end;
    end;
  end;

  for i := 0 to size - 2 do
  begin
    for j := 0 to size - 2 - i do
    begin
      if SizeArray[j] < SizeArray[j + 1] then
      begin
        tmpSize := SizeArray[j];
        SizeArray[j] := SizeArray[j + 1];
        SizeArray[j + 1] := tmpSize;

        tmpName := NameArray[j];
        NameArray[j] := NameArray[j + 1];
        NameArray[j + 1] := tmpName;
      end;
    end;
  end;

  calcIPv4(VLSM_input_address.Text, false);

  inputFullAddress := SnetAddressComplet;
  inputAddress := inputFullAddress.Split('/');
  AddressesArray[0] := inputAddress[0];

  for i := 0 to size - 1 do
  begin
    powerNet := 1;
    while powerNet < SizeArray[i] do powerNet := powerNet * 2;
    prefixArray[i] := 32 - Round(ln(powerNet) / ln(2));;

    addresses :=  round(Power(2,(32 - prefixArray[i])));

    addressCardinal := addressToCardinal(AddressesArray[i]) + addresses;

    if i < size - 1 then AddressesArray[i + 1] := cardinalToAddress(addressCardinal);
  end;

  hosts := round(Power(2,(32 - StrToInt(inputAddress[1]))));
  VLSM_result_number_1.Caption := intToStr(hosts - 2);
  allHosts := 0;

  for i := 0 to size - 1 do
  begin
     allHosts := allHosts + round(Power(2,(32 - prefixArray[i])) - 2);;
  end;

  VLSM_result_number_2.Caption := IntToStr(allHosts);

  if allHosts > hosts then
  begin
    Application.MessageBox('Chyba, zadané údaje nie su správne. Počet potrebných hostov je viac ako dostupných.', 'Chyba, zlé vstupné údaje', $2030);
    VLSM_result_number_2.Caption := 'Chyba';
    exit;
  end;

  CurrentComponentList := VLSMOutputComponents;

  ClearOldVLSMOutputs();

  for i:= 0 to size - 1 do
  begin
    newTEdit := TEdit.Create(self);
    newTEdit.Parent := VLSM_output_ScroolBox;
    newTEdit.Left := 10;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 110;
    newTEdit.Text := NameArray[i];
    newTEdit.Tag := i + 1000;
    VLSMOutputComponents.Add(newTEdit);
  end;

  for i:= 0 to size - 1 do
  begin
    newTEdit := TEdit.Create(self);
    newTEdit.Parent := VLSM_output_ScroolBox;
    newTEdit.Left := 120;
    newTEdit.Top := 10 + 33 * i;
    newTEdit.Width := 150;
    newTEdit.Text := AddressesArray[i] + '/' + IntToStr(prefixArray[i]);
    newTEdit.Tag := i;
    VLSMOutputComponents.Add(newTEdit);
  end;

  for i := 0 to size - 1 do
  begin
    newTButton := TBitBtn.Create(self);
    newTButton.Parent := VLSM_output_ScroolBox;
    newTButton.Left := 270;
    newTButton.Top := 10 + 33 * i;
    newTButton.Width := 50;
    newTButton.Caption := 'IP';
    newTButton.Tag := i;
    newTButton.Glyph.LoadFromFile('icons/ip_addressation-small.bmp');
    newTButton.OnClick := @AddresationOnClick;
  end;
end;

procedure TForm1.VLSM_generate_SubnetsClick(Sender: TObject);
var
  count:integer;
begin

  if not TryStrToInt(VLSM_subnets_amount.Text, count) then Application.MessageBox('Musíte zadať číslo', 'Chyba', $2030)
  else if ((count < 1) OR (count > 128)) then Application.MessageBox('Číslo musí byť od 1 po 128', 'Chyba', $2030)
  else GenerateVLSMInputs(count);
end;

procedure TForm1.VLSM_calculate_buttonClick(Sender: TObject);
var
  count:integer;
begin
  if not TryStrToInt(VLSM_subnets_amount.Text, count) then Application.MessageBox('Musíte zadať číslo', 'Chyba', $2030)
  else if ((count < 1) OR (count > 128)) then Application.MessageBox('Číslo musí byť od 1 po 128', 'Chyba', $2030)
  else calcVLSM(count);
end;




procedure TForm1.TestFromAll_out_testClick(Sender: TObject);
begin

end;

procedure TForm1.tests_input_testChange(Sender: TObject);
begin

end;

//############################################################# Export ########################################################

procedure TForm1.export(vlsmBool:boolean);
var
  hosts,i,j:integer;
  spacer,spacerSmall:string;
  fullAddress:TStringArray;
begin
  spacer := '##########################################';
  spacerSmall := '----------------------';

  if vlsmBool then AssignFile(exportFile, 'VLSM_export.txt')
  else AssignFile(exportFile, 'FLSM_export.txt');
  rewrite(exportFile);

  writeln(exportFile, spacer);
  writeln(exportFile, 'AUTOMATICKÝ GENEROVANÝ TEXT');
  if vlsmBool then
  begin
    writeln(exportFile, 'VÝSTUP PODSIEŤOVANIA VLSM');
    writeln(exportFile, 'Variable Length Subnet Mask.');
  end
  else
  begin
    writeln(exportFile, 'VÝSTUP PODSIEŤOVANIA FLSM');
  writeln(exportFile, 'Fixed Length Subnet Mask.');
  end;
  writeln(exportFile, '');
  writeln(exportFile, spacer);
  writeln(exportFile, '');
  if vlsmBool then writeln(exportFile, 'Podieťovanie zo siete: ' + VLSM_input_address.Text)
  else writeln(exportFile, 'Podieťovanie zo siete: ' + FLSM_input.Text);
  writeln(exportFile, 'Vytvorených ' + IntToStr(CurrentComponentList.Count div 2) + ' podsietí.');
  writeln(exportFile, '');
  writeln(exportFile, spacer);

  j := 0;

  for i:= 0 to CurrentComponentList.Count - 1 do
  begin
    if TObject(CurrentComponentList[i]) is TEdit then
    begin
      if  TEdit(CurrentComponentList[i]).Tag < 999 then
      begin
        calcIPv4(TEdit(CurrentComponentList[i]).Text, true);

        FullAddress := SnetAddressComplet.Split('/');
        hosts := round(Power(2,(32 - StrToInt(FullAddress[1]))));

        writeln(exportFile, spacerSmall);
        writeln(exportFile, '');
        writeln(exportFile, IntToStr(j) + '. POSDSIEŤ:');
        writeln(exportFile, '');
        writeln(exportFile, 'NET: ' + SnetAddress);
        writeln(exportFile, 'FA:  ' + SfirstAddress);
        writeln(exportFile, 'LA:  ' + SlastAddress);
        writeln(exportFile, 'BR:  ' + SbroadcastAddress);
        writeln(exportFile, 'MSK: ' + SNetworkMask);
        writeln(exportFile, 'Počet hostov: ' + IntToStr(hosts));

        inc(j);
      end;
    end;
  end;

  writeln(exportFile, '');
  writeln(exportFile, spacer);
  writeln(exportFile, '');
  writeln(exportFile, 'https://github.com/milpet014/IPv4_calculator');
  CloseFile(exportFile);
  Application.MessageBox('Podsiete boli úspešne expertované', 'Export', $2040);
end;


procedure TForm1.VLSM_exportButtClick(Sender: TObject);
begin
  CurrentComponentList := VLSMOutputComponents;
  export(true);
end;

procedure TForm1.FLSM_exportBtnClick(Sender: TObject);
begin
  CurrentComponentList := FLSMComponents;
  export(false);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  FLSMComponents := TList.Create; //vytvorenie listu pre FLSM
  VLSMInputComponents := TList.Create;
  VLSMOutputComponents := TList.Create;
  CurrentComponentList := TList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ClearOldFLSMOutputs();  // odstráni TEdit a TBitBtn
  ClearOldVLSMInputs();
  ClearOldVLSMOutputs();
  FLSMComponents.Free; // uvoľní zoznam
  VLSMInputComponents.Free;
  VLSMOutputComponents.Free;
  CurrentComponentList.Free;
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

procedure TForm1.FLSM_new_subnets_labelClick(Sender: TObject);
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
  Application.MessageBox('Verzia Beta-1.0', 'Verzia');
end;


procedure TForm1.VLSM_header_labelClick(Sender: TObject);
begin

end;

procedure TForm1.VLSM_result_label_1Click(Sender: TObject);
begin

end;

procedure TForm1.VLSM_result_label_2Click(Sender: TObject);
begin

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

procedure TForm1.FLSM_AddressesAmountChange(Sender: TObject);
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

