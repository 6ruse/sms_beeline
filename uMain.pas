unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, StdCtrls, ExtCtrls, JPEG ,Gifimg,
  IdCookieManager, IdCookie, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, Buttons, PropStorageEh, pngimage;

type
  TfrmMain = class(TForm)
    EditURL: TEdit;
    Label1: TLabel;
    IdHTTP1: TIdHTTP;
    Image1: TImage;
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
  // ������� ����� � ������� ������������ ������
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
    JPEG: TPngImage;
    S : String ;
begin
  List:=TStringList.Create;
//  try
//    List.Text:=IdHTTP1.Get(EditURL.Text);//�������� ���������� �������� � ����������
//  except on E : Exception do
//  begin
//   ���� ���� ������ �� ���� ������ ���������)
//    MessageBox(Handle,'��������� ���������� ��� ��� ������ ���� ������!!!)))','������',MB_ICONHAND) ;
//    exit ;
//  end;
//  end;
  Stream:=TMemoryStream.Create;
  IdHTTP1.Get(EditURL.Text,Stream); //������ ����� � �����.
  Stream.Position:=0; //������������� ����������� �� ����
  Stream.SaveToFile('D:\as.jpg');
  exit;
  JPEG:=TPngImage.Create;   //������� jpeg
  JPEG.LoadFromStream(Stream);//��������� ������ �� ������
  ImageCaptcha.Picture.Assign(JPEG);//������� � Image
  List.Free ;
  JPEG.Free ;
end;


procedure TfrmMain.SpeedButton2Click(Sender: TObject);
var
  Data:TStringList;
begin
 Data:=TStringList.Create;
 Data.Add('send=');
 Data.Add('smstext='+MemoSend.Text); //����� ��� ���������
 Data.Add('smstoprefix='+ComboCod.Items[ComboCod.ItemIndex]); //������� 940, 960, 970 � �.�.
 Data.Add('smsto='+EditPhone.Text); // �����
 Data.Add('dirtysmstext='+MemoSend.Text); //����� ��� ���������
 Data.Add('confirm_key=');
 Data.Add('confirmcode='+EditCapth.Text); //��� � ��������
 Data.Add('x=33');
 Data.Add('y=11');
 try
   IdHTTP1.Post('http://mobile.beeline.kz/ru/almaty/sms/send.wbp', Data);
 except on E : exception do
 begin
  // ���� ���� ������ �� ���� ������ ���������)
    MessageBox(Handle,'��������� ���������� ��� ��� ������ ���� ������!!!)))','������',MB_ICONHAND) ;
    exit ;
 end;
 end;
 FrmRecentNumber.addPhone(ComboCod.Items[ComboCod.ItemIndex],EditPhone.Text);
 EditPhone.Clear ;
 EditCapth.Clear ;
 MemoSend.Clear ;
end;

end.
