unit LNCM;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,FireDAC.Comp.Client,json,System.Net.HttpClient;

type TRetornoNCM = class
     StatusCode:integer;
     DataUltimaAtualizacao:TDate;
     NCM:string;
     Descricao:String;
     DataIniciao:TDate;
     DataFim:TDate;
     TipoAto:string;
     NumeroAto:string;
     AnoAto:string;
end;

type
  TDTNcm = class(TComponent)
  private
    FDiretorioRelatorio: string;
    procedure setDiretorioRelatorio(const Value: string);

  protected

  public
      RetornolistaNCM:TList<TRetornoNCM>;
      function DownloadTabelaNCM:TRetornoNCM;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
  published

  end;

  const
   URLBaseSiscomex = 'https://portalunico.siscomex.gov.br/classif/api/publico/nomenclatura/download/json';

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DT Inovacao', [TDTNcm]);
end;

{ TDTNcm }

constructor TDTNcm.Create(AOwner: TComponent);
begin
 inherited Create(AOwner);
  RetornolistaNCM := TList<TRetornoNCM>.Create;
end;

destructor TDTNcm.Destroy;
begin
  RetornolistaNCM.Clear;
  FreeAndNil(RetornolistaNCM);
  inherited Destroy;
end;

function TDTNcm.DownloadTabelaNCM: TRetornoNCM;
var
Response:iHTTPResponse;
HttpClient:THTTPClient;
JSONObject:TJSONObject;
Jsonlista:TJSONArray;
Conteudo:TStream;
obj:TJSONObject;
Lista:TRetornoNCM;
i:integer;
begin
     HttpClient := nil;
     try
         try
              Conteudo := TStream.Create;

              HttpClient := THTTPClient.Create;
              Response   := HttpClient.Get( URLBaseSiscomex );
              JSONObject := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Response.ContentAsString), 0) as TJSONObject;
              JsonLista  := JSONObject.Get('Nomenclaturas').JSONValue as TJSONArray;

              for i := 0 to Pred(JsonLista.Count) do
              begin
                    obj  := TJsonObject.ParseJSONValue(JsonLista.Items[I].ToString) as TJsonObject;

                    Lista := TRetornoNCM.Create;

                    Lista.StatusCode  := Response.StatusCode;
                    lista.NCM         := obj.GetValue('Codigo').Value.Replace('.','');
                    lista.Descricao   := obj.GetValue('Descricao').Value;
                    lista.DataIniciao := StrToDate( obj.GetValue('Data_Inicio').Value );
                    lista.DataFim     := StrToDate( obj.GetValue('Data_Fim').Value );
                    lista.TipoAto     := obj.GetValue('Tipo_Ato').Value;
                    lista.NumeroAto   := obj.GetValue('Numero_Ato').Value;
                    lista.AnoAto      := obj.GetValue('Ano_Ato').Value;

                    RetornolistaNCM.Add(Lista);
              end;

         except on e:Exception do
             begin
                  raise Exception.Create(e.Message);
             end;
         end;
     finally
         HttpClient.Free;
         Conteudo.Free;
     end;
end;

procedure TDTNcm.setDiretorioRelatorio(const Value: string);
begin
  FDiretorioRelatorio := Value;
end;

end.
