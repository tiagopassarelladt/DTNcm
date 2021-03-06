unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, LNCM, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Utilitarios;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    DTNcm1: TDTNcm;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
i,x:integer;
begin

    Memo1.Lines.Clear;

    DTNcm1.DownloadTabelaNCM;


    Label1.Caption := 'Total de Ncms: ' + DTNcm1.RetornolistaNCM.Count.ToString;

    for I := 0 to Pred( DTNcm1.RetornolistaNCM.Count ) do
      begin
             Memo1.Lines.Add('Ncm: '         + DTNcm1.RetornolistaNCM[i].NCM);
             Memo1.Lines.Add('Descricao: '   + DTNcm1.RetornolistaNCM[i].Descricao);
             Memo1.Lines.Add('Data Inicio: ' + DateToStr( DTNcm1.RetornolistaNCM[i].DataIniciao ));
             Memo1.Lines.Add('Data Fim: '    + DateToStr( DTNcm1.RetornolistaNCM[i].DataFim ));
             Memo1.Lines.Add('Tipo Ato: '    + DTNcm1.RetornolistaNCM[i].TipoAto);
             Memo1.Lines.Add('Numero Ato: '  + DTNcm1.RetornolistaNCM[i].NumeroAto);
             Memo1.Lines.Add('Ano Ato: '     + DTNcm1.RetornolistaNCM[i].AnoAto);
             Memo1.Lines.Add('===================================================');

             Application.ProcessMessages;
      end;

end;

procedure TForm5.Button2Click(Sender: TObject);
var
i:integer;
begin
      Memo1.Lines.Clear;

      DTNcm1.DownloadTabelaNCM;

      Label1.Caption := 'Total de Ncms: ' + DTNcm1.RetornolistaNCM.Count.ToString;

    for I := 0 to Pred( DTNcm1.RetornolistaNCM.Count ) do
      begin
             Memo1.Lines.Add( 'UPDATE OR INSERT INTO TBNCM (NCM) VALUES (' + QuotedStr( DTNcm1.RetornolistaNCM[I].NCM )  + ') MATCHING (NCM);' );

             Application.ProcessMessages;
      end;
end;

end.
