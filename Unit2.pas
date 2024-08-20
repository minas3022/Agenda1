unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, StdCtrls, RxLookup, Mask, DBCtrls, enterautomatico,
  Criptografia, mTimeStop, AppEvnts;

type
  TForm2 = class(TForm)
    RxDBLookupCombo1: TRxDBLookupCombo;
    Senha2: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    ADOSenhaConect: TADOConnection;
    DTSenha: TDataSource;
    ADOSenha: TADOQuery;
    ADOSenhaNSENHA: TStringField;
    Senha1: TDBEdit;
    COND: TDBEdit;
    Button1: TButton;
    EnterAutomatico1: TEnterAutomatico;
    ADOSenhaNOME: TStringField;
    Button2: TButton;
    ADOSenhaEDICAO: TIntegerField;
    Cript: TCriptografia;
    Edit1: TEdit;
    Edicao1: TEdit;
    Edicao2: TEdit;
    Edicao4: TEdit;
    Edicao3: TEdit;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.DFM}
Function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key :=
'%@��23&L23D�90�I5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;

procedure LerArquivoTexto ( nomeDoArquivo: String );
var arq: TextFile;
linha: String;
begin
AssignFile ( arq, nomeDoArquivo );
Reset ( arq );
ReadLn ( arq, linha );
ReadLn ( arq, linha );
while not Eof ( arq ) do
begin
{ Processe a linha lida aqui. }
{ Para particionar a linha lida em peda�os, use a fun��o Copy. }
ReadLn ( arq, linha );
end;
CloseFile ( arq );
end;

function PasswordInputBox(const ACaption, APrompt:string): string;
var
Form: TForm;
Prompt: TLabel;
Edit: TEdit;
DialogUnits: TPoint;
ButtonTop, ButtonWidth, ButtonHeight: Integer;
Value: string;
I: Integer;
Buffer: array[0..51] of Char;
begin
Result := '';
Form := TForm.Create(Application);
with Form do
try
Canvas.Font := Font;
for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(DialogUnits));
DialogUnits.X := DialogUnits.X div 52;
BorderStyle := bsDialog;
Caption := ACaption;
ClientWidth := MulDiv(180, DialogUnits.X, 4);
ClientHeight := MulDiv(63, DialogUnits.Y, 8);
Position := poScreenCenter;
Prompt := TLabel.Create(Form);
with Prompt do
begin
Parent := Form;
AutoSize := True;
Left := MulDiv(8, DialogUnits.X, 4);
Top := MulDiv(8, DialogUnits.Y, 8);
Caption := APrompt;
end;
Edit := TEdit.Create(Form);
with Edit do
begin
Parent := Form;
Left := Prompt.Left;
Top := MulDiv(19, DialogUnits.Y, 8);
Width := MulDiv(164, DialogUnits.X, 4);
MaxLength := 255;
PasswordChar := '*';
SelectAll;
end;
ButtonTop := MulDiv(41, DialogUnits.Y, 8);
ButtonWidth := MulDiv(50, DialogUnits.X, 4);
ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
with TButton.Create(Form) do
begin
Parent := Form;
Caption := 'OK';
ModalResult := mrOk;
Default := True;
SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
end;
with TButton.Create(Form) do
begin
Parent := Form;
Caption := 'Cancel';
ModalResult := mrCancel;
Cancel := True;
SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth,ButtonHeight);
end;
if ShowModal = mrOk then
begin
Value := Edit.Text;
Result := Value;
end;
finally
Form.Free;
Form:=nil;
end;
end;
procedure TForm2.FormCreate(Sender: TObject);
var
myFile : TextFile;
text : string;
p,l,u,y,x,s,aux,aux1,m:string;
a,b,c:integer;
caminho:string;
caminho1:string;
caminho2:string;

begin

x:=Paramstr(0);
x:=ExtractFilePath(x); // OU PODE SUBSTITUIR PARA x:='c:\windows\';
// Tente abrir o Teste. txt arquivam por escrever
AssignFile(myFile, x+'c');
// Reabra o arquivo em leitura s� modo
FileMode := fmOpenRead;
Reset (myFile);

ReadLn(myFile,text);
Edicao3.text:=text;
ReadLn(myFile,text);
Edicao4.text:=text;


Edicao3.text:= Crypt('D',Edicao3.text);
Edicao4.text:= Crypt('D',Edicao4.text);
aux:=Edicao3.text;
aux1:=Edicao4.text;
Edicao3.text:=copy(aux,5,3);
Edicao4.text:=copy(aux1,5,3);
// Close the file
CloseFile(myFile);

//tratamento de erros
begin
try
strToInt(Edicao4.text);
strToInt(Edicao3.text);
except
ShowMessage('OCORREU UM ERRO');
application.Terminate;
end;
// tratamento de erros final

a:=StrToInt(Edicao3.text)+1;
Edicao3.text:=IntToStr(a);

//
AssignFile(myFile, x+'c');
ReWrite(myFile);
Edicao1.text:='5264'+Edicao3.text+'abcdumbelinosilvacarlosantonio*guaranamineiro*avenidapaulorobertocunhasantos';
Edicao2.text:='7891'+Edicao4.Text+'jklmumbelinosilvacarlosantonio*guaranamineiro*avenidapaulorobertocunhasantos';

Edicao1.text:= Crypt('C',Edicao1.text);
Edicao2.text:= Crypt('C',Edicao2.text);
WriteLn(myFile, ''+Edicao1.text);
WriteLn(myFile, ''+Edicao2.text);
// Close the file
CloseFile(myFile);

if Edicao3.text>=Edicao4.text
then
begin
ShowMessage('EXPIROU');
Application.terminate;
end
else begin
/// EVENTO DE ABERTURA

 ADOSenhaConect.Provider:='Microsoft.Jet.OLEDB.4.0;'+
 'Password="";'+
 'User ID=Admin;'+
 'Data Source='+ExtractFilePath(Application.ExeName)+'BaseAgenda.mdb;'+
 'Mode=Read|Write;'+
 'Extended Properties="";'+
 'Locale Identifier=1033;'+
 'Jet OLEDB:System database="";'+
 'Jet OLEDB:Registry Path="";'+
 'Jet OLEDB:Database Password="151171";'+
 'Jet OLEDB:Engine Type=4;'+
 'Jet OLEDB:Database Locking Mode=0;'+
 'Jet OLEDB:Global Partial Bulk Ops=2;'+
 'Jet OLEDB:Global Bulk Transactions=1;'+
 'Jet OLEDB:New Database Password="";'+
 'Jet OLEDB:Create System Database=False;'+
 'Jet OLEDB:Encrypt Database=False;'+
 'Jet OLEDB:Don'+#39+'t Copy Locale on Compact=False;'+
 'Jet OLEDB:Compact Without Replica Repair=False;'+
 'Jet OLEDB:SFP=False';
 ADOSenha.Open;

end;
end;
end;


procedure TForm2.Button1Click(Sender: TObject);
begin
if Senha2.Text=Edit1.Text then
begin
Form1.ShowModal;

end;

if Senha2.Text<>Senha1.Text then
begin
messageDlg('Senha incorreta',mtConfirmation,[mbOK],0);
Application.Terminate;
end;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
Application.Terminate
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then Button2Click(self);
end;

procedure TForm2.RxDBLookupCombo1Exit(Sender: TObject);
begin
Edit1.Text:=Cript.Descriptografar(Senha1.text)

end;



procedure TForm2.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
ShowMessage('OCORREU UM ERRO');
application.Terminate;
end;

end.
