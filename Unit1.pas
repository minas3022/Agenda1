unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, XDBEdit,
  XLookUp, enterautomatico, mTimeStop, Buttons, ComCtrls,
  RDprint, sButton, DBCGrids, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    BtnNovo: TBitBtn;
    BtnAlterar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnLocalizar: TBitBtn;
    BtnSair: TBitBtn;
    BtnProximo: TBitBtn;
    BtnAnterior: TBitBtn;
    BitBtn1: TBitBtn;
    DBEditNome: TDBEdit;
    DBEditEnedereco: TDBEdit;
    DBEditNumero: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditCep: TDBEdit;
    DBEditEmail: TDBEdit;
    DBEditSite: TDBEdit;
    DBMemo1: TDBMemo;
    DBEditCidade: TDBEdit;
    EDITESTADO: TDBEdit;
    ADOConnection: TADOConnection;
    ADOQryPessoa: TADOQuery;
    ADOQryPessoaNOME: TWideStringField;
    ADOQryPessoaENDERECO: TWideStringField;
    ADOQryPessoaNUMERO: TWideStringField;
    ADOQryPessoaBAIRRO: TWideStringField;
    ADOQryPessoaESTADO: TWideStringField;
    ADOQryPessoaCEP: TWideStringField;
    ADOQryPessoaCIDADE: TWideStringField;
    ADOQryPessoaTELEFONE: TWideStringField;
    ADOQryPessoaTELEFONE2: TWideStringField;
    ADOQryPessoaCELULAR: TWideStringField;
    ADOQryPessoaEMAIL: TWideStringField;
    ADOQryPessoaSITE: TWideStringField;
    ADOQryPessoaOBSERVACAO: TWideStringField;
    DTSPessoa: TDataSource;
    Timer1: TTimer;
    EnterAutomatico1: TEnterAutomatico;
    BtnSalvar: TBitBtn;
    Edit: TDBEdit;
    Edit1: TEdit;
    Usuarios: TBitBtn;
    DBEditCONTATO: TDBEdit;
    ADOQryPessoaCONTATO: TStringField;
    Label1: TLabel;
    DBEditTel: TXDBEdit;
    DBEditTel2: TXDBEdit;
    DBEditCelular: TXDBEdit;
    ADOQryPessoaTELEFONE3: TStringField;
    Label15: TLabel;
    DBEditFone2: TXDBEdit;
    Label16: TLabel;
    ADOQryPessoaDDD: TStringField;
    DBEditDDD: TXDBEdit;
    ADOQryPessoaTELEFONE4: TStringField;
    ADOQryPessoaTELEFONE5: TStringField;
    DBEditFone4: TXDBEdit;
    Label17: TLabel;
    DBEditFone5: TXDBEdit;
    Label18: TLabel;
    Button1: TButton;
    sButton1: TsButton;
    sButton2: TsButton;
    frxDBDataset1: TfrxDBDataset;
    Relatorio: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBMemo1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UsuariosClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Office97Button1Click(Sender: TObject);
    procedure Office97Button2Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3;

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin

 ADOConnection.Provider:='Microsoft.Jet.OLEDB.4.0;'+
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
 ADOQryPessoa.Open;


 

end;

procedure TForm1.BtnSairClick(Sender: TObject);
begin
ADOConnection.Connected:=false;
ADOQryPessoa.Close;
Application.Terminate;
end;

procedure TForm1.BtnNovoClick(Sender: TObject);
begin
DTSPessoa.DataSet.Insert;
DBEditNome.SetFocus;
BtnSalvar.Enabled:=true;
BtnAlterar.Enabled:=false;
end;

procedure TForm1.BtnAlterarClick(Sender: TObject);
begin
DTSPessoa.DataSet.Edit;
DBEditNome.SetFocus;
BtnSalvar.Enabled:=true;
end;

procedure TForm1.BtnSalvarClick(Sender: TObject);
begin
DTSPessoa.DataSet.Post;
DBEditNome.SetFocus;
BtnSalvar.Enabled:=false;
BtnAlterar.Enabled:=false;
end;

