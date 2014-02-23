unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, ExtCtrls, JPEG ,Gifimg,
  IdCookieManager, IdCookie, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, Buttons, PropStorageEh, pngimage, IdSSL, IdSSLOpenSSL,
  PropFilerEh, ShellAPI;

type
  TfrmMain = class(TForm)
    IdHTTP1: TIdHTTP;
    Label2: TLabel;
    Label4: TLabel;
    ComboCod: TComboBox;
    Label5: TLabel;
    MemoSend: TMemo;
    Label6: TLabel;
    ImageCaptcha: TImage;
    EditCapth: TEdit;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    RegPropStorageManEh1: TRegPropStorageManEh;
    IdCookieManager1: TIdCookieManager;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    CmbPhoneNumber: TComboBox;
    PropStorageEh1: TPropStorageEh;
    SpeedButton3: TSpeedButton;
    ChckTranslite: TCheckBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure EditCapthKeyPress(Sender: TObject; var Key: Char);
    procedure CmbPhoneNumberExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CmbPhoneNumberKeyPress(Sender: TObject; var Key: Char);
    procedure Label8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.CmbPhoneNumberExit(Sender: TObject);
begin
  if CmbPhoneNumber.Items.IndexOf(CmbPhoneNumber.Text) = -1 then
    CmbPhoneNumber.Items.Add(CmbPhoneNumber.Text);
end;

procedure TfrmMain.CmbPhoneNumberKeyPress(Sender: TObject; var Key: Char);
begin
  case key of
    '0'..'9': ; // цифры
    else
      key := #0;
  end; // case
end;

procedure TfrmMain.EditCapthKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    SpeedButton2Click(sender) ;
end;

procedure TfrmMain.Label8Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, 'http://koder.kz/', nil, nil,SW_SHOWNOACTIVATE);
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var List: TStringList;
    Stream: TMemoryStream;
    gif:  TgifImage;
    S : String ;
begin
  List:=TStringList.Create;
  Stream:=TMemoryStream.Create;
  try
    IdHTTP1.Post('http://mobile.beeline.kz/ru/almaty/sms/send.wbp', List);
    IdHTTP1.Get('http://mobile.beeline.kz/ru/almaty/sms/mamimg.aspx',Stream); //грузим капчу.
  Except on E: Exception do
    MessageBox(Handle,'Во время получения капчи возникла ошибка','Ошибка',MB_ICONHAND) ;
  end;
  Stream.Position:=0;
//  Stream.SaveToFile('D:\as.gif');
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
  Data.Add('smsto='+CmbPhoneNumber.Text); // номер
  Data.Add('dirtysmstext='+MemoSend.Text); //Текст СМС сообщения
  Data.Add('confirm_key=');
  if ChckTranslite.Checked then
    Data.Add('translit=on');
  Data.Add('confirmcode='+EditCapth.Text); //Код с картинки
  Data.Add('x=0');
  Data.Add('y=0');
  try
    IdHTTP1.Post('http://mobile.beeline.kz/ru/almaty/sms/send.wbp', Data);
  except on E : exception do
    MessageBox(Handle,'Во время отправки сообщения возникла ошибка','Ошибка',MB_ICONHAND) ;
  end;
  EditCapth.Clear ;
  MemoSend.Clear ;
end;

procedure TfrmMain.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

end.
