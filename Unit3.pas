unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, ADODB, Criptografia, enterautomatico,
  ExtCtrls;

type
  TForm3 = class(TForm)
    ADOCadastro: TADOConnection;
    DTSCadastro: TDataSource;
    ADOQryCadastro: TADOQuery;
    ADOQryCadastroNSENHA: TStringField;
    ADOQryCadastroNOME: TStringField;
    ADOQryCadastroEDICAO: TIntegerField;
    EditNOME: TDBEdit;
    EditSENHA: TDBEdit;
    EditEDICAO: TDBEdit;
    EnterAutomatico1: TEnterAutomatico;
    Crip: TCriptografia;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}

procedure TForm3.FormCreate(Sender: TObject);
begin

 ADOCadastro.Provider:='Microsoft.Jet.OLEDB.4.0;'+
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
 ADOQryCadastro.Open;

end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ADOCadastro.Connected:=false;
ADOQryCadastro.Close;
Application.Terminate;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
Edit2.Text:=Crip.Descriptografar(EditSENHA.Text);
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Edit1.Text:=EditSENHA.Text;
EditSENHA.Text:=Crip.Criptografar(Edit1.Text);

end;

end.