procedure TForm1.BtnExcluirClick(Sender: TObject);
begin
if Application.MessageBox('Tem certeza que deseja excluir o registro selecionado?', 
   'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then 
 begin 
  DTSPessoa.DataSet.Delete;
end;



end;

procedure TForm1.BtnCancelarClick(Sender: TObject);
begin
DTSPessoa.DataSet.Cancel
end;

procedure TForm1.BtnLocalizarClick(Sender: TObject);
var L:String;
begin
ADOConnection.Close;
ADOQryPessoa.Close;
ADOQryPessoa.SQL.Clear;
ADOConnection.Open;
L:=UpperCase(InputBox('- AgenTel -','Nome : ',''));
       ADOQryPessoa.close;
       ADOQryPessoa.SQL.Clear;
       ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA WHERE NOME LIKE "'+L+'%"');
       ADOQryPessoa.Open;
       DBGrid1.SetFocus;
       BtnAlterar.Enabled:=true;
if ADOQryPessoa.IsEmpty then
    ShowMessage ('Sem registro!!!');
BtnAlterar.Enabled:=true;

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
ADOConnection.Close;
ADOQryPessoa.Close;
ADOQryPessoa.SQL.Clear;
ADOConnection.Open;
ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA ORDER BY NOME ASC');
ADOQryPessoa.Open;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=VK_ESCAPE then BtnSairClick(self);
if key=VK_F2 then BtnLocalizarClick(self);

end;

procedure TForm1.BtnProximoClick(Sender: TObject);
begin
DTSPessoa.DataSet.Next
end;

procedure TForm1.BtnAnteriorClick(Sender: TObject);
begin
DTSPessoa.DataSet.Prior
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #13 then
  begin
     Perform(WM_NEXTDLGCTL,0,0);
     key:=#0;
  end;
end;

procedure TForm1.DBMemo1Exit(Sender: TObject);
begin
DBMemo1.Text:=UpperCase(DBMemo1.Text)
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
Form2.Visible:=false;
Edit1.Text:=Edit.Text;
if Edit1.text='2' then
begin
 BtnAnterior.Enabled:=true;
 BtnProximo.Enabled:=true;
 BtnLocalizar.Enabled:=true;
 BitBtn1.Enabled:=true;
 BtnNovo.Enabled:=false;
 BtnSalvar.Enabled:=false;
 BtnAlterar.Enabled:=false;
 BtnCancelar.Enabled:=false;
 Usuarios.Enabled:=false;
 end;
if Edit1.text='1' then
begin
BtnAnterior.Enabled:=true;
 BtnProximo.Enabled:=true;
 BtnLocalizar.Enabled:=true;
 BitBtn1.Enabled:=true;
 BtnNovo.Enabled:=true;
 BtnSalvar.Enabled:=false;
 BtnAlterar.Enabled:=false;
 BtnCancelar.Enabled:=true;
 Usuarios.Enabled:=false;
 end;
 if Edit1.text='3' then
begin
BtnAnterior.Enabled:=true;
 BtnProximo.Enabled:=true;
 BtnLocalizar.Enabled:=true;
 BitBtn1.Enabled:=true;
 BtnNovo.Enabled:=true;
 BtnSalvar.Enabled:=false;
 BtnAlterar.Enabled:=false;
 BtnCancelar.Enabled:=true;
 Usuarios.Enabled:=true;
 end;
 if Edit1.text='4' then
begin
BtnAnterior.Enabled:=true;
 BtnProximo.Enabled:=true;
 BtnLocalizar.Enabled:=true;
 BitBtn1.Enabled:=true;
 BtnExcluir.Enabled:=false;
 BtnNovo.Enabled:=true;
 BtnSalvar.Enabled:=false;
 BtnAlterar.Enabled:=false;
 BtnCancelar.Enabled:=true;
 Usuarios.Enabled:=false;
 end;
end;
procedure TForm1.UsuariosClick(Sender: TObject);
begin
Form3.ShowModal;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
ADOQryPessoa.Close;
  ADOQryPessoa.SQL.Clear;
  ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA');
  ADOQryPessoa.SQL.Add('ORDER BY '+Column.FieldName+' ASC');
  ADOQryPessoa.Open;
end;

procedure TForm1.Office97Button1Click(Sender: TObject);
var L:String;
begin

end;

procedure TForm1.Office97Button2Click(Sender: TObject);
var L:String;
begin
ADOConnection.Close;
ADOQryPessoa.Close;
ADOQryPessoa.SQL.Clear;
ADOConnection.Open;
L:=UpperCase(InputBox('Pesquisar','Nome aleatório : ',''));
       ADOQryPessoa.close;
       ADOQryPessoa.SQL.Clear;
       ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA WHERE NOME LIKE "%'+L+'%"');
       ADOQryPessoa.Open;
       DBGrid1.SetFocus;
       BtnAlterar.Enabled:=true;
if ADOQryPessoa.IsEmpty then
    ShowMessage ('Sem registro!!!');

end;


procedure TForm1.sButton1Click(Sender: TObject);
var L:String;
begin
ADOConnection.Close;
ADOQryPessoa.Close;
ADOQryPessoa.SQL.Clear;
ADOConnection.Open;
L:=UpperCase(InputBox('Pesquisar','Nome aleatório : ',''));
       ADOQryPessoa.close;
       ADOQryPessoa.SQL.Clear;
       ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA WHERE NOME LIKE "%'+L+'%"');
       ADOQryPessoa.Open;
       DBGrid1.SetFocus;
       BtnAlterar.Enabled:=true;
if ADOQryPessoa.IsEmpty then
    ShowMessage ('Sem registro!!!');

end;


procedure TForm1.sButton2Click(Sender: TObject);
var L:String;
begin
ADOConnection.Close;
ADOQryPessoa.Close;
ADOQryPessoa.SQL.Clear;
ADOConnection.Open;
L:=UpperCase(InputBox('- AgenTel -','Pesquisa Observações : ',''));
       ADOQryPessoa.close;
       ADOQryPessoa.SQL.Clear;
       ADOQryPessoa.SQL.Add('SELECT * FROM PESSOA WHERE OBSERVACAO LIKE "%'+L+'%"');
       ADOQryPessoa.Open;
       DBGrid1.SetFocus;
       BtnAlterar.Enabled:=true;
if ADOQryPessoa.IsEmpty then
    ShowMessage ('Sem registro!!!');
BtnAlterar.Enabled:=true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
Relatorio.ShowReport;
Relatorio.PreviewOptions.Maximized:=true;
end;

end.

procedure TForm1.EditChange(Sender: TObject);
begin


end;

end.
