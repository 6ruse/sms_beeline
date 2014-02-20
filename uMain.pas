unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, ExtCtrls, JPEG ,Gifimg,
  IdCookieManager, IdCookie, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, Buttons, PropStorageEh, pngimage, IdSSL, IdSSLOpenSSL;

type
  TfrmMain = class(TForm)
    IdHTTP1: TIdHTTP;
    Label2: TLabel;
    Label4: TLabel;
    ComboCod: TComboBox;
    EditPhone: TEdit;
    Label5: TLabel;
    MemoSend: TMemo;
    Label6: TLabel;
    ImageCaptcha: TImage;
    EditCapth: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RegPropStorageManEh1: TRegPropStorageManEh;
    IdCookieManager1: TIdCookieManager;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EditCapthKeyPress(Sender: TObject; var Key: Char);
    procedure Label11DblClick(Sender: TObject);
    procedure EditPhoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses uRecentNumber;

{$R *.dfm}

procedure TfrmMain.EditCapthKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    SpeedButton2Click(sender) ;
end;

procedure TfrmMain.EditPhoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    FrmRecentNumber.addPhone(ComboCod.Items[ComboCod.ItemIndex],EditPhone.Text);
end;

procedure TfrmMain.Label11DblClick(Sender: TObject);
begin
  // покажем форму с выбором сохраненного номера
  frmRecentNumber.ShowModal ;
  if frmRecentNumber.ModalResult = mrOk then
  begin
     ComboCod.ItemIndex := FrmRecentNumber.itemIndexCod ;
     EditPhone.Text := FrmRecentNumber.phone;
  end;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var List: TStringList;
    Stream: TMemoryStream;
    gif:  TgifImage;
    S : String ;
begin
  List:=TStringList.Create;
  Stream:=TMemoryStream.Create;
  IdHTTP1.Get('http://mobile.beeline.kz/ru/almaty/sms/mamimg.aspx',Stream); //грузим капчу.
  Stream.Position:=0;
  gif:=TgifImage.Create;
  gif.LoadFromStream(Stream);
  ImageCaptcha.Picture.Assign(gif);//выводим в Image
  List.Free ;
  gif.Free ;
end;


procedure TfrmMain.SpeedButton2Click(Sender: TObject);
  var
    Data:TStringList;
begin
  Data:=TStringList.Create;
  Data.Add('send=');
  Data.Add('smstext='+MemoSend.Text); //Текст СМС сообщения
  Data.Add('smstoprefix='+ComboCod.Items[ComboCod.ItemIndex]); //Префикс 940, 960, 970 и т.п.
  Data.Add('smsto='+EditPhone.Text); // номер
  Data.Add('dirtysmstext='+MemoSend.Text); //Текст СМС сообщения
  Data.Add('confirm_key=');
  Data.Add('translit=on');
  Data.Add('confirmcode='+EditCapth.Text); //Код с картинки
  Data.Add('x=42');
  Data.Add('y=11');
  try
    IdHTTP1.Post('http://mobile.beeline.kz/ru/almaty/sms/send.wbp', Data);
  except on E : exception do
  begin
    MessageBox(Handle,'Во время отправки сообщения возникла ошибка','Ошибка',MB_ICONHAND) ;
    exit ;
  end;
  end;
  FrmRecentNumber.addPhone(ComboCod.Items[ComboCod.ItemIndex],EditPhone.Text);
  EditPhone.Clear ;
  EditCapth.Clear ;
  MemoSend.Clear ;
end;

end.
